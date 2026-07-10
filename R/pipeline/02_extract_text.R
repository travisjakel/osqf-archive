# 02_extract_text.R — extract plain text from downloaded talks.
# Branches on file_ext; soft-fails on tiny extractions (logs to FST, continues).
# Resumable: skips when _cache/text/<slug>.txt already exists with content.

suppressPackageStartupMessages({
  library(data.table)
  library(fst)
  library(future)
  library(future.apply)
})

source("R/pipeline/00_helpers.R")

MIN_CHARS <- 300L  # soft-fail threshold (lower than the sibling private pipeline's 500 — diagram-heavy decks legitimately have little text)
WORKERS   <- as.integer(Sys.getenv("OSQF_WORKERS", "4"))

extract_one <- function(slug, file_ext, file_local, txt_path) {
  if (is.na(file_local) || !file.exists(file_local)) {
    return(list(slug = slug, status = "no_source", n_units = 0L,
                chars = 0L, err = "file_missing"))
  }
  if (file.exists(txt_path) && file.size(txt_path) > 0) {
    return(list(slug = slug, status = "cached", n_units = NA_integer_,
                chars = as.integer(file.size(txt_path)), err = ""))
  }

  text <- ""
  n_units <- NA_integer_
  status  <- "ok"
  err     <- ""

  tryCatch({
    if (file_ext == "pdf") {
      if (!requireNamespace("pdftools", quietly = TRUE))
        stop("pdftools not installed")
      pages <- pdftools::pdf_text(file_local)
      n_units <- length(pages)
      text <- paste(pages, collapse = "\n--- PAGE BREAK ---\n")
    } else if (file_ext %in% c("pptx", "pptm")) {
      text <- read_pptx_text(file_local)
      n_units <- length(strsplit(text, "=== SLIDE ", fixed = TRUE)[[1]]) - 1L
      if (n_units < 0L) n_units <- NA_integer_
    } else if (file_ext %in% c("html", "htm")) {
      text <- read_html_text(file_local)
      n_units <- 1L
    } else if (file_ext == "ppt") {
      # Legacy binary .ppt — officer can't read it directly.
      status <- "skipped_unsupported"
      err <- "binary_ppt_format"
    } else {
      status <- "skipped_unsupported"
      err <- sprintf("ext=%s", file_ext)
    }
  }, error = function(e) {
    status <<- "error"
    err <<- conditionMessage(e)
  })

  chars <- nchar(text)
  if (status == "ok" && chars < MIN_CHARS) {
    status <- "thin_extract"
    err <- sprintf("chars=%d<%d", chars, MIN_CHARS)
  }

  if (status %in% c("ok", "thin_extract")) {
    header <- sprintf(
      "# osqf_wiki text-cache\tslug=%s\tfile_ext=%s\tn_units=%s\tchars=%d\n",
      slug, file_ext,
      if (is.na(n_units)) "NA" else as.character(n_units), chars)
    writeLines(c(header, text), txt_path, useBytes = TRUE)
  }

  list(slug = slug, status = status, n_units = n_units,
       chars = chars, err = err)
}

# ---- Main --------------------------------------------------------------------

cat("== 02_extract_text.R ==\n")
m <- as.data.table(read_fst(file.path(WIKI_ROOT, "manifest.fst")))
cat(sprintf("Manifest rows : %d\n", nrow(m)))

m[, txt_path := file.path(TEXT_DIR, paste0(slug, ".txt"))]

# Workable rows: have a downloaded file
work <- m[!is.na(file_local) & file.exists(file_local)]
cat(sprintf("With files    : %d\n", nrow(work)))
already <- sum(file.exists(work$txt_path) &
               file.size(work$txt_path) > 0)
cat(sprintf("Already cached: %d\n", already))
cat(sprintf("To extract    : %d\n\n", nrow(work) - already))

if (WORKERS > 1) {
  future::plan(future::multisession, workers = WORKERS)
  cat(sprintf("Parallel: %d workers\n", WORKERS))
} else {
  future::plan(future::sequential)
}
on.exit(future::plan(future::sequential), add = TRUE)

t0 <- Sys.time()
results <- future.apply::future_Map(
  extract_one,
  slug       = work$slug,
  file_ext   = work$file_ext,
  file_local = work$file_local,
  txt_path   = work$txt_path,
  future.seed = TRUE
)
elapsed <- as.numeric(difftime(Sys.time(), t0, units = "secs"))

res_dt <- rbindlist(results, fill = TRUE)

# Persist log + errors
log_path <- file.path(WIKI_ROOT, "_cache", "extraction_log.fst")
err_path <- file.path(WIKI_ROOT, "_cache", "extraction_errors.fst")
write_fst(res_dt, log_path)
errs <- res_dt[!status %in% c("ok", "cached")]
if (nrow(errs) > 0) write_fst(errs, err_path) else
  if (file.exists(err_path)) file.remove(err_path)

# ---- Summary ----------------------------------------------------------------
cat(sprintf("\nElapsed: %.1f s\n\n", elapsed))
cat("== Status counts ==\n")
print(res_dt[, .N, by = status][order(-N)])
cat("\n== By file_ext ==\n")
work[, status := res_dt$status]
print(work[, .N, by = .(file_ext, status)][order(file_ext, -N)])
cat(sprintf("\nLog written to %s\n", log_path))
if (nrow(errs) > 0) cat(sprintf("Errors written to %s (%d rows)\n", err_path, nrow(errs)))
