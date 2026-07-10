#' convert_decks_to_pdf.R — one-off/idempotent: convert all ppt/pptx/pptm decks to PDF
#'
#' Feeds the VLM-OCR re-extraction + PixelRAG render (see
#' wiki/ops/ocr_vlm_conditions_of_use.md). Uses Windows LibreOffice headless
#' with a throwaway profile so a running LibreOffice GUI can't block it.
#' Output: _cache/pdf_converted/<slug>.pdf ; log: _cache/pdf_convert_log.fst

source("R/pipeline/00_helpers.R")

SOFFICE  <- "C:/Program Files/LibreOffice/program/soffice.exe"
OUT_DIR  <- file.path(WIKI_ROOT, "_cache", "pdf_converted")
LOG_FST  <- file.path(WIKI_ROOT, "_cache", "pdf_convert_log.fst")
PROFILE  <- "file:///<TMP>/soffice_osqf"
dir.create(OUT_DIR, showWarnings = FALSE, recursive = TRUE)

files <- data.table(path = list.files(file.path(WIKI_ROOT, "_cache", "files"),
                                      full.names = TRUE, recursive = TRUE))
files[, ext := tolower(tools::file_ext(path))]
files <- files[ext %in% c("ppt", "pptx", "pptm")]
files[, slug := tools::file_path_sans_ext(basename(path))]
files[, out_pdf := file.path(OUT_DIR, paste0(slug, ".pdf"))]

message(sprintf("[convert] %d decks (%s)", nrow(files),
                paste(files[, .N, by = ext][, sprintf("%d %s", N, ext)], collapse = ", ")))

res <- files[, {
  if (file.exists(out_pdf)) {
    list(status = "exists", secs = 0)
  } else {
    t0 <- Sys.time()
    rc <- tryCatch(
      system2(SOFFICE,
              c(paste0("-env:UserInstallation=", PROFILE),
                "--headless", "--convert-to", "pdf",
                "--outdir", shQuote(OUT_DIR), shQuote(path)),
              stdout = TRUE, stderr = TRUE, timeout = 180),
      error = function(e) structure(conditionMessage(e), status = 1L)
    )
    ok <- file.exists(out_pdf) && file.size(out_pdf) > 1000
    list(status = fifelse(ok, "converted", "failed"),
         secs = round(as.numeric(difftime(Sys.time(), t0, units = "secs")), 1))
  }
}, by = .(slug, path, ext, out_pdf)]

fst::write_fst(res, LOG_FST)
message(sprintf("[convert] done: %s",
                paste(res[, .N, by = status][, sprintf("%d %s", N, status)], collapse = ", ")))
if (res[status == "failed", .N] > 0)
  message("[convert] FAILED: ", paste(res[status == "failed", slug], collapse = ", "))
