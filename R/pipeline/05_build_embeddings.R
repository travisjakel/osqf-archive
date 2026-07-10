# 05_build_embeddings.R — chunk notes by H2, embed via Ollama nomic-embed-text,
# store in DuckDB with vss HNSW. Idempotent: re-embeds only when text_hash
# changes. Topic/method tags persisted in a sidecar talk_tags.fst (joined at
# query time) so the chunks table doesn't row-explode.

suppressPackageStartupMessages({
  library(data.table)
  library(fst)
  library(httr2)
  library(jsonlite)
  library(digest)
  library(duckdb)
  library(DBI)
})

source("R/pipeline/00_helpers.R")

DB_PATH       <- file.path(WIKI_ROOT, "embeddings", "notes.duckdb")
TAGS_PATH     <- file.path(WIKI_ROOT, "embeddings", "talk_tags.fst")
OLLAMA_URL    <- Sys.getenv("OLLAMA_URL", "http://localhost:11434")
EMBED_MODEL   <- Sys.getenv("OSQF_WIKI_EMBED_MODEL", "nomic-embed-text:latest")
EMBED_DIM     <- 768L

cat("== 05_build_embeddings.R ==\n")
cat(sprintf("Embed model: %s (dim=%d)\n", EMBED_MODEL, EMBED_DIM))
cat(sprintf("DB path    : %s\n", DB_PATH))

con <- dbConnect(duckdb::duckdb(), DB_PATH)
on.exit(dbDisconnect(con, shutdown = TRUE), add = TRUE)
dbExecute(con, "INSTALL vss; LOAD vss;")
dbExecute(con, "SET hnsw_enable_experimental_persistence = true;")

dbExecute(con, sprintf("
  CREATE TABLE IF NOT EXISTS chunks (
    chunk_id     VARCHAR PRIMARY KEY,
    slug         VARCHAR,
    section      VARCHAR,
    text         TEXT,
    text_hash    VARCHAR,
    year         INTEGER,
    speaker      VARCHAR,
    speaker_slug VARCHAR,
    file_format  VARCHAR,
    status       VARCHAR,
    embedding    FLOAT[%d]
  );", EMBED_DIM))

# ---- Helpers ----------------------------------------------------------------

parse_frontmatter <- function(lines) {
  if (length(lines) < 3 || lines[1] != "---") return(list())
  end <- which(lines[-1] == "---")[1] + 1
  if (is.na(end)) return(list())
  body <- lines[2:(end - 1)]
  fm <- list()
  for (line in body) {
    parts <- regmatches(line, regexpr("^[a-zA-Z_][a-zA-Z0-9_]*:", line))
    if (length(parts) == 0) next
    key <- sub(":$", "", parts[1])
    val <- sub("^[a-zA-Z_][a-zA-Z0-9_]*:\\s*", "", line)
    val <- gsub('^"|"$', "", val)
    fm[[key]] <- val
  }
  fm$.body_start <- end + 1
  fm
}

chunk_by_h2 <- function(lines, body_start) {
  body <- lines[body_start:length(lines)]
  h2_idx <- grep("^## ", body)
  if (length(h2_idx) == 0)
    return(list(list(section = "body", text = paste(body, collapse = "\n"))))
  starts <- h2_idx
  ends   <- c(h2_idx[-1] - 1, length(body))
  out <- vector("list", length(starts))
  for (i in seq_along(starts)) {
    section <- sub("^## ", "", body[starts[i]])
    text <- paste(body[starts[i]:ends[i]], collapse = "\n")
    out[[i]] <- list(section = section, text = text)
  }
  out
}

ollama_embed <- function(text, model = EMBED_MODEL, timeout = 60) {
  resp <- tryCatch(
    httr2::request(OLLAMA_URL) |>
      httr2::req_url_path("/api/embeddings") |>
      httr2::req_body_json(list(model = model, prompt = text), auto_unbox = TRUE) |>
      httr2::req_timeout(timeout) |>
      httr2::req_perform(),
    error = function(e) e
  )
  if (inherits(resp, "error")) return(NULL)
  if (httr2::resp_status(resp) >= 400) return(NULL)
  j <- httr2::resp_body_json(resp)
  as.numeric(j$embedding)
}

# ---- Walk notes/ ------------------------------------------------------------
md_files <- list.files(NOTES_DIR, pattern = "\\.md$", full.names = TRUE)
cat(sprintf("Notes found: %d\n", length(md_files)))
if (length(md_files) == 0) {
  cat("No notes — run 04_render_pages.R first.\n"); quit(save = "no")
}

# Existing chunk hashes
existing <- as.data.table(dbGetQuery(con, "SELECT chunk_id, text_hash FROM chunks"))
existing_hash <- if (nrow(existing) > 0)
  setNames(existing$text_hash, existing$chunk_id) else character()

n_new <- 0L; n_skip <- 0L; n_fail <- 0L
batch_rows <- list()

flush_batch <- function() {
  if (length(batch_rows) == 0) return(invisible())
  bdt <- rbindlist(batch_rows, fill = TRUE)
  for (i in seq_len(nrow(bdt))) {
    emb_str <- paste0("[", paste(sprintf("%.7g", bdt$embedding[[i]]), collapse = ","), "]")
    dbExecute(con, sprintf("
      INSERT OR REPLACE INTO chunks
      (chunk_id, slug, section, text, text_hash, year, speaker, speaker_slug,
       file_format, status, embedding)
      VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, %s);", emb_str),
      params = list(
        bdt$chunk_id[i], bdt$slug[i], bdt$section[i], bdt$text[i], bdt$text_hash[i],
        as.integer(bdt$year[i]), bdt$speaker[i], bdt$speaker_slug[i],
        bdt$file_format[i], bdt$status[i]
      ))
  }
  batch_rows <<- list()
}

# Tag rows accumulator
tag_rows <- list()

# All chunk_ids that SHOULD exist after this run (embeddable sections of
# non-skipped notes) — used post-walk to delete stale orphans left behind
# when a re-extraction (e.g. the OCR pass) changes a note's section set.
valid_ids <- character()

for (f in md_files) {
  lines <- readLines(f, warn = FALSE, encoding = "UTF-8")
  fm <- parse_frontmatter(lines)
  if (length(fm) == 0 || is.null(fm$.body_start)) next
  slug <- tools::file_path_sans_ext(basename(f))

  status <- as.character(fm$status %||% "")
  # Skip embedding for failed/no_file notes (they have no real content)
  if (status %in% c("extraction_failed", "no_file")) next

  yr <- suppressWarnings(as.integer(fm$year))
  speaker <- fm$speaker %||% ""
  speaker_slug <- fm$speaker_slug %||% ""
  file_format <- fm$file_format %||% ""

  # Tag the talk based on tags frontmatter (osqf + year + speaker_slug + topic_slugs)
  tag_field <- fm$tags %||% ""
  tag_field <- gsub("^\\[|\\]$", "", tag_field)
  toks <- trimws(strsplit(tag_field, ",", fixed = TRUE)[[1]])
  toks <- toks[nzchar(toks) & !toks %in% c("osqf", as.character(yr), speaker_slug)]
  if (length(toks) > 0) {
    tag_rows[[length(tag_rows) + 1L]] <- data.table(
      slug = slug, tag_value = toks
    )
  }

  chunks <- chunk_by_h2(lines, fm$.body_start)
  for (ch in chunks) {
    txt <- ch$text
    if (nchar(txt) > 4000) txt <- substr(txt, 1, 4000)
    if (nchar(txt) < 30) next
    h <- digest::digest(txt, algo = "sha1")
    chunk_id <- paste0(slug, "::", ch$section)
    valid_ids <- c(valid_ids, chunk_id)
    prior_h <- existing_hash[chunk_id]
    if (length(prior_h) == 1 && !is.na(prior_h) && identical(unname(prior_h), h)) {
      n_skip <- n_skip + 1L; next
    }
    emb <- ollama_embed(txt)
    if (is.null(emb) || length(emb) != EMBED_DIM) {
      n_fail <- n_fail + 1L; next
    }
    batch_rows[[length(batch_rows) + 1L]] <- list(
      chunk_id     = chunk_id,
      slug         = slug,
      section      = ch$section,
      text         = txt,
      text_hash    = h,
      year         = yr,
      speaker      = speaker,
      speaker_slug = speaker_slug,
      file_format  = file_format,
      status       = status,
      embedding    = list(emb)
    )
    n_new <- n_new + 1L
    if (length(batch_rows) >= 50) flush_batch()
  }
}
flush_batch()

# ---- Delete stale orphan chunks ----------------------------------------------
# INSERT OR REPLACE never deletes: when a note's section set changes (OCR
# re-extraction), old slug::section rows would linger and pollute retrieval.
n_stale <- 0L
if (length(valid_ids) > 0 && nrow(existing) > 0) {
  stale <- setdiff(existing$chunk_id, valid_ids)
  if (length(stale) > 0.4 * nrow(existing)) {
    cat(sprintf("WARNING: %d/%d chunks look stale — notes/ may be partial; SKIPPING delete.\n",
                length(stale), nrow(existing)))
    stale <- character()
  }
  if (length(stale) > 0) {
    dbWriteTable(con, "stale_ids", data.frame(chunk_id = stale),
                 temporary = TRUE, overwrite = TRUE)
    n_stale <- dbExecute(con,
      "DELETE FROM chunks WHERE chunk_id IN (SELECT chunk_id FROM stale_ids)")
    cat(sprintf("Deleted %d stale orphan chunks\n", n_stale))
  }
}

# ---- Persist talk_tags sidecar ----------------------------------------------
if (length(tag_rows) > 0) {
  tags <- unique(rbindlist(tag_rows))
  write_fst(tags, TAGS_PATH)
  cat(sprintf("Wrote talk_tags.fst (%d slug-tag rows)\n", nrow(tags)))
}

# ---- HNSW index -------------------------------------------------------------
existing_idx <- as.data.table(dbGetQuery(con, "
  SELECT index_name FROM duckdb_indexes() WHERE table_name='chunks'"))
if (!"chunks_emb_idx" %in% existing_idx$index_name) {
  cat("Building HNSW index...\n")
  dbExecute(con, "CREATE INDEX chunks_emb_idx ON chunks USING HNSW (embedding) WITH (metric = 'cosine');")
}

n_chunks <- dbGetQuery(con, "SELECT COUNT(*) AS n FROM chunks")$n
cat(sprintf("\nNew embedded: %d\nSkipped     : %d\nFailed      : %d\nTotal in DB : %d\n",
            n_new, n_skip, n_fail, n_chunks))
