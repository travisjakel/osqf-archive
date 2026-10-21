# query.R — semantic search helper for the OSQF Conference Wiki.
#
# Usage:
#   source("./R/query.R")
#   osqf_query("optimal execution under transaction costs")
#   osqf_query("R packages for portfolio optimization")
#   osqf_query("market microstructure", filter = list(year = 2024:2025))
#   osqf_query("matrix profile", filter = list(method = "matrix profile"))
#   osqf_query("FIX protocol parsing", filter = list(file_format = "html"))
#   osqf_show(res, n = 5)

suppressPackageStartupMessages({
  library(data.table)
  library(httr2)
  library(jsonlite)
  library(duckdb)
  library(DBI)
  library(fst)
})

# ONE embedding transport for the estate. Same GGUF, same 768 dims, same
# vectors (cosine 0.99999 vs the old direct-to-Ollama call); it just resolves
# the endpoint from LLM_LOCAL_BACKEND / LLM_EMBED_URL / OLLAMA_URL instead of
# hard-coding Ollama's /api/embeddings, which llama-swap does not serve.
source("R/embed_local.R")   # embed_one/embed_texts: one transport, 768d

`%||%` <- function(a, b) if (is.null(a) || length(a) == 0) b else a

.OSQF_ROOT      <- "."
.OSQF_DB        <- file.path(.OSQF_ROOT, "embeddings", "notes.duckdb")
.OSQF_TAGS      <- file.path(.OSQF_ROOT, "embeddings", "talk_tags.fst")
.OSQF_NOTES     <- file.path(.OSQF_ROOT, "notes")
.OSQF_OLLAMA    <- Sys.getenv("OLLAMA_URL", "http://localhost:11434")
# NULL => embed_local_url() decides (llama-swap when LLM_LOCAL_BACKEND says so,
# else OLLAMA_URL). Set OSQF_WIKI_EMBED_URL only to pin this one wiki elsewhere.
.OSQF_EMBED_URL <- {
  .u <- Sys.getenv("OSQF_WIKI_EMBED_URL", "")
  if (nzchar(.u)) .u else NULL
}
.OSQF_EMBED_MODEL <- Sys.getenv("OSQF_WIKI_EMBED_MODEL", "nomic-embed-text:latest")

.osqf_embed <- function(text)
  embed_one(text, model = .OSQF_EMBED_MODEL, url = .OSQF_EMBED_URL)

.osqf_filter_sql <- function(filter) {
  if (length(filter) == 0) return("")
  parts <- character()
  for (k in names(filter)) {
    v <- filter[[k]]
    if (length(v) == 1) {
      parts <- c(parts, sprintf("%s = '%s'", k, gsub("'", "''", as.character(v))))
    } else {
      esc <- sprintf("'%s'", gsub("'", "''", as.character(v)))
      parts <- c(parts, sprintf("%s IN (%s)", k, paste(esc, collapse = ",")))
    }
  }
  paste0(" AND ", paste(parts, collapse = " AND "))
}

#' Semantic search across the OSQF Conference Wiki.
#'
#' @param query character(1) natural-language query.
#' @param k integer top-k chunks to return (default 10).
#' @param filter named list. Filterable: year, speaker_slug, file_format,
#'   status. Plus topic / method which JOIN against talk_tags.
osqf_query <- function(query, k = 10L, filter = list()) {
  emb <- .osqf_embed(query)
  emb_str <- paste0("[", paste(sprintf("%.7g", emb), collapse = ","), "]::FLOAT[768]")

  # Split out tag-based filters (topic, method)
  tag_filters <- character()
  for (kf in c("topic", "method")) {
    if (!is.null(filter[[kf]])) {
      vals <- filter[[kf]]
      slugs <- vapply(vals, function(v) {
        v <- tolower(as.character(v))
        v <- gsub("[^a-z0-9]+", "_", v)
        gsub("^_+|_+$", "", v)
      }, character(1))
      tag_filters <- c(tag_filters, slugs)
      filter[[kf]] <- NULL
    }
  }

  # Year as range
  year_clause <- ""
  if (!is.null(filter$year)) {
    yrs <- as.integer(filter$year)
    if (length(yrs) == 1) year_clause <- sprintf(" AND year = %d", yrs)
    else                  year_clause <- sprintf(" AND year IN (%s)",
                                                  paste(yrs, collapse = ","))
    filter$year <- NULL
  }

  con <- dbConnect(duckdb::duckdb(), .OSQF_DB, read_only = TRUE)
  on.exit(dbDisconnect(con, shutdown = TRUE), add = TRUE)
  dbExecute(con, "INSTALL vss; LOAD vss;")

  # Tag join: load talk_tags as a temp view
  tag_clause <- ""
  if (length(tag_filters) > 0 && file.exists(.OSQF_TAGS)) {
    tg <- as.data.table(read_fst(.OSQF_TAGS))
    matched_slugs <- unique(tg[tag_value %in% tag_filters, slug])
    if (length(matched_slugs) == 0) {
      cat("No talks match the requested topic/method filter.\n")
      return(data.table())
    }
    esc <- sprintf("'%s'", gsub("'", "''", matched_slugs))
    tag_clause <- sprintf(" AND slug IN (%s)", paste(esc, collapse = ","))
  }

  sql <- sprintf("
    SELECT
      chunk_id, slug, section,
      array_cosine_similarity(embedding, %s) AS score,
      year, speaker, speaker_slug, file_format, status,
      substr(text, 1, 400) AS snippet
    FROM chunks
    WHERE 1=1 %s %s %s
    ORDER BY score DESC
    LIMIT %d;",
    emb_str, .osqf_filter_sql(filter), year_clause, tag_clause, as.integer(k))

  res <- as.data.table(dbGetQuery(con, sql))
  if (nrow(res) > 0) {
    res[, note_path := file.path(.OSQF_NOTES, paste0(slug, ".md"))]
    res[, score := round(score, 3)]
  }
  res[]
}

#' Print osqf_query result in a human-readable format.
osqf_show <- function(res, n = 5) {
  if (nrow(res) == 0) { cat("No results.\n"); return(invisible()) }
  for (i in seq_len(min(n, nrow(res)))) {
    cat(sprintf("\n[%d] %s — %s  (%.3f)\n",
                i, res$year[i], res$slug[i], res$score[i]))
    cat(sprintf("    %s — fmt=%s — status=%s\n",
                res$speaker[i], res$file_format[i], res$status[i]))
    cat(sprintf("    section: ## %s\n", res$section[i]))
    cat("    ", substr(gsub("\\s+", " ", res$snippet[i]), 1, 240), "\n", sep = "")
    cat(sprintf("    -> %s\n", res$note_path[i]))
  }
  invisible()
}
