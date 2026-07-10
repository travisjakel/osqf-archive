# validate_ocr_rerun.R — post-re-extraction validation (2026-07-08)
suppressWarnings(suppressPackageStartupMessages({
  library(data.table); library(jsonlite)
}))
jf <- list.files("./_cache/json",
                 full.names = TRUE, pattern = "\\.json$")
ev <- rbindlist(lapply(jf, function(p) {
  j <- tryCatch(read_json(p), error = function(e) NULL)
  if (is.null(j)) return(NULL)
  data.table(slug = gsub("\\.json$", "", basename(p)),
             pr = suppressWarnings(as.numeric(j$evidence_validation$pass_rate %||% NA)),
             nf = length(j$key_findings))
}))
cat(sprintf("JSONs: %d | mean evidence pass: %.1f%% (baseline 68.9%%) | zero-pass: %d (baseline 28)\n",
            nrow(ev), 100 * mean(ev$pr, na.rm = TRUE), ev[pr == 0, .N]))

source("./embeddings/query.R")
for (q in c("oil prices housing market Houston",
            "adverse selection health insurance",
            "order book microstructure liquidity")) {
  r <- osqf_query(q, k = 3)
  cat(sprintf("\nQ: %s\n", q))
  print(r[, .(slug, section, score = round(score, 3))])
}
