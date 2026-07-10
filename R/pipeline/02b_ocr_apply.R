#' 02b_ocr_apply.R — apply VLM-OCR transcripts to the text cache (full-corpus
#' re-extraction, additive stage; 02_extract_text.R is untouched).
#'
#' Reads _cache/ocr_text/<slug>.txt written by python/pixel/
#' 23_ocr_osqf_corpus.py, applies the acceptance gate per slug, and on accept:
#'   - rewrites _cache/text/<slug>.txt with an ocr_model provenance header
#'   - deletes _cache/json/<slug>.json (forces the stage-03 re-run)
#' Rejects keep the old text and log `ocr_no_gain`.
#'
#' Gate: nchar(ocr) >= 300  AND  nchar(ocr) >= 0.7 * nchar(old)
#' (OCR must not lose born-digital content; previously-failed decks have
#' old ~ 0, so anything >= 300 chars wins.)
#'
#' Backups exist at _cache/text_pre_ocr_20260708 + _cache/json_pre_ocr_20260708.
#' Log: _cache/ocr_repair_log.fst. Then run stages 03 -> 04 -> 05.

suppressPackageStartupMessages({ library(fst) })
source("R/pipeline/00_helpers.R")

OCR_DIR <- file.path(WIKI_ROOT, "_cache", "ocr_text")
LOG_FST <- file.path(WIKI_ROOT, "_cache", "ocr_repair_log.fst")
DRY     <- nzchar(Sys.getenv("OSQF_OCR_DRY"))

run_log <- file.path(OCR_DIR, "_ocr_run_log.jsonl")
ocr_model <- "unknown"
if (file.exists(run_log)) {
  last <- jsonlite::fromJSON(tail(readLines(run_log, warn = FALSE), 1))
  ocr_model <- last$model %||% "unknown"
}

m <- as.data.table(read_fst(file.path(WIKI_ROOT, "manifest.fst")))
work <- data.table(ocr_path = list.files(OCR_DIR, pattern = "\\.txt$", full.names = TRUE))
work[, slug := gsub("\\.txt$", "", basename(ocr_path))]
work <- work[slug %in% m$slug]
work[, txt_path  := file.path(TEXT_DIR, paste0(slug, ".txt"))]
work[, json_path := file.path(JSON_DIR, paste0(slug, ".json"))]

read_body <- function(p, strip_header = FALSE) {
  lines <- readLines(p, warn = FALSE, encoding = "UTF-8")
  if (strip_header && length(lines) >= 1 && grepl("^# osqf_wiki text-cache", lines[1]))
    lines <- lines[-1]
  paste(lines, collapse = "\n")
}

cat(sprintf("== 02b_ocr_apply.R == %d transcripts | model=%s%s\n",
            nrow(work), ocr_model, if (DRY) " [DRY RUN]" else ""))

res <- work[, {
  ocr <- read_body(ocr_path)
  old <- if (file.exists(txt_path)) read_body(txt_path, strip_header = TRUE) else ""
  n_ocr <- nchar(ocr); n_old <- nchar(old)
  accept <- n_ocr >= 300L && n_ocr >= 0.7 * n_old
  if (accept && !DRY) {
    header <- sprintf(
      "# osqf_wiki text-cache\tslug=%s\tfile_ext=%s\tn_units=NA\tchars=%d\tocr_model=%s\n",
      slug, m[slug == .BY$slug, file_ext %||% NA_character_][1], n_ocr, ocr_model)
    writeLines(c(header, ocr), txt_path, useBytes = TRUE)
    if (file.exists(json_path)) file.remove(json_path)
  }
  list(decision = fifelse(accept, "accepted", "ocr_no_gain"),
       chars_before = n_old, chars_after = n_ocr,
       ratio = round(n_ocr / pmax(n_old, 1), 2))
}, by = slug]

res[, `:=`(ocr_model = ocr_model, ts = format(Sys.time(), "%Y-%m-%d %H:%M:%S"))]
if (!DRY) {
  prev <- if (file.exists(LOG_FST)) as.data.table(read_fst(LOG_FST)) else NULL
  write_fst(rbindlist(list(prev, res), fill = TRUE), LOG_FST)
}

cat(sprintf("accepted: %d | ocr_no_gain: %d\n",
            res[decision == "accepted", .N], res[decision == "ocr_no_gain", .N]))
cat("no-gain slugs:", paste(head(res[decision == "ocr_no_gain", slug], 15), collapse = ", "), "\n")
cat(sprintf("median ratio ocr/old: %.2f\n", res[, median(ratio)]))
if (!DRY) cat("Next: Rscript 03_llm_extract.R (Ollama up), then 04, then 05.\n")
