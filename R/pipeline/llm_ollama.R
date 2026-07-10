#' llm_ollama.R — standalone Ollama tool-calling client with SHA1 response cache.
#'
#' Curated public extraction (2026-07-09) of the Ollama backend used by stage 03:
#' forced tool-call against a local Ollama server (qwen3, llama3.1+, mistral
#' small — any model that emits OpenAI-style tool_calls), resumable via an
#' on-disk response cache keyed on (model, system, user, tool schema).
#' No cloud calls; no API keys.

`%||%` <- function(a, b) if (is.null(a) || length(a) == 0) b else a

OLLAMA_URL_DEFAULT <- "http://localhost:11434"
ollama_url <- function() Sys.getenv("OLLAMA_URL", unset = OLLAMA_URL_DEFAULT)

CACHE_DIR_DEFAULT <- path.expand(Sys.getenv("OSQF_LLM_CACHE", "_cache/llm_sha1"))

# ---- call/budget bookkeeping (cost is $0 local; we track call counts) --------
.BUDGET <- new.env()
.BUDGET$spent_usd <- 0; .BUDGET$cap_usd <- Inf
.BUDGET$n_calls <- 0L;  .BUDGET$n_cached <- 0L

budget_reset <- function(cap_usd = Inf) {
  .BUDGET$spent_usd <- 0; .BUDGET$cap_usd <- cap_usd
  .BUDGET$n_calls <- 0L;  .BUDGET$n_cached <- 0L
  invisible(NULL)
}

budget_status <- function() {
  list(spent_usd = round(.BUDGET$spent_usd, 4), cap_usd = .BUDGET$cap_usd,
       n_calls = .BUDGET$n_calls, n_cached = .BUDGET$n_cached)
}

# ---- response cache -----------------------------------------------------------
.ensure_cache_dir <- function(dir = CACHE_DIR_DEFAULT) {
  if (!dir.exists(dir)) dir.create(dir, recursive = TRUE, showWarnings = FALSE)
  dir
}

.llm_cache_key <- function(model, system, user_prompt, tools) {
  digest::digest(list(model = model, system = system,
                      user = user_prompt, tools = tools), algo = "sha1")
}

.cache_get <- function(key, dir = CACHE_DIR_DEFAULT) {
  f <- file.path(dir, paste0(key, ".json"))
  if (!file.exists(f)) return(NULL)
  tryCatch(jsonlite::read_json(f, simplifyVector = FALSE), error = function(e) NULL)
}

.cache_put <- function(key, obj, dir = CACHE_DIR_DEFAULT) {
  .ensure_cache_dir(dir)
  f <- file.path(dir, paste0(key, ".json"))
  tryCatch(jsonlite::write_json(obj, f, auto_unbox = TRUE, null = "null"),
           error = function(e) NULL)
  invisible(f)
}

#' Call a local Ollama model with a forced tool schema; returns parsed args.
#'
#' @param system,user character(1) prompts.
#' @param tool list(name, description, input_schema) — Anthropic-style schema,
#'   converted to the OpenAI function format Ollama expects.
#' @param model Ollama model tag.
#' @param max_tokens generation budget. Reasoning models (qwen3) need room to
#'   think BEFORE emitting the tool call — don't starve this.
#' @param num_ctx context window; default 4096 truncates long documents.
#' @return list(ok, args, err, n_in, n_out, latency_s, cached, ...)
ollama_tool_call <- function(system, user, tool,
                             model = "qwen3:14b", max_tokens = 800L,
                             cache_dir = CACHE_DIR_DEFAULT, use_cache = TRUE,
                             timeout = 180, num_ctx = 16384L) {

  cache_key <- .llm_cache_key(model, system, user, tool)
  if (isTRUE(use_cache)) {
    hit <- .cache_get(cache_key, cache_dir)
    if (!is.null(hit) && isTRUE(hit$ok)) {
      .BUDGET$n_cached <- .BUDGET$n_cached + 1L
      return(list(ok = TRUE, args = hit$args, cost_usd = 0,
                  n_in = hit$n_in %||% 0, n_cache_rd = 0, n_cache_wr = 0,
                  n_out = hit$n_out %||% 0, cached = TRUE, raw = NULL))
    }
  }

  ollama_tool <- list(type = "function",
                      `function` = list(name = tool$name,
                                        description = tool$description,
                                        parameters = tool$input_schema))
  body <- list(
    model = model,
    messages = list(list(role = "system", content = system),
                    list(role = "user", content = user)),
    tools = list(ollama_tool),
    stream = FALSE,
    options = list(temperature = 0.1,
                   num_predict = as.integer(max_tokens),
                   num_ctx = as.integer(num_ctx)))

  # Retry transient network errors (GPU contention can drop connections).
  t0 <- proc.time()[["elapsed"]]
  max_tries <- 3L; backoff_s <- c(1, 3, 8); resp <- NULL; last_err <- NULL
  for (attempt in seq_len(max_tries)) {
    resp <- tryCatch(
      httr2::request(ollama_url()) |>
        httr2::req_url_path("/api/chat") |>
        httr2::req_body_json(body, auto_unbox = TRUE) |>
        httr2::req_timeout(timeout) |>
        httr2::req_error(is_error = function(r) FALSE) |>
        httr2::req_perform(),
      error = function(e) e)
    if (!inherits(resp, "error")) break
    last_err <- conditionMessage(resp)
    if (attempt < max_tries) Sys.sleep(backoff_s[attempt])
  }
  latency <- proc.time()[["elapsed"]] - t0

  if (inherits(resp, "error"))
    return(list(ok = FALSE, err = paste0("net_fail_after_", max_tries, "_tries: ", last_err),
                args = NULL, cost_usd = 0, cached = FALSE))
  if (httr2::resp_status(resp) >= 400) {
    body_err <- tryCatch(httr2::resp_body_string(resp), error = function(e) "")
    return(list(ok = FALSE, err = paste0("http_", httr2::resp_status(resp), ": ",
                                         substr(body_err, 1, 500)),
                args = NULL, cost_usd = 0, cached = FALSE))
  }

  j <- httr2::resp_body_json(resp, simplifyVector = FALSE)

  args <- NULL
  msg <- j$message %||% list()
  for (tc in msg$tool_calls %||% list()) {
    fn <- tc$`function` %||% list()
    if (identical(as.character(fn$name %||% ""), tool$name)) {
      a <- fn$arguments
      if (is.character(a) && length(a) == 1L)
        a <- tryCatch(jsonlite::fromJSON(a, simplifyVector = FALSE),
                      error = function(e) NULL)
      if (is.list(a) && length(a) > 0) { args <- a; break }
    }
  }

  # Fallback: some models emit JSON in content instead of tool_calls
  if (is.null(args)) {
    content_txt <- as.character(msg$content %||% "")
    if (nzchar(content_txt)) {
      content_txt <- gsub("<think>[\\s\\S]*?</think>", "", content_txt, perl = TRUE)
      m <- regmatches(content_txt, regexpr("\\{[\\s\\S]*\\}", content_txt, perl = TRUE))
      if (length(m) == 1 && nzchar(m))
        args <- tryCatch(jsonlite::fromJSON(m, simplifyVector = FALSE),
                         error = function(e) NULL)
    }
  }

  .BUDGET$n_calls <- .BUDGET$n_calls + 1L

  err_detail <- NULL
  if (is.null(args)) {
    err_detail <- sprintf("no_tool_call(tc=%d, content=%s)",
                          length(msg$tool_calls %||% list()),
                          substr(as.character(msg$content %||% ""), 1, 300))
  }

  out <- list(ok = !is.null(args), err = err_detail, args = args, cost_usd = 0,
              n_in = as.integer(j$prompt_eval_count %||% 0L),
              n_cache_rd = 0L, n_cache_wr = 0L,
              n_out = as.integer(j$eval_count %||% 0L),
              latency_s = round(latency, 2), cached = FALSE,
              raw_msg = if (is.null(args)) msg else NULL)

  if (isTRUE(use_cache) && out$ok) .cache_put(cache_key, out, cache_dir)
  out
}
