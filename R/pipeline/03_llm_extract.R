# 03_llm_extract.R — call Ollama qwen3:14b with a forced tool schema to
# extract structured fields per talk. Resumable via per-slug JSON cache plus
# the SHA1 cache backing ollama_tool_call(). Tiny decks (< 500 chars) skip
# the LLM call entirely and write a stub JSON.

suppressPackageStartupMessages({
  library(data.table)
  library(fst)
  library(jsonlite)
})

source("R/pipeline/00_helpers.R")

MAX_NOTES <- as.integer(Sys.getenv("MAX_NOTES", "0"))
MODEL     <- Sys.getenv("OSQF_WIKI_MODEL", "qwen3:14b")

# Reuse the Piper helper (provides ollama_tool_call + budget bookkeeping).
source("R/pipeline/llm_ollama.R")

budget_reset(cap_usd = Inf)  # Ollama is free — no cap

# ---- Tool schema (forced JSON output) ---------------------------------------
extract_tool <- list(
  name        = "record_talk_extraction",
  description = "Extract structured fields from an OSQF conference talk (deck/PDF/HTML).",
  input_schema = list(
    type = "object",
    properties = list(
      headline = list(
        type = "string",
        description = "One sentence: what the talk is about, in plain English."
      ),
      topics = list(
        type = "array",
        description = paste(
          "High-level topics the talk covers, e.g. 'options pricing',",
          "'market making', 'reinforcement learning', 'volatility forecasting'.",
          "1-6 items."
        ),
        items = list(type = "string")
      ),
      methods = list(
        type = "array",
        description = paste(
          "Specific techniques or models named in the talk, e.g. 'Heston model',",
          "'LightGBM', 'Kalman filter', 'HMM', 'PCA', 'matrix profile'.",
          "EMPTY ARRAY if none stated."
        ),
        items = list(type = "string")
      ),
      datasets_used = list(
        type = "array",
        description = paste(
          "Datasets EXPLICITLY named, e.g. 'CRSP daily', 'Binance BTCUSDT trades 2018-2022',",
          "'WRDS TAQ'. EMPTY ARRAY if none."
        ),
        items = list(type = "string")
      ),
      code_or_tools_referenced = list(
        type = "array",
        description = paste(
          "R packages, Python libraries, GitHub repos, languages, frameworks named",
          "(e.g. 'data.table', 'pytorch', 'github.com/X/Y', 'Julia', 'QuantLib').",
          "EMPTY ARRAY if none."
        ),
        items = list(type = "string")
      ),
      key_findings = list(
        type = "array",
        description = paste(
          "3-7 numbered findings. Each MUST include an `evidence_quote` <=200 chars",
          "copied verbatim from the source — validated post-hoc."
        ),
        items = list(
          type = "object",
          properties = list(
            finding        = list(type = "string"),
            evidence_quote = list(
              type = "string",
              description = "Verbatim substring of source, <=200 chars."
            )
          ),
          required = list("finding", "evidence_quote")
        )
      ),
      applications = list(
        type = "array",
        description = paste(
          "Practical applications named, e.g. 'intraday trading',",
          "'risk management', 'optimal execution'. EMPTY if none."
        ),
        items = list(type = "string")
      ),
      references_cited = list(
        type = "array",
        description = paste(
          "Paper/book titles or author-year stubs visible in the deck.",
          "EMPTY if none."
        ),
        items = list(type = "string")
      ),
      tickers_mentioned = list(
        type = "array",
        description = "Stock tickers explicitly named (usually empty for OSQF talks).",
        items = list(type = "string")
      ),
      speaker_affiliation = list(
        type = "string",
        description = paste(
          "Affiliation ONLY if stated in the deck (e.g. 'Two Sigma',",
          "'NYU Tandon', 'Parametric'). Empty string otherwise."
        )
      )
    ),
    required = list("headline", "topics", "methods", "datasets_used",
                    "code_or_tools_referenced", "key_findings", "applications",
                    "references_cited", "tickers_mentioned",
                    "speaker_affiliation")
  )
)

SYSTEM_PROMPT <- paste(
  "You are extracting structured data from an academic / industry quant-finance conference talk (slide deck or paper).",
  "",
  "Critical rules:",
  "1. DO NOT INFER. If a field is not explicitly stated in the source, return an empty string or empty array.",
  "2. For every key_finding, the `evidence_quote` MUST be a verbatim substring of the source text (<=200 chars). Do not paraphrase. Do not stitch quotes together.",
  "3. `topics` are high-level themes (1-6 items). `methods` are specific techniques. Don't conflate.",
  "4. For `code_or_tools_referenced`, prefer specific package names (e.g., 'data.table', 'pytorch') over generic language names when both appear.",
  "5. For `datasets_used`, only list datasets explicitly named in the source, with whatever specificity the source uses (e.g., 'CRSP daily 2000-2020', not just 'CRSP').",
  "6. The user message will tell you the talk metadata (year, speaker, title, file format) — use it as a hint, not authoritative content.",
  "7. Be concise. Findings 1-2 sentences each.",
  "",
  "You have one tool: `record_talk_extraction`. You MUST call it. Do not write any prose response.",
  sep = "\n"
)

# ---- Build the work list ----------------------------------------------------
m <- as.data.table(read_fst(file.path(WIKI_ROOT, "manifest.fst")))
m[, txt_path  := file.path(TEXT_DIR, paste0(slug, ".txt"))]
m[, json_path := file.path(JSON_DIR, paste0(slug, ".json"))]
m[, txt_ok    := file.exists(txt_path) & file.size(txt_path) > 0]
m[, cached    := file.exists(json_path)]

todo <- m[txt_ok == TRUE & cached == FALSE]
if (MAX_NOTES > 0) todo <- todo[1:min(MAX_NOTES, nrow(todo))]

cat("== 03_llm_extract.R ==\n")
cat(sprintf("Backend       : ollama (model=%s)\n", MODEL))
cat(sprintf("Manifest rows : %d\n", nrow(m)))
cat(sprintf("With text     : %d\n", sum(m$txt_ok)))
cat(sprintf("Already JSON'd: %d\n", sum(m$cached)))
cat(sprintf("To extract    : %d\n\n", nrow(todo)))

if (nrow(todo) == 0) { cat("Nothing to do.\n"); quit(save = "no") }

# ---- Per-talk extraction ----------------------------------------------------

# Strip the text-cache header and any embedded === SLIDE === / PAGE BREAK
# markers so the LLM sees mostly clean prose.
load_text <- function(p) {
  lines <- readLines(p, warn = FALSE, encoding = "UTF-8")
  if (length(lines) >= 1 && grepl("^# osqf_wiki text-cache", lines[1])) {
    lines <- lines[-1]
  }
  paste(lines, collapse = "\n")
}

# Slide truncation: PPTX with > 60 slides truncates to first 60 (avoids
# raw appendix dumps blowing the token budget).
maybe_truncate <- function(txt, file_ext) {
  if (file_ext %in% c("pptx", "pptm")) {
    parts <- strsplit(txt, "=== SLIDE ", fixed = TRUE)[[1]]
    if (length(parts) > 61L) {
      parts <- parts[1:61L]
      txt <- paste(parts, collapse = "=== SLIDE ")
    }
  }
  if (nchar(txt) > 30000L) txt <- substr(txt, 1, 30000L)
  txt
}

n_skip_tiny <- 0L
results <- vector("list", nrow(todo))

for (i in seq_len(nrow(todo))) {
  row <- todo[i]
  txt <- load_text(row$txt_path)
  txt <- maybe_truncate(txt, row$file_ext)

  # Tiny-deck shortcut: stub JSON, no LLM call
  if (nchar(txt) < 500L) {
    stub <- list(
      headline                  = as.character(row$title %||% ""),
      topics                    = list(),
      methods                   = list(),
      datasets_used             = list(),
      code_or_tools_referenced  = list(),
      key_findings              = list(),
      applications              = list(),
      references_cited          = list(),
      tickers_mentioned         = list(),
      speaker_affiliation       = "",
      evidence_validation       = list(n_findings = 0L, n_validated = 0L,
                                        pass_rate = NA_real_),
      .meta = list(slug = row$slug, model = "stub", skipped = "tiny_deck",
                    cost_usd = 0, cached = FALSE,
                    n_in = 0L, n_out = 0L)
    )
    jsonlite::write_json(stub, row$json_path, auto_unbox = TRUE,
                          pretty = TRUE, null = "null")
    n_skip_tiny <- n_skip_tiny + 1L
    results[[i]] <- list(slug = row$slug, ok = TRUE, ev_pass = NA_real_,
                          tiny = TRUE)
    next
  }

  user_msg <- paste(
    sprintf(
      "Talk metadata: year=%d, speaker=%s, title=%s, file_format=%s, talk_type=%s",
      as.integer(row$year),
      as.character(row$speaker_raw %||% ""),
      as.character(row$title %||% ""),
      as.character(row$file_ext %||% ""),
      as.character(row$talk_type %||% "")
    ),
    "",
    "Source text:",
    "----",
    txt,
    "----",
    sep = "\n"
  )

  out <- ollama_tool_call(
    system     = SYSTEM_PROMPT,
    user       = user_msg,
    tool       = extract_tool,
    model      = MODEL,
    max_tokens = 2500L,
    cache_dir  = SHA1_CACHE,
    use_cache  = TRUE,
    timeout    = 600
  )

  if (!isTRUE(out$ok)) {
    cat(sprintf("[%3d/%3d] FAIL %s — %s\n", i, nrow(todo), row$slug,
                substr(out$err %||% "no_args", 1, 120)))
    results[[i]] <- list(slug = row$slug, ok = FALSE,
                          err = out$err %||% "")
    next
  }

  # Validate evidence_quote substring matches (whitespace-normalized)
  args <- out$args
  norm_ws <- function(s) {
    s <- tolower(as.character(s))
    s <- gsub("\\s+", " ", s, perl = TRUE)
    trimws(s)
  }
  src_norm <- norm_ws(txt)
  ev_check <- vapply(args$key_findings %||% list(), function(kf) {
    if (!is.list(kf)) return(FALSE)   # model sometimes emits bare strings
    q <- norm_ws(as.character(kf$evidence_quote %||% ""))
    if (nchar(q) < 20) return(FALSE)
    grepl(substr(q, 1, min(60, nchar(q))), src_norm, fixed = TRUE)
  }, logical(1))
  args$evidence_validation <- list(
    n_findings  = length(args$key_findings %||% list()),
    n_validated = sum(ev_check),
    pass_rate   = if (length(ev_check)) mean(ev_check) else NA_real_
  )
  args$.meta <- list(
    slug      = row$slug,
    model     = MODEL,
    cost_usd  = out$cost_usd,
    cached    = out$cached,
    n_in      = out$n_in,
    n_out     = out$n_out
  )
  jsonlite::write_json(args, row$json_path, auto_unbox = TRUE,
                        pretty = TRUE, null = "null")

  results[[i]] <- list(slug = row$slug, ok = TRUE,
                        cached = out$cached,
                        ev_pass = args$evidence_validation$pass_rate,
                        tiny = FALSE)

  if (i %% 5 == 0 || i == nrow(todo)) {
    bs <- budget_status()
    cat(sprintf("[%3d/%3d] %d calls (%d cached) | %s | ev=%s\n",
                i, nrow(todo), bs$n_calls, bs$n_cached, row$slug,
                if (is.na(results[[i]]$ev_pass)) "NA" else
                  sprintf("%.0f%%", 100 * results[[i]]$ev_pass)))
  }
}

# ---- Summary ----------------------------------------------------------------
ok_idx <- vapply(results, function(r) isTRUE(r$ok), logical(1))
ok_res <- results[ok_idx]
fail   <- results[!ok_idx]
bs     <- budget_status()

cat(sprintf("\n== Summary ==\n"))
cat(sprintf("Success    : %d\n", sum(ok_idx)))
cat(sprintf("  tiny stub: %d\n", n_skip_tiny))
cat(sprintf("Failure    : %d\n", length(fail)))
cat(sprintf("LLM calls  : %d (%d SHA1-cached)\n", bs$n_calls, bs$n_cached))
ev_rates <- vapply(ok_res, function(r) r$ev_pass %||% NA_real_, numeric(1))
ev_rates <- ev_rates[!is.na(ev_rates)]
if (length(ev_rates) > 0) {
  cat(sprintf("Mean evidence-quote validation rate: %.1f%% (n=%d)\n",
              100 * mean(ev_rates), length(ev_rates)))
}
if (length(fail) > 0) {
  cat("\nFailures (first 5):\n")
  for (f in fail[1:min(5, length(fail))]) {
    cat(sprintf("  %s — %s\n", f$slug, substr(f$err %||% "", 1, 120)))
  }
}
