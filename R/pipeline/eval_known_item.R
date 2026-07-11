# eval_known_item.R — known-item retrieval evaluation of the semantic index (2026-07-11)
# ------------------------------------------------------------------------------
# The index's core function — "find that talk" — shipped without a retrieval
# metric. This harness runs 25 author-written known-item queries (one gold talk
# each; see eval_known_item_queries.csv) against BOTH retrieval arms and reports
# talk-level hit@1 / hit@3 / hit@5 and MRR.
#
# Anti-circularity protocol: queries were paraphrased from the SOURCE text
# (_cache/text), not from the rendered notes the index embeds; no query copies
# note phrasing; the query set is stratified across years (2009-2025), file
# formats (pdf/pptx/legacy-ppt), and OCR-recovered decks (15/25); the paper's
# worked example (2009__yohan_chalabi) is excluded because its phrasing was
# tuned interactively. Deterministic given the index (no sampling).
#
# Arms:
#   semantic — osqf_query() (nomic-embed-text 768d, HNSW cosine), chunk hits
#              aggregated to talks by max chunk score
#   bm25     — DuckDB full-text index (same PRAGMA as 07_mcp_precompute.R),
#              built on a SCRATCH COPY of the DB, mirroring the MCP server's
#              fallback path
#
#   Rscript scripts/eval_known_item.R

suppressWarnings(suppressPackageStartupMessages({
  library(data.table); library(duckdb); library(DBI)
}))
ROOT <- "."
source(file.path(ROOT, "embeddings/query.R"))

Q <- fread(file.path(ROOT, "scripts/eval_known_item_queries.csv"), encoding = "UTF-8")
K <- 60L   # deep enough that a miss is a real miss

talk_rank <- function(hits, gold) {
  # hits: data.table with slug + score (higher better) -> talk-level rank of gold
  if (is.null(hits) || !nrow(hits)) return(NA_integer_)
  tl <- hits[, .(s = max(score)), by = slug][order(-s)]
  r <- which(tl$slug %in% strsplit(gold, ";")[[1]])
  if (length(r)) min(r) else NA_integer_
}

## ---- arm 1: semantic ---------------------------------------------------------
sem_rank <- vapply(seq_len(nrow(Q)), function(i) {
  h <- tryCatch(osqf_query(Q$query[i], k = K), error = function(e) NULL)
  talk_rank(h, Q$gold_slugs[i])
}, integer(1))

## ---- arm 2: BM25 over a scratch copy -----------------------------------------
bm_rank <- rep(NA_integer_, nrow(Q))
scratch <- file.path(tempdir(), "notes_fts.duckdb")
ok_bm <- tryCatch({
  file.copy(file.path(ROOT, "embeddings/notes.duckdb"), scratch, overwrite = TRUE)
  con <- dbConnect(duckdb::duckdb(), scratch)
  on.exit(dbDisconnect(con, shutdown = TRUE), add = TRUE)
  dbExecute(con, "INSTALL fts; LOAD fts;")
  dbExecute(con, "PRAGMA create_fts_index('chunks','chunk_id','text','section', overwrite=1)")
  for (i in seq_len(nrow(Q))) {
    h <- tryCatch(as.data.table(dbGetQuery(con, sprintf(
      "SELECT slug, fts_main_chunks.match_bm25(chunk_id, '%s') AS score
       FROM chunks WHERE score IS NOT NULL ORDER BY score DESC LIMIT %d",
      gsub("'", "''", Q$query[i]), K))), error = function(e) NULL)
    bm_rank[i] <- talk_rank(h, Q$gold_slugs[i])
  }
  TRUE
}, error = function(e) { message("BM25 arm failed: ", conditionMessage(e)); FALSE })

## ---- report -------------------------------------------------------------------
metr <- function(r) c(hit1 = mean(r == 1, na.rm = FALSE) , hit3 = mean(r <= 3),
                      hit5 = mean(r <= 5), mrr = mean(ifelse(is.na(r), 0, 1 / r)))
metr2 <- function(r) { r2 <- ifelse(is.na(r), Inf, r)
  c(hit1 = mean(r2 == 1), hit3 = mean(r2 <= 3), hit5 = mean(r2 <= 5),
    mrr = round(mean(ifelse(is.finite(r2), 1 / r2, 0)), 3)) }
res <- data.table(query = Q$query, gold = Q$gold_slugs, stratum = Q$stratum,
                  sem_rank = sem_rank, bm25_rank = bm_rank)
print(res[, .(gold, sem_rank, bm25_rank)])
cat("\nSEMANTIC : ", paste(sprintf("%s=%.2f", names(metr2(sem_rank)), metr2(sem_rank)), collapse = "  "), "\n")
if (ok_bm)
  cat("BM25     : ", paste(sprintf("%s=%.2f", names(metr2(bm_rank)), metr2(bm_rank)), collapse = "  "), "\n")
cat(sprintf("\nqueries: %d · misses beyond rank %d count as 0 in MRR\n", nrow(Q), K))
fwrite(res, file.path(ROOT, "scripts/eval_known_item_results.csv"))
cat("wrote scripts/eval_known_item_results.csv\n")
