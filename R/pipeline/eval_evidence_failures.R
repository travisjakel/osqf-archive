# eval_evidence_failures.R — enumerate + diagnose FAILING evidence quotes (2026-07-11)
# ------------------------------------------------------------------------------
# The paper reports a corpus-wide evidence-quote pass rate (69.2%) but nothing
# about WHAT the failing ~31% are. Per-finding pass/fail is not persisted
# (only the per-talk aggregate in each _cache/json), so this script recomputes
# the EXACT stage-03 validation per finding (03_llm_extract.R:254-272 — norm_ws,
# <20-char auto-fail, first-60-chars fixed-substring against the text the
# extractor saw, i.e. load_text + maybe_truncate of _cache/text/<slug>.txt),
# verifies the recompute reproduces the stored aggregates (the audit guard),
# enumerates every failure with diagnostics, and writes a seeded 40-row sample
# for manual taxonomy classification:
#   short_quote   — <20 chars (auto-fail by design)
#   near_miss     — most of the quote IS in the source (prefix/edge divergence,
#                   normalization or OCR punctuation drift)
#   variant_match — quote matches the OTHER text variant (pre-OCR vs OCR)
#   unsupported   — quote not found in any variant (candidate fabrication;
#                   confirm by reading src_context)
# Outputs: _cache/evidence_failures_all.fst, scripts/evidence_failure_sample.csv
#
#   Rscript scripts/eval_evidence_failures.R

suppressWarnings(suppressPackageStartupMessages({
  library(data.table); library(jsonlite); library(fst)
}))

ROOT <- "."
`%||%` <- function(a, b) if (is.null(a)) b else a

# ---- exact stage-03 logic (copied, not re-derived) ---------------------------
norm_ws <- function(s) { s <- tolower(as.character(s)); s <- gsub("\\s+", " ", s, perl = TRUE); trimws(s) }
load_text <- function(p) {
  lines <- readLines(p, warn = FALSE, encoding = "UTF-8")
  if (length(lines) >= 1 && grepl("^# osqf_wiki text-cache", lines[1])) lines <- lines[-1]
  paste(lines, collapse = "\n")
}
maybe_truncate <- function(txt, file_ext) {
  if (file_ext %in% c("pptx", "pptm")) {
    parts <- strsplit(txt, "=== SLIDE ", fixed = TRUE)[[1]]
    if (length(parts) > 61L) txt <- paste(parts[1:61L], collapse = "=== SLIDE ")
  }
  if (nchar(txt) > 30000L) txt <- substr(txt, 1, 30000L)
  txt
}
ev_test <- function(q_norm, src_norm) {
  if (nchar(q_norm) < 20) return(FALSE)
  grepl(substr(q_norm, 1, min(60, nchar(q_norm))), src_norm, fixed = TRUE)
}

# ---- diagnostics beyond the pass/fail test -----------------------------------
# fraction of 40-char windows (step 10) of the quote found in the source
window_frac <- function(q_norm, src_norm, w = 40L, step = 10L) {
  n <- nchar(q_norm)
  if (n < w) return(as.numeric(grepl(q_norm, src_norm, fixed = TRUE)))
  starts <- seq(1L, n - w + 1L, by = step)
  mean(vapply(starts, function(s) grepl(substr(q_norm, s, s + w - 1L), src_norm, fixed = TRUE), logical(1)))
}
# ±300-char source context around the best-matching window (for manual judging)
src_context <- function(q_norm, src_norm, w = 40L, step = 10L) {
  n <- nchar(q_norm)
  starts <- if (n < w) 1L else seq(1L, n - w + 1L, by = step)
  for (s in starts) {
    win <- substr(q_norm, s, min(s + w - 1L, n))
    pos <- regexpr(win, src_norm, fixed = TRUE)
    if (pos > 0) return(substr(src_norm, max(1, pos - 300), min(nchar(src_norm), pos + 340)))
  }
  ""
}

m <- as.data.table(read_fst(file.path(ROOT, "manifest.fst")))[, .(slug, file_ext)]
jf <- list.files(file.path(ROOT, "_cache/json"), full.names = TRUE, pattern = "\\.json$")

rows <- list(); talk <- list()
for (p in jf) {
  j <- tryCatch(read_json(p), error = function(e) NULL)
  if (is.null(j) || !length(j$key_findings)) next
  sl <- gsub("\\.json$", "", basename(p))
  fe <- m[slug == sl]$file_ext[1] %||% "pdf"
  tp <- file.path(ROOT, "_cache/text", paste0(sl, ".txt"))
  if (!file.exists(tp)) next
  src_norm <- norm_ws(maybe_truncate(load_text(tp), fe))
  # alternate text variants for variant_match diagnosis
  alt_paths <- c(pre_ocr = file.path(ROOT, "_cache/text_pre_ocr_20260708", paste0(sl, ".txt")),
                 ocr     = file.path(ROOT, "_cache/ocr_text", paste0(sl, ".txt")))
  alts <- lapply(alt_paths[file.exists(alt_paths)], function(ap) norm_ws(maybe_truncate(load_text(ap), fe)))
  pre <- alt_paths["pre_ocr"]
  ocr_applied <- file.exists(pre) &&
    !identical(readLines(tp, n = 50, warn = FALSE), readLines(pre, n = 50, warn = FALSE))
  passes <- logical(0)
  for (k in seq_along(j$key_findings)) {
    kf <- j$key_findings[[k]]
    if (!is.list(kf)) { passes <- c(passes, FALSE); next }
    q_raw  <- as.character(kf$evidence_quote %||% "")
    q_norm <- norm_ws(q_raw)
    ok <- ev_test(q_norm, src_norm)
    passes <- c(passes, ok)
    if (!ok) {
      wf  <- if (nchar(q_norm)) window_frac(q_norm, src_norm) else 0
      alt_hit <- any(vapply(alts, function(a) ev_test(q_norm, a), logical(1)))
      rows[[length(rows) + 1L]] <- data.table(
        slug = sl, file_ext = fe, ocr_applied = ocr_applied, k = k,
        finding = as.character(kf$finding %||% ""),
        evidence_quote = q_raw, qlen = nchar(q_norm),
        window_frac = round(wf, 2), variant_match = alt_hit,
        auto_class = fifelse(nchar(q_norm) < 20, "short_quote",
                     fifelse(alt_hit, "variant_match",
                     fifelse(wf >= 0.5, "near_miss",
                     fifelse(wf > 0, "partial", "unsupported")))),
        src_context = src_context(q_norm, src_norm))
    }
  }
  talk[[sl]] <- data.table(slug = sl,
    recomputed_pr = if (length(passes)) mean(passes) else NA_real_,
    stored_pr = suppressWarnings(as.numeric(j$evidence_validation$pass_rate %||% NA)),
    n_findings = length(j$key_findings))
}
fails <- rbindlist(rows); tk <- rbindlist(talk)

# ---- AUDIT GUARD: recompute must reproduce the stored aggregate --------------
cat(sprintf("talks with findings: %d\n", nrow(tk)))
cat(sprintf("stored corpus mean pass rate    : %.1f%%\n", 100 * mean(tk$stored_pr, na.rm = TRUE)))
cat(sprintf("recomputed corpus mean pass rate: %.1f%%\n", 100 * mean(tk$recomputed_pr, na.rm = TRUE)))
mismatch <- tk[abs(recomputed_pr - stored_pr) > 1e-6]
cat(sprintf("per-talk mismatches (text changed since extraction?): %d\n", nrow(mismatch)))
if (nrow(mismatch)) print(head(mismatch, 10))

cat(sprintf("\nfailing findings enumerated: %d\n", nrow(fails)))
print(fails[, .N, by = auto_class][order(-N)])
cat(sprintf("failures on OCR-applied talks: %d / %d\n", fails[ocr_applied == TRUE, .N], nrow(fails)))

write_fst(fails, file.path(ROOT, "_cache/evidence_failures_all.fst"))

# ---- seeded 40-row sample for manual taxonomy --------------------------------
set.seed(2026)
smp <- fails[sample(.N, min(40L, .N))]
smp[, `:=`(manual_class = "", rationale = "")]
setcolorder(smp, c("slug", "auto_class", "manual_class", "rationale", "finding",
                   "evidence_quote", "qlen", "window_frac", "variant_match",
                   "ocr_applied", "file_ext", "k", "src_context"))
fwrite(smp, file.path(ROOT, "scripts/evidence_failure_sample.csv"))
cat(sprintf("\nwrote scripts/evidence_failure_sample.csv (%d rows) for manual classification\n", nrow(smp)))
