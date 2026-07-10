#' 02c_revert_03_failures.R — best-of-both guarantee for the OCR re-extraction.
#'
#' Any slug whose OCR text was accepted by 02b but which then PERSISTENTLY fails
#' stage 03 (no JSON after retry) gets rolled back to its pre-OCR text + JSON
#' from the 2026-07-08 backups, so the re-extraction can only improve a note,
#' never regress it. Slugs with no pre-OCR JSON either stay extraction_failed.
#' Logged to _cache/ocr_repair_log.fst as decision="reverted_03_fail".

suppressPackageStartupMessages({ library(fst) })
source("R/pipeline/00_helpers.R")

TEXT_BAK <- file.path(WIKI_ROOT, "_cache", "text_pre_ocr_20260708")
JSON_BAK <- file.path(WIKI_ROOT, "_cache", "json_pre_ocr_20260708")
LOG_FST  <- file.path(WIKI_ROOT, "_cache", "ocr_repair_log.fst")

log <- as.data.table(read_fst(LOG_FST))
accepted <- log[decision == "accepted", unique(slug)]

fails <- data.table(slug = accepted)
fails[, has_json := file.exists(file.path(JSON_DIR, paste0(slug, ".json")))]
fails <- fails[has_json == FALSE]
fails[, old_json := file.exists(file.path(JSON_BAK, paste0(slug, ".json")))]
fails[, old_text := file.exists(file.path(TEXT_BAK, paste0(slug, ".txt")))]

cat(sprintf("== 02c == %d accepted-but-03-failed slugs; %d revertible\n",
            nrow(fails), fails[old_json & old_text, .N]))

rev <- fails[old_json & old_text]
for (s in rev$slug) {
  file.copy(file.path(TEXT_BAK, paste0(s, ".txt")),
            file.path(TEXT_DIR, paste0(s, ".txt")), overwrite = TRUE)
  file.copy(file.path(JSON_BAK, paste0(s, ".json")),
            file.path(JSON_DIR, paste0(s, ".json")), overwrite = TRUE)
}
if (nrow(rev) > 0) {
  add <- rev[, .(slug, decision = "reverted_03_fail", chars_before = NA_real_,
                 chars_after = NA_real_, ratio = NA_real_,
                 ocr_model = "paddle", ts = format(Sys.time(), "%Y-%m-%d %H:%M:%S"))]
  write_fst(rbindlist(list(log, add), fill = TRUE), LOG_FST)
}
cat(sprintf("reverted %d slugs to pre-OCR text+json; %d remain extraction_failed (no prior JSON)\n",
            nrow(rev), nrow(fails) - nrow(rev)))
