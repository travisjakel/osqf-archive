# assoc_wiki.R — Phase 2b: associative retrieval over a PROSE wiki via Personalized
# PageRank, native-R HippoRAG-2 design. Dense (cosine) seeds → entity graph → PPR →
# re-rank, surfacing BRIDGING pages that cosine alone misses (cross-document / cross-
# topic synthesis). Local-only: cosine embed via Ollama nomic (the wiki's own query.R).
#
# The graph is a hybrid (HippoRAG 2's "fuse dense retrieval with the graph"):
#   - STRUCTURAL edges: talk ↔ entity (topic / speaker / tag), parsed by regex from the
#     note cross-links + talk_tags — NO LLM OpenIE. Two talks sharing a topic/speaker/tag
#     are bridged through that entity node (the associative multi-hop path).
#   - DENSE edges: talk ↔ talk kNN by mean-pooled chunk-embedding cosine (baseline
#     connectivity so sparsely-tagged talks aren't isolated).
# Validated on osqf_wiki (443 talks); cfg-extensible to the other curated wikis.

suppressPackageStartupMessages({
  library(data.table); library(igraph); library(duckdb); library(DBI); library(fst)
})

`%||%` <- function(a, b) if (is.null(a) || length(a) == 0) b else a

.assoc_wiki_cfg <- list(
  osqf = list(
    db        = "./embeddings/notes.duckdb",
    notes     = "./notes",
    tags      = "./embeddings/talk_tags.fst",
    query_src = "./embeddings/query.R",
    query_fn  = "osqf_query"
  )
)

.assoc_wiki_state <- function() {
  d <- path.expand("~/R_Files/Rich_R/_state"); if (!dir.exists(d)) dir.create(d, recursive = TRUE)
  d
}

# Talk-level mean-pooled embeddings from the wiki's chunks table.
.assoc_wiki_talk_emb <- function(cfg) {
  con <- dbConnect(duckdb::duckdb(), path.expand(cfg$db), read_only = TRUE, array = "matrix")
  on.exit(dbDisconnect(con, shutdown = TRUE), add = TRUE)
  d <- dbGetQuery(con, "SELECT slug, embedding FROM chunks WHERE embedding IS NOT NULL")
  emb <- if (is.matrix(d$embedding)) d$embedding else do.call(rbind, d$embedding)  # n_chunks x 768
  dt  <- as.data.table(emb); dt[, slug := d$slug]
  agg <- dt[, lapply(.SD, mean), by = slug, .SDcols = setdiff(names(dt), "slug")]
  slugs <- agg$slug
  m <- as.matrix(agg[, !"slug"]); rownames(m) <- slugs
  m / sqrt(rowSums(m^2))                              # L2-normalize rows
}

# Structural talk↔entity edges from note cross-links + talk_tags.
.assoc_wiki_entity_edges <- function(cfg, talk_slugs) {
  nd <- path.expand(cfg$notes)
  files <- file.path(nd, paste0(talk_slugs, ".md"))
  files <- files[file.exists(files)]
  ee <- rbindlist(lapply(files, function(f) {
    slug <- sub("\\.md$", "", basename(f))
    tx <- paste(readLines(f, warn = FALSE), collapse = "\n")
    m <- regmatches(tx, gregexpr("\\.\\./(topics|speakers)/([a-z0-9_]+)\\.md\\)", tx))[[1]]
    if (!length(m)) return(NULL)
    ent <- sub("\\)$", "", sub("\\.\\./", "", m))          # "topics/foo.md" -> "topics/foo"
    ent <- sub("\\.md$", "", ent)
    data.table(talk = slug, entity = unique(ent))
  }), use.names = TRUE)
  if (file.exists(path.expand(cfg$tags))) {
    tg <- as.data.table(read_fst(path.expand(cfg$tags)))
    ee <- rbind(ee, tg[slug %in% talk_slugs, .(talk = slug, entity = paste0("tag/", tag_value))])
  }
  unique(ee)
}

#' Build the talk↔entity graph for a wiki (optionally + talk↔talk kNN dense edges). Cached.
#'
#' @param knn dense kNN edges per talk by mean-embedding cosine. 0 = entity-only
#'   (recommended: dense edges turn the sparse wiki into a hub-dominated small-world
#'   where PPR collapses to degree centrality and loses the query signal).
#' @details Entity edges are IDF-weighted: weight = log(N_talks / entity_degree), so a
#'   shared RARE topic (strong associative signal) outweighs a popular hub speaker/topic.
assoc_wiki_graph <- function(wiki = "osqf", knn = 0L, refresh = FALSE, verbose = TRUE) {
  cfg <- .assoc_wiki_cfg[[wiki]]; if (is.null(cfg)) stop("unknown wiki: ", wiki)
  cache <- file.path(.assoc_wiki_state(), sprintf("assoc_wiki_%s_knn%d.rds", wiki, knn))
  if (!refresh && file.exists(cache)) {
    g <- readRDS(cache)
    if (verbose) cat(sprintf("[assoc_wiki] cached %s: %d nodes, %d edges\n", wiki, vcount(g), ecount(g)))
    return(g)
  }
  emb   <- .assoc_wiki_talk_emb(cfg)
  talks <- rownames(emb)

  # structural talk↔entity edges, IDF-weighted (rare shared entity = strong bridge)
  ent <- .assoc_wiki_entity_edges(cfg, talks)
  ent[, deg := .N, by = entity]
  ent[, w := log(length(talks) / deg)]                 # IDF; popular hub -> ~0
  ent_edges <- ent[w > 0, .(from = paste0("talk:", talk), to = entity, weight = w)]

  edges <- ent_edges
  knn_edges <- data.table()
  if (knn > 0) {
    sim <- emb %*% t(emb); diag(sim) <- -Inf
    knn_edges <- rbindlist(lapply(seq_len(nrow(sim)), function(i) {
      o <- order(sim[i, ], decreasing = TRUE)[seq_len(knn)]
      data.table(from = paste0("talk:", talks[i]), to = paste0("talk:", talks[o]),
                 weight = pmax(0, sim[i, o]))
    }))
    edges <- rbind(knn_edges, ent_edges)
  }

  g <- graph_from_data_frame(edges[, .(from, to)], directed = FALSE)
  E(g)$weight <- edges$weight
  g <- simplify(g, edge.attr.comb = list(weight = "sum"))
  V(g)$is_talk <- startsWith(V(g)$name, "talk:")
  attr(g, "talks") <- talks
  if (verbose) cat(sprintf("[assoc_wiki] built %s: %d nodes (%d talks), %d edges (knn=%d, %d entity)\n",
                           wiki, vcount(g), length(talks), ecount(g), nrow(knn_edges), nrow(ent_edges)))
  saveRDS(g, cache)
  g
}

#' Associative wiki search: cosine seeds → Personalized PageRank over the hybrid graph.
#'
#' @param query   natural-language query
#' @param wiki    which wiki (default osqf)
#' @param k_seed  cosine seed talks (PPR restart set, mass weighted by cosine score)
#' @param top_n   talks to return
#' @param damping PPR damping. LOW (default 0.5) keeps the walk local to the seed
#'   neighbourhood — high damping (0.85) drifts to global graph hubs and loses the
#'   query signal. Combined with a 2-hop candidate restriction below.
#' @param hops    restrict candidates to within this many hops of a seed (default 2);
#'   guarantees returned talks are associatively connected to the query, not graph
#'   celebrities. Set 0 to disable.
#' @return data.table(rank, slug, ppr_score, in_cosine) — in_cosine flags whether the
#'   talk was already in the cosine top_n (FALSE = a bridging talk PPR surfaced that
#'   the bare cosine baseline missed)
assoc_wiki_search <- function(query, wiki = "osqf", k_seed = 8L, top_n = 10L,
                              damping = 0.5, hops = 2L) {
  cfg <- .assoc_wiki_cfg[[wiki]]; if (is.null(cfg)) stop("unknown wiki: ", wiki)
  if (!exists(cfg$query_fn)) source(path.expand(cfg$query_src))
  qfn <- get(cfg$query_fn)

  # cosine retrieval (chunk-level) → dedup to talk slugs, keep best score
  cos <- qfn(query, k = max(k_seed, top_n) * 4L)
  if (!nrow(cos)) return(data.table())
  cos_talks <- cos[, .(score = max(score)), by = slug][order(-score)]
  seeds        <- head(cos_talks$slug, k_seed)
  seed_score   <- head(cos_talks$score, k_seed)
  cosine_topn  <- head(cos_talks$slug, top_n)

  g <- assoc_wiki_graph(wiki, verbose = FALSE)
  seed_nodes <- paste0("talk:", seeds)
  keep <- seed_nodes %in% V(g)$name
  seed_nodes <- seed_nodes[keep]; seed_score <- seed_score[keep]
  if (!length(seed_nodes)) return(data.table())

  # personalization weighted by cosine relevance (not uniform) → walk anchors on the
  # most query-relevant talks
  pers <- rep(0, vcount(g)); names(pers) <- V(g)$name
  pers[seed_nodes] <- pmax(0, seed_score) / sum(pmax(0, seed_score))
  pr   <- page_rank(g, personalized = pers, weights = E(g)$weight, damping = damping)
  # uniform-restart baseline (≈ degree/popularity); rank by LIFT over it so the score
  # rewards seed-specific connection, not graph celebrity
  base <- page_rank(g, weights = E(g)$weight, damping = damping)
  lift <- pr$vector / (base$vector + 1e-12)

  dt <- data.table(name = V(g)$name, ppr = pr$vector, lift = lift)[startsWith(name, "talk:")]
  dt[, slug := sub("^talk:", "", name)]

  # restrict to the seeds' k-hop neighbourhood so results stay query-relevant
  if (hops > 0) {
    nb <- unique(unlist(lapply(ego(g, order = hops, nodes = seed_nodes), function(v) names(v)),
                        use.names = FALSE))
    dt <- dt[name %in% nb]
  }
  dt <- dt[!slug %in% seeds]                       # exclude the restart seeds
  setorder(dt, -lift)
  out <- head(dt, top_n)
  if (!nrow(out)) return(data.table())
  out[, `:=`(rank = .I, ppr_score = round(ppr, 6), lift = round(lift, 1),
             in_cosine = slug %in% cosine_topn)]
  out[, .(rank, slug, ppr_score, lift, in_cosine)]
}
