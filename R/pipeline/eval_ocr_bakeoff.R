#' eval_ocr_bakeoff.R — Unlimited-OCR vs PaddleOCR-VL on stratified OSQF decks.
#'
#' Modes (run in order; OCR itself runs WSL-side between --select and --judge):
#'   Rscript eval_ocr_bakeoff.R --select     # pick 12-15 decks -> sample.csv
#'   # then, per model, in WSL (server :8905 up, GPU otherwise free):
#'   #   OCR_MODEL=unlimited OUT_DIR=.../_cache/ocr_bakeoff/unlimited \
#'   #     SLUGS="a;b;..." python 23_ocr_osqf_corpus.py     (idem for paddle)
#'   Rscript eval_ocr_bakeoff.R --judge      # Claude-vision fidelity + hallucination
#'   Rscript eval_ocr_bakeoff.R --scratch03  # stage-03 scratch runs (Ollama up, :8905 down)
#'   Rscript eval_ocr_bakeoff.R --report     # aggregate -> results.json + verdict
#'
#' Cloud policy: the JUDGE (OpenRouter claude-sonnet) sees page images + OCR
#' transcripts — acceptable because OSQF decks are PUBLIC conference material.
#' Extraction itself is 100% local. Do not reuse this judge on private corpora.

suppressPackageStartupMessages({ library(fst); library(jsonlite) })
source("R/pipeline/00_helpers.R")

BAKE_DIR <- file.path(WIKI_ROOT, "_cache", "ocr_bakeoff")
SAMPLE_CSV <- file.path(BAKE_DIR, "sample.csv")
# Pairwise arms — override to bake a new challenger against the champion,
# e.g. BAKE_A=paddle BAKE_B=mineru. Legacy filenames kept for the original pair.
BAKE_A <- Sys.getenv("BAKE_A", "unlimited")
BAKE_B <- Sys.getenv("BAKE_B", "paddle")
MODELS <- unique(c(BAKE_A, BAKE_B))
PAIR   <- if (BAKE_A == "unlimited" && BAKE_B == "paddle") "" else
            sprintf("_%s_vs_%s", BAKE_A, BAKE_B)
JUDGE_FST   <- file.path(BAKE_DIR, sprintf("judge_pages%s.fst", PAIR))
RESULTS_JSON <- file.path(BAKE_DIR, sprintf("results%s.json", PAIR))
# \\wsl.localhost reads are flaky from R (Invalid argument on some files) —
# copy sample tiles to a local dir and point OSQF_TILES_WIN at it.
TILES_WIN <- Sys.getenv("OSQF_TILES_WIN",
                        "<TILES_DIR>")
JUDGE_KEY_PATH <- Sys.getenv("JUDGE_KEY_FILE", "")
JUDGE_MODEL <- "anthropic/claude-sonnet-4"
dir.create(BAKE_DIR, showWarnings = FALSE, recursive = TRUE)

mode <- commandArgs(trailingOnly = TRUE)[1] %||% "--report"

# ---- helpers -----------------------------------------------------------------
judge_key <- function() {
  k <- Sys.getenv("OPENROUTER_API_KEY")
  if (nzchar(k)) return(k)
  ln <- grep("^OPENROUTER_API_KEY=", readLines(JUDGE_KEY_PATH, warn = FALSE), value = TRUE)
  gsub('^OPENROUTER_API_KEY=|["\']', "", ln[1])
}

or_vision <- function(png_path, prompt, max_tokens = 900L) {
  b64 <- base64enc::base64encode(png_path)
  resp <- httr2::request("https://openrouter.ai/api/v1/chat/completions") |>
    httr2::req_headers(Authorization = paste("Bearer", judge_key()),
                       `X-Title` = "OSQF OCR bakeoff") |>
    httr2::req_body_json(list(
      model = JUDGE_MODEL, temperature = 0.1, max_tokens = max_tokens,
      messages = list(list(role = "user", content = list(
        list(type = "image_url",
             image_url = list(url = paste0("data:image/png;base64,", b64))),
        list(type = "text", text = prompt)))))) |>
    httr2::req_timeout(180) |>
    httr2::req_retry(max_tries = 3) |>
    httr2::req_perform()
  httr2::resp_body_json(resp)$choices[[1]]$message$content
}

read_pages <- function(model, slug) {
  p <- file.path(BAKE_DIR, model, paste0(slug, ".txt"))
  if (!file.exists(p)) return(NULL)
  strsplit(paste(readLines(p, warn = FALSE, encoding = "UTF-8"), collapse = "\n"),
           "\n--- PAGE BREAK ---\n", fixed = TRUE)[[1]]
}

# ---- --select ------------------------------------------------------------------
if (mode == "--select") {
  m <- as.data.table(read_fst(file.path(WIKI_ROOT, "manifest.fst")))
  xl <- as.data.table(read_fst(file.path(WIKI_ROOT, "_cache", "extraction_log.fst")))

  jf <- list.files(file.path(WIKI_ROOT, "_cache", "json"), full.names = TRUE, pattern = "\\.json$")
  ev <- rbindlist(lapply(jf, function(p) {
    j <- tryCatch(read_json(p), error = function(e) NULL)
    if (is.null(j)) return(NULL)
    data.table(slug = gsub("\\.json$", "", basename(p)),
               pass_rate = j$evidence_validation$pass_rate %||% NA_real_,
               skipped = j$.meta$skipped %||% "")
  }), fill = TRUE)

  m <- merge(m, xl[, .(slug, x_status = status, chars)], by = "slug", all.x = TRUE)
  m <- merge(m, ev, by = "slug", all.x = TRUE)
  m[, has_file := !is.na(file_ext) & !file_ext %in% c("html", "NA")]
  # "garbled": stage 02 succeeded (text exists) but stage 03 produced no JSON —
  # the no_tool_call-on-garbage failure class. Stage-02 "error" is separate.
  m[, has_txt  := file.exists(file.path(WIKI_ROOT, "_cache", "text", paste0(slug, ".txt")))]
  m[, has_json := file.exists(file.path(WIKI_ROOT, "_cache", "json", paste0(slug, ".json")))]

  pick <- function(dt, n) head(dt[has_file == TRUE][order(-year)], n)
  sample <- unique(rbindlist(list(
    pick(m[file_ext == "pdf" & has_txt & !has_json], 4)[, stratum := "garbled_pdf"],
    pick(m[x_status == "error"], 2)[, stratum := "extract_error"],
    pick(m[file_ext == "ppt"], 3)[, stratum := "legacy_ppt"],
    pick(m[x_status == "thin_extract"], 3)[, stratum := "thin_pptx"],
    pick(m[skipped == "tiny_deck"], 2)[, stratum := "tiny_deck"],
    pick(m[!is.na(pass_rate) & pass_rate == 0], 3)[, stratum := "zero_evidence"]
  ), fill = TRUE), by = "slug")

  fwrite(sample[, .(slug, stratum, year, file_ext, x_status, chars, pass_rate)], SAMPLE_CSV)
  cat(sprintf("sample: %d decks\n", nrow(sample)))
  print(sample[, .N, by = stratum])
  cat("\nSLUGS arg for 23_ocr_osqf_corpus.py:\n")
  cat(paste(sample$slug, collapse = ";"), "\n")
}

# ---- --judge -------------------------------------------------------------------
if (mode == "--judge") {
  sample <- fread(SAMPLE_CSV)
  rows <- list()
  for (slug in sample$slug) {
    tiles <- file.path(TILES_WIN, slug)
    pngs <- list.files(tiles, pattern = "\\.png$", full.names = TRUE)
    if (length(pngs) == 0) { cat("no tiles:", slug, "\n"); next }
    # densest pages = most content to get wrong
    top <- pngs[order(-file.size(pngs))][1:min(3, length(pngs))]
    pg_idx <- as.integer(gsub("^page_|\\.png$", "", basename(top)))
    pa <- read_pages(BAKE_A, slug); pb <- read_pages(BAKE_B, slug)
    if (is.null(pa) || is.null(pb)) { cat("missing transcript:", slug, "\n"); next }
    for (k in seq_along(top)) {
      i <- pg_idx[k] + 1L
      ta <- if (i <= length(pa)) pa[i] else ""
      tb <- if (i <= length(pb)) pb[i] else ""
      prompt <- paste0(
        "The image is the authoritative source page from a quant-finance conference deck. ",
        "Grade the two OCR transcripts below.\n\n",
        "CANDIDATE_A:\n", substr(ta, 1, 6000), "\n\nCANDIDATE_B:\n", substr(tb, 1, 6000),
        "\n\nReturn ONLY JSON: {\"a_fidelity\": 0-1, \"b_fidelity\": 0-1, ",
        "\"a_hallucination\": true/false, \"b_hallucination\": true/false, ",
        "\"has_table\": true/false, \"has_chart\": true/false, \"note\": \"<15 words\"}. ",
        "fidelity = fraction of substantive page content (text, table cells, numbers, ",
        "equations, chart text) correctly transcribed. hallucination = transcript ",
        "contains content NOT on the page.")
      raw <- tryCatch(or_vision(top[k], prompt), error = function(e) conditionMessage(e))
      j <- tryCatch(fromJSON(regmatches(raw, regexpr("\\{.*\\}", raw))),
                    error = function(e) NULL)
      rows[[length(rows) + 1L]] <- data.table(
        slug = slug, page = pg_idx[k],
        a_fid = j$a_fidelity %||% NA_real_, b_fid = j$b_fidelity %||% NA_real_,
        a_hall = j$a_hallucination %||% NA, b_hall = j$b_hallucination %||% NA,
        has_table = j$has_table %||% NA, has_chart = j$has_chart %||% NA,
        note = j$note %||% substr(raw, 1, 80))
      cat(sprintf("[%s p%d] A=%.2f B=%.2f hallA=%s hallB=%s %s\n", slug, pg_idx[k],
                  j$a_fidelity %||% NA, j$b_fidelity %||% NA,
                  j$a_hallucination %||% NA, j$b_hallucination %||% NA,
                  substr(j$note %||% "", 1, 40)))
    }
  }
  write_fst(rbindlist(rows, fill = TRUE), JUDGE_FST)
}

# ---- --scratch03 ---------------------------------------------------------------
if (mode == "--scratch03") {
  sample <- fread(SAMPLE_CSV)
  for (model in MODELS) {
    td <- file.path(BAKE_DIR, paste0("scratch_", model), "text")
    jd <- file.path(BAKE_DIR, paste0("scratch_", model), "json")
    dir.create(td, recursive = TRUE, showWarnings = FALSE)
    dir.create(jd, recursive = TRUE, showWarnings = FALSE)
    for (slug in sample$slug) {
      pages <- read_pages(model, slug)
      if (is.null(pages)) next
      body <- paste(pages, collapse = "\n--- PAGE BREAK ---\n")
      writeLines(c(sprintf("# osqf_wiki text-cache\tslug=%s\tocr_model=%s\tchars=%d",
                           slug, model, nchar(body)), body),
                 file.path(td, paste0(slug, ".txt")), useBytes = TRUE)
    }
    cat(sprintf("[scratch03 %s] running 03_llm_extract.R (Ollama must be up)...\n", model))
    # system2(env=) is not reliable on Windows — set in parent, child inherits
    Sys.setenv(OSQF_TEXT_DIR = td, OSQF_JSON_DIR = jd)
    rc <- system2("Rscript",
                  file.path(WIKI_ROOT, "scripts", "03_llm_extract.R"),
                  stdout = file.path(BAKE_DIR, paste0("scratch03_", model, ".log")),
                  stderr = file.path(BAKE_DIR, paste0("scratch03_", model, ".log")))
    Sys.unsetenv(c("OSQF_TEXT_DIR", "OSQF_JSON_DIR"))
    cat(sprintf("[scratch03 %s] exit=%d\n", model, rc))
  }
}

# ---- --report ------------------------------------------------------------------
if (mode == "--report") {
  sample <- fread(SAMPLE_CSV)
  jp <- as.data.table(read_fst(JUDGE_FST))
  for (col in c("a_fid", "b_fid")) set(jp, j = col, value = suppressWarnings(as.numeric(jp[[col]])))
  for (col in c("a_hall", "b_hall", "has_table", "has_chart"))
    set(jp, j = col, value = as.logical(jp[[col]]))

  scr <- rbindlist(lapply(MODELS, function(model) {
    jd <- file.path(BAKE_DIR, paste0("scratch_", model), "json")
    rbindlist(lapply(sample$slug, function(s) {
      p <- file.path(jd, paste0(s, ".json"))
      if (!file.exists(p)) return(NULL)
      j <- read_json(p)
      data.table(model = model, slug = s,
                 pass_rate = j$evidence_validation$pass_rate %||% NA_real_,
                 n_findings = j$evidence_validation$n_findings %||% 0L)
    }))
  }))
  scr[, `:=`(pass_rate = suppressWarnings(as.numeric(pass_rate)),
             n_findings = suppressWarnings(as.integer(n_findings)))]

  chars <- rbindlist(lapply(MODELS, function(model) rbindlist(lapply(sample$slug, function(s) {
    p <- file.path(BAKE_DIR, model, paste0(s, ".txt"))
    old <- file.path(WIKI_ROOT, "_cache", "text", paste0(s, ".txt"))
    data.table(model = model, slug = s,
               chars_ocr = if (file.exists(p)) file.size(p) else NA_real_,
               chars_old = if (file.exists(old)) file.size(old) else 0)
  }))))

  agg <- data.table(
    model = c(sprintf("%s (A)", BAKE_A), sprintf("%s (B)", BAKE_B)),
    fidelity_all   = c(jp[, mean(a_fid, na.rm = TRUE)], jp[, mean(b_fid, na.rm = TRUE)]),
    fidelity_table = c(jp[has_table == TRUE, mean(a_fid, na.rm = TRUE)],
                       jp[has_table == TRUE, mean(b_fid, na.rm = TRUE)]),
    fidelity_chart = c(jp[has_chart == TRUE, mean(a_fid, na.rm = TRUE)],
                       jp[has_chart == TRUE, mean(b_fid, na.rm = TRUE)]),
    halluc_pages   = c(jp[, sum(a_hall %in% TRUE)], jp[, sum(b_hall %in% TRUE)]),
    ev_pass        = scr[, mean(pass_rate, na.rm = TRUE), by = model][match(MODELS, model), V1],
    n_findings     = scr[, mean(n_findings, na.rm = TRUE), by = model][match(MODELS, model), V1])
  print(agg)

  verdict <- {
    a <- agg[1]; b <- agg[2]
    # majority vote across the four criteria; hallucination counts double
    # (poisons downstream evidence validation). Tie -> paddle (lighter,
    # charts first-class per model card).
    votes_b <- sum(isTRUE(b$fidelity_all > a$fidelity_all),
                   isTRUE(b$fidelity_table > a$fidelity_table) ||
                     (is.na(b$fidelity_table) && isTRUE(b$fidelity_chart > a$fidelity_chart)),
                   isTRUE(b$ev_pass > a$ev_pass),
                   2L * (b$halluc_pages < a$halluc_pages))
    votes_a <- sum(isTRUE(a$fidelity_all > b$fidelity_all),
                   isTRUE(a$fidelity_table > b$fidelity_table) ||
                     (is.na(a$fidelity_table) && isTRUE(a$fidelity_chart > b$fidelity_chart)),
                   isTRUE(a$ev_pass > b$ev_pass),
                   2L * (a$halluc_pages < b$halluc_pages))
    if (votes_a > votes_b) BAKE_A else if (votes_b >= votes_a) BAKE_B else "split"
  }
  cat(sprintf("\nVERDICT: %s\n", verdict))
  write_json(list(pair = c(BAKE_A, BAKE_B), sample = sample, judge_pages = jp,
                  scratch03 = scr, chars = chars, aggregate = agg, verdict = verdict,
                  judge_model = JUDGE_MODEL,
                  note = "cloud judge OK: public conference decks; extraction local"),
             RESULTS_JSON, auto_unbox = TRUE, pretty = TRUE,
             dataframe = "rows", na = "null")
  cat(sprintf("wrote %s\n", RESULTS_JSON))
}
