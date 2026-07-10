#' 07_mcp_precompute.R — build the self-contained MCP release database.
#'
#' Takes the live embeddings/notes.duckdb (chunks + paper_chunks) and produces
#' an ENRICHED copy in the release-assets dir with everything the osqf_mcp
#' server needs from a single file:
#'   talks          talk-level manifest (sanitized: no local file paths)
#'   notes          derived note markdown per talk (from the IP-gated staging
#'                  export, NOT the raw notes dir)
#'   talk_tags      topic/method tags per talk
#'   paper_links    talk -> companion-paper edges
#'   related_talks  precomputed Personalized-PageRank neighbours per talk
#'   experts        precomputed PPR speaker ranking per topic/method/tag entity
#'   about_info     build metadata
#'   + a DuckDB FTS index over chunks.text (zero-model BM25 fallback)
#'
#' PPR design mirrors assoc.R (entity-only graph, IDF edge weights, lift over
#' uniform-restart baseline, 2-hop neighbourhood restriction).
#'
#' Run AFTER 90_export_public.R (needs the gated staging notes/):
#'   Rscript scripts/90_export_public.R
#'   Rscript scripts/07_mcp_precompute.R
#'
#' Env overrides: OSQF_WIKI_ROOT, OSQF_STAGE_DIR, OSQF_ASSETS_DIR

suppressPackageStartupMessages({
  library(data.table); library(duckdb); library(DBI); library(fst); library(igraph)
})

HOME_DOCS <- path.expand("~")
ROOT   <- Sys.getenv("OSQF_WIKI_ROOT",  file.path(HOME_DOCS, "R_Files", "osqf_wiki"))
STAGE  <- Sys.getenv("OSQF_STAGE_DIR",  file.path(HOME_DOCS, "public_exports", "osqf-archive"))
ASSETS <- Sys.getenv("OSQF_ASSETS_DIR", file.path(HOME_DOCS, "public_exports", "_release_assets_v0.1"))

LIVE_DB <- file.path(ROOT, "embeddings", "notes.duckdb")
OUT_DB  <- file.path(ASSETS, "notes.duckdb")

stopifnot(file.exists(LIVE_DB), dir.exists(file.path(STAGE, "notes")))
dir.create(ASSETS, recursive = TRUE, showWarnings = FALSE)

# ---- 1. fresh copy of the live db (chunks + paper_chunks travel with it) ------
if (file.exists(OUT_DB)) unlink(OUT_DB)
wal <- paste0(OUT_DB, ".wal"); if (file.exists(wal)) unlink(wal)
stopifnot(file.copy(LIVE_DB, OUT_DB))
cat(sprintf("copied live db -> %s (%.1f MB)\n", OUT_DB, file.size(OUT_DB) / 2^20))

con <- dbConnect(duckdb::duckdb(), OUT_DB)
on.exit(dbDisconnect(con, shutdown = TRUE), add = TRUE)

# ---- 2. talks (sanitized manifest) ---------------------------------------------
man <- as.data.table(read_fst(file.path(ROOT, "manifest.fst")))
talks <- man[, .(slug, year, speaker = speaker_raw, speaker_slug, title,
                 talk_type, time_slot, file_url, file_ext, download_status)]
setorder(talks, year, slug)
dbWriteTable(con, "talks", talks, overwrite = TRUE)

# ---- 3. notes (gated markdown from the staging export) -------------------------
note_files <- list.files(file.path(STAGE, "notes"), pattern = "\\.md$", full.names = TRUE)
notes <- rbindlist(lapply(note_files, function(f) {
  data.table(slug = sub("\\.md$", "", basename(f)),
             markdown = paste(readLines(f, warn = FALSE, encoding = "UTF-8"),
                              collapse = "\n"))
}))
dbWriteTable(con, "notes", notes, overwrite = TRUE)

# ---- 4. talk_tags + paper_links -------------------------------------------------
tags <- as.data.table(read_fst(file.path(ROOT, "embeddings", "talk_tags.fst")))
dbWriteTable(con, "talk_tags", tags, overwrite = TRUE)
pl_path <- file.path(ROOT, "embeddings", "paper_links.fst")
if (file.exists(pl_path)) {
  dbWriteTable(con, "paper_links", as.data.table(read_fst(pl_path)), overwrite = TRUE)
}

# ---- 5. entity graph (same design as assoc.R: entity-only, IDF weights) --------
talk_slugs <- unique(notes$slug)
ent <- rbindlist(lapply(note_files, function(f) {
  slug <- sub("\\.md$", "", basename(f))
  tx <- paste(readLines(f, warn = FALSE, encoding = "UTF-8"), collapse = "\n")
  m <- regmatches(tx, gregexpr("\\.\\./(topics|speakers)/([a-z0-9_]+)\\.md\\)", tx))[[1]]
  if (!length(m)) return(NULL)
  e <- sub("\\.md$", "", sub("\\)$", "", sub("\\.\\./", "", m)))
  # multibyte chars shift regmatches offsets on some notes -> drop any
  # extraction that isn't a clean entity path
  e <- e[grepl("^(topics|speakers)/[a-z0-9_]+$", e)]
  if (!length(e)) return(NULL)
  data.table(talk = slug, entity = unique(e))
}), use.names = TRUE)
ent <- rbind(ent, tags[slug %in% talk_slugs, .(talk = slug, entity = paste0("tag/", tag_value))])
ent <- unique(ent)
ent[, deg := .N, by = entity]
ent[, w := log(length(talk_slugs) / deg)]
edges <- ent[w > 0, .(from = paste0("talk:", talk), to = entity, weight = w)]

g <- graph_from_data_frame(edges[, .(from, to)], directed = FALSE)
E(g)$weight <- edges$weight
g <- simplify(g, edge.attr.comb = list(weight = "sum"))
node_names <- V(g)$name
is_talk_node <- startsWith(node_names, "talk:")
base <- page_rank(g, weights = E(g)$weight, damping = 0.5)$vector
cat(sprintf("graph: %d nodes (%d talks), %d edges\n",
            vcount(g), sum(is_talk_node), ecount(g)))

.ppr_from <- function(seed_node, hops = 2L) {
  pers <- rep(0, vcount(g)); names(pers) <- node_names
  pers[seed_node] <- 1
  pr <- page_rank(g, personalized = pers, weights = E(g)$weight, damping = 0.5)$vector
  lift <- pr / (base + 1e-12)
  nb <- names(ego(g, order = hops, nodes = seed_node)[[1]])
  dt <- data.table(name = node_names, lift = lift)[name %in% nb]
  dt[startsWith(name, "talk:")][name != seed_node][order(-lift)]
}

# ---- 6. related_talks: top-10 PPR neighbours per talk ---------------------------
talk_nodes <- node_names[is_talk_node]
related <- rbindlist(lapply(talk_nodes, function(tn) {
  r <- head(.ppr_from(tn), 10L)
  if (!nrow(r)) return(NULL)
  data.table(slug = sub("^talk:", "", tn), rank = seq_len(nrow(r)),
             related_slug = sub("^talk:", "", r$name), lift = round(r$lift, 2))
}))
dbWriteTable(con, "related_talks", related, overwrite = TRUE)
cat(sprintf("related_talks: %d rows for %d talks\n", nrow(related), uniqueN(related$slug)))

# ---- 7. experts: PPR speaker ranking per topic/method/tag entity ----------------
speaker_of <- talks[, .(slug, speaker, speaker_slug)]
ent_nodes <- setdiff(node_names[!is_talk_node],
                     grep("^speakers/", node_names, value = TRUE))
experts <- rbindlist(lapply(ent_nodes, function(en) {
  r <- .ppr_from(en)
  if (!nrow(r)) return(NULL)
  r[, slug := sub("^talk:", "", name)]
  sp <- merge(r, speaker_of, by = "slug")[!is.na(speaker_slug) & nzchar(speaker_slug)]
  if (!nrow(sp)) return(NULL)
  agg <- sp[, .(score = sum(lift), n_talks = .N,
                speaker = first(speaker)), by = speaker_slug][order(-score)]
  head(agg, 10L)[, .(entity = en, rank = .I, speaker, speaker_slug,
                     score = round(score, 2), n_talks)]
}))
dbWriteTable(con, "experts", experts, overwrite = TRUE)
cat(sprintf("experts: %d rows for %d entities\n", nrow(experts), uniqueN(experts$entity)))

# ---- 8. FTS index (zero-model BM25 fallback) ------------------------------------
dbExecute(con, "INSTALL fts; LOAD fts;")
dbExecute(con, "PRAGMA create_fts_index('chunks', 'chunk_id', 'text', 'section', overwrite=1)")
cat("FTS index built over chunks(text, section)\n")

# ---- 9. about_info ---------------------------------------------------------------
counts <- list(
  n_talks_manifest = nrow(talks), n_notes = nrow(notes),
  n_chunks   = dbGetQuery(con, "SELECT count(*) n FROM chunks")$n,
  n_paper_chunks = tryCatch(dbGetQuery(con, "SELECT count(*) n FROM paper_chunks")$n,
                            error = function(e) 0L),
  n_tags = nrow(tags), n_related = nrow(related), n_experts = nrow(experts))
about <- data.table(
  k = c("product", "version", "built", "coverage", names(counts), "provenance", "license"),
  v = c("osqf-archive MCP database",
            "v0.1",
            format(Sys.Date()),
            "18 years of osQF / R-in-finance conference talks (2009-2026)",
            as.character(unlist(counts)),
            "Derived notes + embeddings from publicly posted conference decks; original PDFs are NOT redistributed - use file_url links.",
            "MIT (code); derived notes CC-BY-4.0 with speaker attribution"))
setnames(about, c("k", "v"), c("key", "value"))
dbWriteTable(con, "about_info", about, overwrite = TRUE)

dbExecute(con, "CHECKPOINT")
cat(sprintf("\nDONE: %s (%.1f MB)\n", OUT_DB, file.size(OUT_DB) / 2^20))
for (t in dbGetQuery(con, "SHOW TABLES")$name)
  cat(sprintf("  %-16s %8d rows\n", t,
              dbGetQuery(con, sprintf('SELECT count(*) n FROM "%s"', t))$n))
