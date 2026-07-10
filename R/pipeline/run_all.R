# run_all.R — drive stages 01 → 05 sequentially.
#
# Env vars:
#   OSQF_YEARS       — comma-separated years to scrape (default: all discovered)
#   OSQF_WORKERS     — parallel workers for stage 02 text extraction (default 4)
#   MAX_NOTES        — cap stage 03 LLM extractions (0 = no cap)
#   OSQF_WIKI_MODEL  — Ollama model for stage 03 (default qwen3:14b)
#   OSQF_WIKI_EMBED_MODEL — Ollama model for stage 05 (default nomic-embed-text)

cat("== run_all.R ==\n")
cat(sprintf("Started: %s\n\n", Sys.time()))

stages <- c(
  "01_scrape_manifest.R",
  "02_extract_text.R",
  "03_llm_extract.R",
  "04_render_pages.R",
  "05_build_embeddings.R"
)
SCRIPT_DIR <- "./scripts"

t_total <- Sys.time()
for (stg in stages) {
  cat(sprintf("\n========== %s ==========\n", stg))
  t0 <- Sys.time()
  source(file.path(SCRIPT_DIR, stg), local = new.env())
  cat(sprintf(">> %s done in %.1fs\n", stg,
              as.numeric(difftime(Sys.time(), t0, units = "secs"))))
}
cat(sprintf("\n== ALL DONE in %.1f min ==\n",
            as.numeric(difftime(Sys.time(), t_total, units = "mins"))))
