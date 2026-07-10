#' 06_harvest_papers.R — companion-paper harvest (open-access first pass).
#'
#' Scans the talk text cache for resolvable paper links (arXiv / SSRN / DOI),
#' politely fetches OPEN-ACCESS PDFs (arXiv always; SSRN tolerated-fail — it
#' blocks bots; bare DOIs recorded as metadata-only), extracts text, embeds
#' page-level chunks into notes.duckdb table `paper_chunks`, and writes the
#' talk→paper edge table `embeddings/paper_links.fst` (future wiki_assoc edges).
#'
#' Posture (same as decks): index + short quotes + link back. PDFs live in
#' _cache/papers/ and are NEVER exported/redistributed.
#' Idempotent: skips downloaded PDFs and already-embedded (paper_id, page).

suppressPackageStartupMessages({
  library(fst); library(jsonlite); library(duckdb); library(DBI); library(digest)
})
source("R/pipeline/00_helpers.R")

PAPER_PDF  <- file.path(WIKI_ROOT, "_cache", "papers")
PAPER_TXT  <- file.path(WIKI_ROOT, "_cache", "papers_text")
LINKS_FST  <- file.path(WIKI_ROOT, "embeddings", "paper_links.fst")
MANIFEST   <- file.path(WIKI_ROOT, "embeddings", "papers_manifest.fst")
DB_PATH    <- file.path(WIKI_ROOT, "embeddings", "notes.duckdb")
OLLAMA_URL <- Sys.getenv("OLLAMA_URL", "http://localhost:11434")
EMBED_MODEL <- "nomic-embed-text:latest"
for (d in c(PAPER_PDF, PAPER_TXT)) dir.create(d, showWarnings = FALSE, recursive = TRUE)

# ---- 1. Scan text cache for resolvable links ---------------------------------
txts <- list.files(TEXT_DIR, pattern = "\\.txt$", full.names = TRUE)
pat <- "(arxiv\\.org/(abs|pdf)/[0-9]{4}\\.[0-9]{4,5}(v[0-9]+)?|ssrn\\.com/abstract(_id)?=?[0-9]{6,8}|doi\\.org/10\\.[0-9]{4,5}/[^ )\"\\]>]+)"

links <- rbindlist(lapply(txts, function(p) {
  txt <- paste(readLines(p, warn = FALSE, encoding = "UTF-8"), collapse = "\n")
  m <- unique(regmatches(txt, gregexpr(pat, txt, ignore.case = TRUE, perl = TRUE))[[1]])
  if (!length(m)) return(NULL)
  data.table(slug = gsub("\\.txt$", "", basename(p)), raw = m)
}))
links[, raw := gsub("[.,;)]+$", "", raw)]

norm_one <- function(raw) {
  r <- tolower(raw)
  if (grepl("arxiv\\.org", r)) {
    id <- sub(".*arxiv\\.org/(abs|pdf)/", "", r)
    list(kind = "arxiv", id = sub("v[0-9]+$", "", id),
         pdf_url = paste0("https://arxiv.org/pdf/", id))
  } else if (grepl("ssrn\\.com", r)) {
    id <- gsub("[^0-9]", "", sub(".*abstract", "", r))
    list(kind = "ssrn", id = id,
         pdf_url = sprintf("https://papers.ssrn.com/sol3/Delivery.cfm?abstractid=%s", id))
  } else {
    list(kind = "doi", id = sub(".*doi\\.org/", "", r), pdf_url = NA_character_)
  }
}
nm <- rbindlist(lapply(links$raw, norm_one))
links <- cbind(links, nm)
links[, paper_id := paste0(kind, "_", gsub("[^a-z0-9.]", "_", id))]

papers <- links[, .(slugs = paste(unique(slug), collapse = ";"),
                    n_talks = uniqueN(slug)), by = .(paper_id, kind, id, pdf_url)]
cat(sprintf("== 06_harvest_papers == %d unique papers from %d talks (%s)\n",
            nrow(papers), links[, uniqueN(slug)],
            paste(papers[, .N, by = kind][, sprintf("%d %s", N, kind)], collapse = ", ")))

# ---- 2. Polite download (arxiv + ssrn attempts; doi = metadata only) ----------
dl <- papers[!is.na(pdf_url)]
for (i in seq_len(nrow(dl))) {
  out <- file.path(PAPER_PDF, paste0(dl$paper_id[i], ".pdf"))
  if (file.exists(out) && file.size(out) > 10000) next
  resp <- tryCatch(
    httr2::request(dl$pdf_url[i]) |>
      httr2::req_user_agent("osqf-archive/0.1 (research indexing; contact via github.com/travisjakel/osqf-archive)") |>
      httr2::req_timeout(60) |>
      httr2::req_error(is_error = function(r) FALSE) |>
      httr2::req_perform(),
    error = function(e) NULL)
  ok <- !is.null(resp) && httr2::resp_status(resp) == 200 &&
        grepl("pdf", httr2::resp_content_type(resp) %||% "", ignore.case = TRUE)
  if (ok) writeBin(httr2::resp_body_raw(resp), out)
  cat(sprintf("  [%d/%d] %s %s\n", i, nrow(dl), dl$paper_id[i],
              fifelse(ok, "OK", "unavailable")))
  Sys.sleep(3)  # politeness
}

papers[, pdf_path := file.path(PAPER_PDF, paste0(paper_id, ".pdf"))]
papers[, has_pdf := file.exists(pdf_path) & file.size(pdf_path) > 10000]
cat(sprintf("PDFs on disk: %d/%d\n", papers[has_pdf == TRUE, .N], nrow(papers)))

# ---- 3. Text extraction (page-level) ------------------------------------------
for (i in which(papers$has_pdf)) {
  outt <- file.path(PAPER_TXT, paste0(papers$paper_id[i], ".txt"))
  if (file.exists(outt)) next
  pg <- tryCatch(pdftools::pdf_text(papers$pdf_path[i]), error = function(e) NULL)
  if (is.null(pg)) { papers$has_pdf[i] <- FALSE; next }
  writeLines(paste(pg, collapse = "\n--- PAGE BREAK ---\n"), outt, useBytes = TRUE)
}

# ---- 4. Embed page chunks into paper_chunks -----------------------------------
embed_one <- function(text) {
  resp <- tryCatch(
    httr2::request(OLLAMA_URL) |>
      httr2::req_url_path("/api/embeddings") |>
      httr2::req_body_json(list(model = EMBED_MODEL, prompt = text), auto_unbox = TRUE) |>
      httr2::req_timeout(60) |> httr2::req_perform(),
    error = function(e) NULL)
  if (is.null(resp) || httr2::resp_status(resp) >= 400) return(NULL)
  as.numeric(httr2::resp_body_json(resp)$embedding)
}

con <- dbConnect(duckdb::duckdb(), DB_PATH)
on.exit(dbDisconnect(con, shutdown = TRUE), add = TRUE)
dbExecute(con, "INSTALL vss; LOAD vss;")
dbExecute(con, "SET hnsw_enable_experimental_persistence = true;")
dbExecute(con, "
  CREATE TABLE IF NOT EXISTS paper_chunks (
    chunk_id VARCHAR PRIMARY KEY, paper_id VARCHAR, kind VARCHAR, page INTEGER,
    text TEXT, text_hash VARCHAR, src_slugs VARCHAR, embedding FLOAT[768]);")
have <- dbGetQuery(con, "SELECT chunk_id FROM paper_chunks")$chunk_id

n_new <- 0L
for (i in which(papers$has_pdf)) {
  txt <- readLines(file.path(PAPER_TXT, paste0(papers$paper_id[i], ".txt")),
                   warn = FALSE, encoding = "UTF-8")
  pages <- strsplit(paste(txt, collapse = "\n"), "\n--- PAGE BREAK ---\n", fixed = TRUE)[[1]]
  for (pg in seq_along(pages)) {
    t <- substr(trimws(pages[pg]), 1, 4000)
    if (nchar(t) < 100) next
    cid <- sprintf("%s::p%03d", papers$paper_id[i], pg)
    if (cid %in% have) next
    emb <- embed_one(t)
    if (is.null(emb) || length(emb) != 768L) next
    emb_str <- paste0("[", paste(sprintf("%.7g", emb), collapse = ","), "]")
    dbExecute(con, sprintf("
      INSERT OR REPLACE INTO paper_chunks VALUES ($1,$2,$3,$4,$5,$6,$7, %s);", emb_str),
      params = list(cid, papers$paper_id[i], papers$kind[i], pg, t,
                    digest(t, algo = "sha1"), papers$slugs[i]))
    n_new <- n_new + 1L
  }
}
idx <- dbGetQuery(con, "SELECT index_name FROM duckdb_indexes() WHERE table_name='paper_chunks'")
if (!"paper_chunks_emb_idx" %in% idx$index_name && n_new > 0)
  dbExecute(con, "CREATE INDEX paper_chunks_emb_idx ON paper_chunks USING HNSW (embedding) WITH (metric='cosine');")

# ---- 5. Persist manifest + edges ----------------------------------------------
write_fst(papers[, .(paper_id, kind, id, pdf_url, n_talks, slugs, has_pdf)], MANIFEST)
write_fst(unique(links[, .(slug, paper_id, kind)]), LINKS_FST)
tot <- dbGetQuery(con, "SELECT COUNT(*) n, COUNT(DISTINCT paper_id) p FROM paper_chunks")
cat(sprintf("paper_chunks: +%d new | total %d chunks / %d papers | edges: %d\n",
            n_new, tot$n, tot$p, nrow(unique(links[, .(slug, paper_id)]))))
