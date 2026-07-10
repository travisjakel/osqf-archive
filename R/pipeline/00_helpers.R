# 00_helpers.R — shared utilities for the OSQF Conference Wiki pipeline.
# Sourced by stages 01-05.

suppressPackageStartupMessages({
  library(data.table)
  library(httr2)
  library(rvest)
  library(xml2)
  library(stringi)
})

setDTthreads(1)
options(fst.threads = 1)

`%||%` <- function(a, b) if (is.null(a) || length(a) == 0) b else a

# ---- Paths -------------------------------------------------------------------
OSQF_BASE  <- "https://www.osqf.org"
WIKI_ROOT  <- path.expand(".")
FILES_DIR  <- file.path(WIKI_ROOT, "_cache", "files")
# OSQF_TEXT_DIR / OSQF_JSON_DIR overrides exist for scratch runs (OCR bake-off);
# unset = production paths.
TEXT_DIR   <- Sys.getenv("OSQF_TEXT_DIR", file.path(WIKI_ROOT, "_cache", "text"))
JSON_DIR   <- Sys.getenv("OSQF_JSON_DIR", file.path(WIKI_ROOT, "_cache", "json"))
HTTP_CACHE <- file.path(WIKI_ROOT, "_cache", "http_cache")
SHA1_CACHE <- file.path(WIKI_ROOT, "_cache", "anthropic_sha1")
NOTES_DIR  <- file.path(WIKI_ROOT, "notes")
YEARS_DIR  <- file.path(WIKI_ROOT, "years")
SPK_DIR    <- file.path(WIKI_ROOT, "speakers")
TOPICS_DIR <- file.path(WIKI_ROOT, "topics")
METHODS_DIR<- file.path(WIKI_ROOT, "methods")

for (d in c(FILES_DIR, TEXT_DIR, JSON_DIR, HTTP_CACHE, SHA1_CACHE,
            NOTES_DIR, YEARS_DIR, SPK_DIR, TOPICS_DIR, METHODS_DIR)) {
  if (!dir.exists(d)) dir.create(d, recursive = TRUE, showWarnings = FALSE)
}

# ---- Slug utilities ----------------------------------------------------------

# Strip non-ASCII (accents -> ASCII), lowercase, [^a-z0-9]+ -> _, trim _.
slugify <- function(x) {
  if (length(x) == 0) return(character(0))
  x <- as.character(x)
  x <- stringi::stri_trans_general(x, "Any-Latin; Latin-ASCII")
  x <- tolower(x)
  x <- gsub("[^a-z0-9]+", "_", x)
  x <- gsub("^_+|_+$", "", x)
  x
}

# Speaker name -> slug. Strips title prefixes and dots; multiple speakers joined
# with "_and_". Order is preserved (no surname-first reordering).
slugify_speaker <- function(name) {
  if (length(name) == 0) return("")
  name <- as.character(name)[1]
  if (is.na(name) || !nzchar(name)) return("")
  parts <- strsplit(name, "\\s*(,| and | & |/|;)\\s*", perl = TRUE)[[1]]
  parts <- parts[nzchar(parts)]
  cleaned <- vapply(parts, function(p) {
    p <- gsub("\\b(Dr|Prof|Mr|Mrs|Ms|PhD|MD|Jr|Sr|II|III|IV)\\.?\\b", "", p,
              ignore.case = TRUE, perl = TRUE)
    slugify(p)
  }, character(1))
  cleaned <- cleaned[nzchar(cleaned)]
  if (length(cleaned) == 0) return("")
  paste(cleaned, collapse = "_and_")
}

slug_for <- function(year, speaker_slug) {
  sprintf("%d__%s", as.integer(year), speaker_slug)
}

# Tiny stopword set — keep aggressive normalization off, just drop the most
# common filler tokens so "the heston model" and "heston model" rollup together.
.TOPIC_STOPWORDS <- c("a", "an", "the", "of", "on", "in", "for",
                     "and", "with", "using", "to", "via")

normalize_topic <- function(x) {
  if (length(x) == 0) return("")
  x <- as.character(x)
  x <- stringi::stri_trans_general(x, "Any-Latin; Latin-ASCII")
  x <- tolower(x)
  x <- gsub("[^a-z0-9 ]+", " ", x)
  x <- gsub("\\s+", " ", x)
  x <- trimws(x)
  toks <- strsplit(x, " ", fixed = TRUE)[[1]]
  toks <- toks[!toks %in% .TOPIC_STOPWORDS]
  toks <- toks[nzchar(toks)]
  if (length(toks) == 0) return("")
  paste(toks, collapse = " ")
}

# ---- HTTP client -------------------------------------------------------------

# Configure with throttle + retry + on-disk cache (cache only used for
# idempotent GETs on HTML pages — file downloads stream straight to disk).
polite_client <- function(url) {
  req <- httr2::request(url) |>
    httr2::req_user_agent("osqf-wiki/0.1 (research; +https://github.com/anthropic-ai)") |>
    httr2::req_throttle(rate = 1 / 1.2, realm = "osqf.org") |>
    httr2::req_retry(max_tries = 4,
                     backoff = function(i) min(2 ^ i, 30),
                     retry_on_failure = TRUE,
                     is_transient = function(r) {
                       s <- httr2::resp_status(r)
                       s == 429 || (s >= 500 && s < 600)
                     }) |>
    httr2::req_timeout(60)
  req
}

# GET with httr2 disk cache, returning parsed HTML (xml_document) or NULL.
fetch_html <- function(url) {
  req <- polite_client(url) |>
    httr2::req_cache(HTTP_CACHE, use_on_error = TRUE)
  resp <- tryCatch(httr2::req_perform(req), error = function(e) e)
  if (inherits(resp, "error")) return(NULL)
  if (httr2::resp_status(resp) >= 400) return(NULL)
  txt <- httr2::resp_body_string(resp)
  tryCatch(xml2::read_html(txt), error = function(e) NULL)
}

# Stream a file URL to disk via polite_client(). Returns
# list(ok, status, message, sha256). Skips when file already exists.
download_file <- function(url, dest_path) {
  if (file.exists(dest_path) && file.size(dest_path) > 0) {
    return(list(ok = TRUE, status = "exists", message = "",
                sha256 = digest::digest(file = dest_path, algo = "sha256")))
  }
  dir.create(dirname(dest_path), recursive = TRUE, showWarnings = FALSE)
  req <- polite_client(url)
  resp <- tryCatch(httr2::req_perform(req, path = dest_path),
                   error = function(e) e)
  if (inherits(resp, "error")) {
    return(list(ok = FALSE, status = "error",
                message = conditionMessage(resp), sha256 = NA_character_))
  }
  s <- httr2::resp_status(resp)
  if (s >= 400) {
    if (file.exists(dest_path)) try(file.remove(dest_path), silent = TRUE)
    return(list(ok = FALSE, status = sprintf("http_%d", s),
                message = "", sha256 = NA_character_))
  }
  list(ok = TRUE, status = "ok", message = "",
       sha256 = digest::digest(file = dest_path, algo = "sha256"))
}

# ---- File-format text extraction ---------------------------------------------

# Concatenate all shape text on each slide via officer::pptx_summary().
# Works for .pptx and .pptm. Returns a single string with === SLIDE N ===
# separators, or "" on failure.
read_pptx_text <- function(path) {
  if (!requireNamespace("officer", quietly = TRUE)) {
    stop("officer not installed")
  }
  doc <- tryCatch(officer::read_pptx(path), error = function(e) NULL)
  if (is.null(doc)) return("")
  s <- tryCatch(officer::pptx_summary(doc), error = function(e) NULL)
  if (is.null(s) || nrow(s) == 0) return("")
  setDT(s)
  if (!"slide_id" %in% names(s)) {
    return(paste(as.character(s$text), collapse = "\n"))
  }
  s <- s[!is.na(text) & nzchar(text)]
  if (nrow(s) == 0) return("")
  by_slide <- s[, .(blob = paste(text, collapse = "\n")), by = slide_id][order(slide_id)]
  paste(sprintf("=== SLIDE %d ===\n%s", by_slide$slide_id, by_slide$blob),
        collapse = "\n\n")
}

# Extract visible body text from a saved HTML deck. Strips chrome.
read_html_text <- function(path) {
  doc <- tryCatch(xml2::read_html(path), error = function(e) NULL)
  if (is.null(doc)) return("")
  for (sel in c("script", "style", "nav", "footer", "header")) {
    nodes <- rvest::html_elements(doc, sel)
    if (length(nodes) > 0) xml2::xml_remove(nodes)
  }
  body <- rvest::html_element(doc, "body")
  if (inherits(body, "xml_missing") || is.null(body)) {
    body <- doc
  }
  txt <- tryCatch(rvest::html_text2(body), error = function(e) "")
  txt
}

# ---- Misc --------------------------------------------------------------------

# Strict integer year parser (tolerates "2025", "2025/", " 2025 ").
parse_year <- function(x) {
  m <- regmatches(x, regexpr("\\d{4}", x))
  if (length(m) == 0) return(NA_integer_)
  as.integer(m)
}

# Resolve a relative URL against a base, defaulting to OSQF_BASE.
abs_url <- function(rel, base = OSQF_BASE) {
  vapply(rel, function(r) {
    if (is.na(r) || !nzchar(r)) return(NA_character_)
    tryCatch(xml2::url_absolute(r, base), error = function(e) r)
  }, character(1), USE.NAMES = FALSE)
}

# File-extension extractor that strips query strings.
clean_ext <- function(url) {
  if (is.na(url) || !nzchar(url)) return(NA_character_)
  u <- sub("[?#].*$", "", url)
  e <- tolower(tools::file_ext(u))
  if (!nzchar(e)) NA_character_ else e
}
