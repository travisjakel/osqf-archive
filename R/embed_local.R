# ============================================================================
# embed_local.R — the embedding client for osqf-archive's R pipeline.
#
#   source("R/embed_local.R")
#   v <- embed_one("search_query: regime switching models")          # numeric(768)
#   M <- embed_texts(paste0("search_document: ", chunks))             # n x 768
#
# PUBLIC CURATED COPY. 90_export_public.R ships this file as R/embed_local.R and
# rewrites the pipeline's `source()` of the maintainer's shared helper to point
# here. Same functions and arguments as that helper; only the comments and the
# default endpoint differ (see ENDPOINT RESOLUTION). Edit the two together.
#
# The archive's stores are built with nomic-embed-text v1.5: 768 dimensions,
# with the `search_query:` / `search_document:` prefixes. Any server that
# serves those weights works: Ollama, or an OpenAI-compatible server such as
# llama-server / llama-swap. Ollama's legacy /api/embeddings returns the raw
# pooled vector while /api/embed and /v1/embeddings return it L2-normalised.
# The archive scores with cosine similarity, which is scale-invariant, so the
# difference does not change results. Do not reuse these vectors under an L2
# distance without normalising first.
#
# ENDPOINT RESOLUTION (first hit wins)
#   1. the `url` argument
#   2. LLM_EMBED_URL                      (any of the three shapes below)
#   3. LLM_LOCAL_BACKEND=llamaswap|openai -> LLAMASWAP_URL's root + /v1/embeddings
#   4. OLLAMA_URL (default http://localhost:11434) + /api/embed
#
# The request shape is chosen from the PATH: /v1/embeddings is OpenAI-shaped
# ({input: [...]} -> data[[i]]$embedding), /api/embed is Ollama's batch shape
# ({input: [...]} -> embeddings), /api/embeddings is Ollama's legacy single
# shape ({prompt: "..."} -> embedding, one text per request).
# ============================================================================

suppressPackageStartupMessages({
  library(httr2)
  library(jsonlite)
})

if (!exists("%||%")) `%||%` <- function(a, b) if (is.null(a) || length(a) == 0) b else a

EMBED_LOCAL_DIM_DEFAULT   <- 768L
EMBED_LOCAL_MODEL_DEFAULT <- "nomic-embed-text"
# Texts per request. llama-server also needs --batch-size / --ubatch-size at
# least as large as the token count of a whole batch.
EMBED_LOCAL_BATCH_DEFAULT <- 128L

#' Resolve the embeddings endpoint.
#' @return character(1) full URL.
embed_local_url <- function(url = NULL) {
  u <- url %||% Sys.getenv("LLM_EMBED_URL", unset = "")
  if (nzchar(u)) return(u)
  backend <- tolower(trimws(Sys.getenv("LLM_LOCAL_BACKEND", unset = "ollama")))
  if (backend %in% c("llamaswap", "openai")) {
    root <- sub("/v1/chat/completions/?$", "",
                sub("/+$", "",
                    Sys.getenv("LLAMASWAP_URL",
                               unset = "http://127.0.0.1:11435/v1/chat/completions")))
    return(paste0(root, "/v1/embeddings"))
  }
  paste0(sub("/+$", "", Sys.getenv("OLLAMA_URL", unset = "http://localhost:11434")),
         "/api/embed")
}

embed_local_model <- function(model = NULL)
  model %||% Sys.getenv("LLM_EMBED_MODEL", unset = EMBED_LOCAL_MODEL_DEFAULT)

.embed_shape <- function(u) {
  if (grepl("/v1/embeddings/?$", u)) "openai"
  else if (grepl("/api/embeddings/?$", u)) "ollama_single"
  else "ollama_batch"
}

.embed_post <- function(u, body, timeout, tries = 3L) {
  for (attempt in seq_len(tries)) {
    r <- tryCatch(
      httr2::request(u) |>
        httr2::req_headers(`Content-Type` = "application/json",
                           # OpenAI-compatible servers want a bearer; Ollama ignores it
                           Authorization = "Bearer not-needed") |>
        httr2::req_body_json(body, auto_unbox = TRUE) |>
        httr2::req_timeout(timeout) |>
        httr2::req_error(is_error = function(r) FALSE) |>
        httr2::req_perform(),
      error = function(e) e)
    if (!inherits(r, "error") && httr2::resp_status(r) < 400)
      return(httr2::resp_body_json(r, simplifyVector = FALSE))
    # A cold embedder (or a model swap on llama-swap) briefly refuses
    # connections. Retry: a hard failure here silently thins the index.
    if (attempt < tries) Sys.sleep(min(20, 2 * 2^(attempt - 1)))
  }
  if (inherits(r, "error"))
    stop("[embed_local] ", u, " unreachable: ", conditionMessage(r), call. = FALSE)
  stop(sprintf("[embed_local] %s returned HTTP %d: %s", u, httr2::resp_status(r),
               substr(tryCatch(httr2::resp_body_string(r), error = function(e) ""), 1, 300)),
       call. = FALSE)
}

#' Embed a character vector.
#'
#' @param texts character vector. Prefixes (`search_query: ` /
#'   `search_document: `) are the CALLER's job and must match what the store was
#'   built with -- pass them in `texts` or via `prefix`.
#' @param model model id; default LLM_EMBED_MODEL, else "nomic-embed-text".
#' @param prefix prepended to every element of `texts`.
#' @param url endpoint override; see embed_local_url().
#' @param dim asserted output width. The stores are FLOAT[768]; an endpoint that
#'   returns anything else is a DIFFERENT embedder and every store it feeds would
#'   be silently wrong, so this fails closed rather than warning.
#' @return numeric matrix, length(texts) x dim.
embed_texts <- function(texts, model = NULL, prefix = "", url = NULL,
                        batch = EMBED_LOCAL_BATCH_DEFAULT,
                        dim = EMBED_LOCAL_DIM_DEFAULT, timeout = 120) {
  texts <- as.character(texts)
  if (!length(texts)) return(matrix(numeric(0), nrow = 0, ncol = dim))
  if (nzchar(prefix)) texts <- paste0(prefix, texts)
  u  <- embed_local_url(url)
  md <- embed_local_model(model)
  shp <- .embed_shape(u)

  out <- matrix(NA_real_, nrow = length(texts), ncol = dim)
  idx <- split(seq_along(texts), ceiling(seq_along(texts) / max(1L, as.integer(batch))))
  for (ii in idx) {
    chunk <- texts[ii]
    vecs <- if (identical(shp, "ollama_single")) {
      # legacy endpoint: one text per request, no batching available
      lapply(chunk, function(tx) {
        j <- .embed_post(u, list(model = md, prompt = tx), timeout)
        as.numeric(unlist(j$embedding))
      })
    } else {
      j <- .embed_post(u, list(model = md, input = as.list(chunk)), timeout)
      raw <- if (identical(shp, "openai")) lapply(j$data, function(d) d$embedding) else j$embeddings
      lapply(raw, function(e) as.numeric(unlist(e)))
    }
    if (length(vecs) != length(ii))
      stop(sprintf("[embed_local] asked for %d embeddings, got %d from %s",
                   length(ii), length(vecs), u), call. = FALSE)
    for (k in seq_along(ii)) {
      v <- vecs[[k]]
      if (length(v) != dim)
        stop(sprintf(paste0("[embed_local] %s returned dim %d, expected %d. That is a ",
                            "DIFFERENT embedder from the one every FLOAT[%d] store was ",
                            "built with -- fix the model, do not widen the assertion."),
                     u, length(v), dim, dim), call. = FALSE)
      out[ii[k], ] <- v
    }
  }
  out
}

#' Embed one string. Convenience wrapper; returns numeric(dim).
embed_one <- function(text, model = NULL, prefix = "", url = NULL,
                      dim = EMBED_LOCAL_DIM_DEFAULT, timeout = 120)
  as.numeric(embed_texts(text[1], model = model, prefix = prefix, url = url,
                         dim = dim, timeout = timeout)[1, ])

#' DuckDB vector literal for a query embedding, e.g. "[0.1,...]::FLOAT[768]".
embed_sql_literal <- function(v, dim = EMBED_LOCAL_DIM_DEFAULT)
  sprintf("[%s]::FLOAT[%d]", paste(sprintf("%.7g", as.numeric(v)), collapse = ","), dim)
