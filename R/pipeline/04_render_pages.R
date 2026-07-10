# 04_render_pages.R — render markdown pages from manifest + LLM JSON.
# Outputs: notes/, years/, speakers/, topics/, methods/, index.md, log.md.
# Idempotent.

suppressPackageStartupMessages({
  library(data.table)
  library(fst)
  library(jsonlite)
})

source("R/pipeline/00_helpers.R")

RUN_DATE <- as.character(Sys.Date())
RUN_TS   <- paste0(RUN_DATE, "T00:00:00Z")  # OKF ISO-8601 timestamp

# ---- Helpers ----------------------------------------------------------------

# YAML-safe scalar (quoted if contains special chars)
yaml_scalar <- function(v) {
  if (is.null(v) || (length(v) == 1 && (is.na(v) || !nzchar(as.character(v))))) {
    return("~")
  }
  s <- as.character(v[1])
  if (grepl('[:#"\'\\[\\]\\{\\},&*?|<>=!%@`]', s, perl = TRUE) || grepl("^[\\s-]", s, perl = TRUE)) {
    s <- gsub('"', '\\\\"', s)
    return(sprintf('"%s"', s))
  }
  s
}

frontmatter <- function(...) {
  kvs <- list(...)
  lines <- character()
  for (k in names(kvs)) {
    v <- kvs[[k]]
    if (is.null(v) || (length(v) == 1 && (is.na(v) || !nzchar(as.character(v))))) {
      lines <- c(lines, sprintf("%s: ~", k))
    } else if (length(v) > 1 || (is.list(v) && length(v) > 0)) {
      vs <- vapply(v, yaml_scalar, character(1))
      lines <- c(lines, sprintf("%s: [%s]", k, paste(vs, collapse = ", ")))
    } else {
      lines <- c(lines, sprintf("%s: %s", k, yaml_scalar(v)))
    }
  }
  paste0("---\n", paste(lines, collapse = "\n"), "\n---\n")
}

bullet_list <- function(items, empty_msg = "*(none extracted)*") {
  if (is.null(items) || length(items) == 0) return(empty_msg)
  items <- vapply(items, as.character, character(1))
  items <- items[nzchar(items)]
  if (length(items) == 0) return(empty_msg)
  paste(sprintf("- %s", items), collapse = "\n")
}

# Treat values like "data.table", "pytorch", "dplyr" as code-formatted
.is_packagey <- function(s) {
  grepl("^[a-zA-Z][a-zA-Z0-9._-]*[a-zA-Z0-9]$", s) && nchar(s) <= 30 &&
    !grepl(" ", s, fixed = TRUE)
}

bullet_packages <- function(items, empty_msg = "*(none extracted)*") {
  if (is.null(items) || length(items) == 0) return(empty_msg)
  items <- vapply(items, as.character, character(1))
  items <- items[nzchar(items)]
  if (length(items) == 0) return(empty_msg)
  out <- vapply(items, function(it) {
    if (.is_packagey(it)) sprintf("- `%s`", it) else sprintf("- %s", it)
  }, character(1))
  paste(out, collapse = "\n")
}

# ---- Load manifest + JSON cache ----------------------------------------------
m <- as.data.table(read_fst(file.path(WIKI_ROOT, "manifest.fst")))
m[, json_path := file.path(JSON_DIR, paste0(slug, ".json"))]
m[, has_json  := file.exists(json_path)]

cat("== 04_render_pages.R ==\n")
cat(sprintf("Manifest rows : %d\n", nrow(m)))
cat(sprintf("With JSON     : %d\n", sum(m$has_json)))
cat(sprintf("No file       : %d\n", sum(m$download_status == "no_file", na.rm = TRUE)))

load_json <- function(p) tryCatch(jsonlite::read_json(p, simplifyVector = FALSE),
                                   error = function(e) NULL)
jsons <- setNames(vector("list", nrow(m)), m$slug)
for (i in seq_len(nrow(m))) {
  if (m$has_json[i]) jsons[[m$slug[i]]] <- load_json(m$json_path[i])
}

# ---- Compute aggregations: topics, methods, speakers ------------------------
get_field <- function(j, k) {
  v <- j[[k]] %||% list()
  if (length(v) == 0) return(character(0))
  v <- vapply(v, function(x) if (is.list(x)) "" else as.character(x[1]), character(1))
  v <- v[nzchar(v)]
  v
}

m[, topic_norms   := list(list(character(0)))]
m[, method_norms  := list(list(character(0)))]
m[, topic_origs   := list(list(character(0)))]
m[, method_origs  := list(list(character(0)))]

for (i in seq_len(nrow(m))) {
  j <- jsons[[m$slug[i]]]
  if (is.null(j)) next
  ts <- get_field(j, "topics")
  ms <- get_field(j, "methods")
  m$topic_origs[[i]]  <- ts
  m$method_origs[[i]] <- ms
  m$topic_norms[[i]]  <- unique(vapply(ts, normalize_topic, character(1)))
  m$method_norms[[i]] <- unique(vapply(ms, normalize_topic, character(1)))
}

# Counts across all talks (rollup keys must come from talks that have a JSON
# AND aren't extraction stubs with empty arrays only)
all_topic_pairs <- rbindlist(lapply(seq_len(nrow(m)), function(i) {
  if (length(m$topic_norms[[i]]) == 0) return(NULL)
  data.table(slug = m$slug[i], topic_norm = m$topic_norms[[i]])
}))
all_method_pairs <- rbindlist(lapply(seq_len(nrow(m)), function(i) {
  if (length(m$method_norms[[i]]) == 0) return(NULL)
  data.table(slug = m$slug[i], method_norm = m$method_norms[[i]])
}))

topic_counts  <- if (nrow(all_topic_pairs))  all_topic_pairs[, .N, by = topic_norm][order(-N)]  else data.table(topic_norm = character(0), N = integer(0))
method_counts <- if (nrow(all_method_pairs)) all_method_pairs[, .N, by = method_norm][order(-N)] else data.table(method_norm = character(0), N = integer(0))

cat(sprintf("Unique topics : %d\n", nrow(topic_counts)))
cat(sprintf("Unique methods: %d\n\n", nrow(method_counts)))

# Rollup-eligibility: >= 2 talks share the key
TOPIC_KEEP  <- topic_counts[N >= 2, topic_norm]
METHOD_KEEP <- method_counts[N >= 2, method_norm]

# ---- Render per-note pages --------------------------------------------------

note_status <- function(row, j) {
  if (row$download_status == "no_file" || is.na(row$file_local)) return("no_file")
  if (is.null(j)) return("extraction_failed")
  if (!is.null(j$.meta$skipped) && j$.meta$skipped == "tiny_deck") return("tiny_deck")
  "archived"
}

# OCR provenance (02b_ocr_apply.R): slugs whose text cache is VLM-OCR output.
# Footer flags these — their evidence quotes validate against OCR text, not
# born-digital source truth.
OCR_LOG <- file.path(WIKI_ROOT, "_cache", "ocr_repair_log.fst")
ocr_sourced <- character()
if (file.exists(OCR_LOG)) {
  ol <- as.data.table(fst::read_fst(OCR_LOG))[decision == "accepted"]
  ol <- ol[, .SD[.N], by = slug]
  ocr_sourced <- setNames(ol$ocr_model, ol$slug)
}

render_note <- function(row, j) {
  status <- note_status(row, j)

  topics_orig <- row$topic_origs[[1]]
  methods_orig <- row$method_origs[[1]]
  topics_norm <- row$topic_norms[[1]]
  methods_norm <- row$method_norms[[1]]

  # Tags: osqf, year, speaker_slug, top topic & method (if rollup-eligible)
  top_topic_norm  <- if (length(topics_norm) > 0)  topics_norm[1]  else ""
  top_method_norm <- if (length(methods_norm) > 0) methods_norm[1] else ""
  tags <- c("osqf", as.character(row$year), row$speaker_slug)
  if (nzchar(top_topic_norm) && top_topic_norm %in% TOPIC_KEEP)
    tags <- c(tags, slugify(top_topic_norm))
  if (nzchar(top_method_norm) && top_method_norm %in% METHOD_KEEP)
    tags <- c(tags, slugify(top_method_norm))

  okf_desc <- if (!is.null(j) && nzchar(j$headline %||% "")) j$headline else ""
  fm <- frontmatter(
    type         = "Talk",            # OKF concept type
    title        = row$title,
    description  = okf_desc,
    timestamp    = RUN_TS,            # OKF (was `updated`)
    year         = row$year,
    date         = "",  # OSQF rarely has per-talk dates; leave blank
    speaker      = row$speaker_raw,
    speaker_slug = row$speaker_slug,
    talk_type    = row$talk_type,
    time_slot    = row$time_slot,
    file_format  = row$file_ext %||% "",
    file_url     = row$file_url %||% "",
    file_local   = row$file_local %||% "",
    slug         = row$slug,
    status       = status,
    tags         = tags
  )

  # Source section
  source_lines <- c(
    sprintf("- File format: `%s`", row$file_ext %||% "(none)"),
    if (!is.na(row$file_url) && nzchar(row$file_url)) sprintf("- URL: <%s>", row$file_url) else NULL,
    if (!is.na(row$file_local) && nzchar(row$file_local)) sprintf("- Local: `%s`", row$file_local) else NULL,
    if (nzchar(row$talk_type %||% "")) sprintf("- Talk type: %s", row$talk_type) else NULL,
    if (nzchar(row$time_slot %||% "")) sprintf("- Time slot: %s", row$time_slot) else NULL
  )

  affiliation_line <- ""
  if (!is.null(j) && nzchar(j$speaker_affiliation %||% "")) {
    affiliation_line <- sprintf(" (%s)", j$speaker_affiliation)
  }
  headline <- if (!is.null(j) && nzchar(j$headline %||% "")) j$headline else
    "*(no headline extracted)*"

  body_sections <- if (status %in% c("no_file", "extraction_failed")) {
    paste0(
      "## Source\n", paste(source_lines, collapse = "\n"), "\n\n",
      "## Note\n",
      if (status == "no_file") "*No file was attached on the OSQF page for this talk.*"
      else "*LLM extraction failed for this talk; only manifest metadata is shown above.*",
      "\n"
    )
  } else {
    findings_section <- if (length(j$key_findings %||% list()) == 0) {
      "*(none extracted)*"
    } else {
      parts <- vapply(j$key_findings, function(f) {
        if (!is.list(f)) return(sprintf("- %s", as.character(f)))  # bare-string finding
        finding <- as.character(f$finding %||% "")
        quote   <- as.character(f$evidence_quote %||% "")
        base <- sprintf("- %s", finding)
        if (nzchar(quote)) base <- paste0(base, "  \n  > ", quote)
        base
      }, character(1))
      paste(parts, collapse = "\n")
    }

    # See also
    seealso <- character()
    seealso <- c(seealso,
                 sprintf("- [`years/%d.md`](../years/%d.md)", row$year, row$year))
    if (nzchar(row$speaker_slug))
      seealso <- c(seealso,
                   sprintf("- [`speakers/%s.md`](../speakers/%s.md)",
                           row$speaker_slug, row$speaker_slug))
    if (nzchar(top_topic_norm) && top_topic_norm %in% TOPIC_KEEP) {
      tslug <- slugify(top_topic_norm)
      seealso <- c(seealso,
                   sprintf("- [`topics/%s.md`](../topics/%s.md)", tslug, tslug))
    }
    if (nzchar(top_method_norm) && top_method_norm %in% METHOD_KEEP) {
      mslug <- slugify(top_method_norm)
      seealso <- c(seealso,
                   sprintf("- [`methods/%s.md`](../methods/%s.md)", mslug, mslug))
    }

    ev <- j$evidence_validation %||% list()
    model_lbl <- j$.meta$model %||% "?"
    pr <- suppressWarnings(as.numeric(ev$pass_rate %||% NA_real_))
    if (length(pr) == 0) pr <- NA_real_
    nv <- suppressWarnings(as.integer(ev$n_validated %||% 0L)); if (length(nv) == 0) nv <- 0L
    nf <- suppressWarnings(as.integer(ev$n_findings  %||% 0L)); if (length(nf) == 0) nf <- 0L
    ocr_m <- ocr_sourced[row$slug]
    src_lbl <- if (length(ocr_m) == 1 && !is.na(ocr_m))
      sprintf(", source=ocr(%s)", ocr_m) else ""
    foot <- sprintf("*Extraction: model=%s, evidence_quote pass rate=%.0f%% (%d/%d)%s*",
                    model_lbl, 100 * pr, nv, nf, src_lbl)

    paste0(
      "## Source\n", paste(source_lines, collapse = "\n"), "\n\n",
      "## Topics\n", bullet_list(topics_orig), "\n\n",
      "## Methods\n", bullet_list(methods_orig), "\n\n",
      "## Datasets used\n", bullet_list(get_field(j, "datasets_used")), "\n\n",
      "## Code & tools\n", bullet_packages(get_field(j, "code_or_tools_referenced")), "\n\n",
      "## Key findings\n", findings_section, "\n\n",
      "## Applications\n", bullet_list(get_field(j, "applications")), "\n\n",
      "## References cited\n", bullet_list(get_field(j, "references_cited")), "\n\n",
      "## See also\n", paste(seealso, collapse = "\n"), "\n\n",
      "---\n", foot, "\n"
    )
  }

  paste0(
    fm,
    "\n# ", row$title, "\n\n",
    "_", as.character(row$year), " · ", row$speaker_raw, affiliation_line, "_\n\n",
    "**Headline:** ", headline, "\n\n",
    body_sections
  )
}

# Filter event-header rows where neither speaker nor title is a real talk.
# Match against either field as a whole-string event-marker (not substring),
# so "Coffee Markets and FX Hedging" is preserved while "Coffee" is filtered.
.event_header_words <- c(
  "break", "lunch break", "lunch", "dinner break", "dinner", "coffee break", "coffee",
  "breakfast", "continental breakfast", "snacks",
  "kickoff", "registration", "introduction", "intro", "welcome",
  "closing remarks?", "wrap[- ]?up", "wrap up",
  "panel discussion", "panel", "q\\s*&?\\s*a session", "q\\s*&?\\s*a",
  "open discussion", "demos?", "thanks?", "thank yous?",
  "sponsors? introduction", "sponsors?",
  "optional pre[- ]conference (tutorials?|seminars?)",
  "social( hour| event)?", "after party",
  "registration\\s.*", "continental breakfast.*",
  "lunch\\s+(at|in|on)\\s+.*", "break\\s+(at|in|on)\\s+.*",
  "kickoff\\s+.*", "kickoff\\+.*",
  "lightning round", "closing"
)
.event_header_re <- paste0("^(", paste(.event_header_words, collapse = "|"), ")$")

is_event_header_text <- function(x) {
  s <- tolower(trimws(as.character(x)))
  s[is.na(s)] <- ""
  grepl(.event_header_re, s, perl = TRUE)
}
# Looser fuzzy check: speaker / title contains an event-marker keyword
.event_keyword_re <- "\\b(break|lunch|breakfast|coffee|snack|kickoff|registration|welcome|wrap[- ]?up|panel\\s+discussion|q\\s*&?\\s*a|sponsor|social|after\\s+party|optional\\s+(pre[- ])?conference|optional\\s+(dinner|drinks|tutorials?|seminars?|workshop)|closing\\s+remarks?|conclusion|conference\\s+(reception|dinner|drinks)|organi[sz]ers?|reception)\\b"
contains_event_keyword <- function(x) {
  s <- tolower(trimws(as.character(x)))
  s[is.na(s)] <- ""
  grepl(.event_keyword_re, s, perl = TRUE)
}
m[, sp_eh    := is_event_header_text(speaker_raw) | contains_event_keyword(speaker_raw)]
m[, ti_eh    := is_event_header_text(title)       | contains_event_keyword(title)]
m[, sp_blank := !nzchar(trimws(as.character(speaker_raw))) | is.na(speaker_raw)]
# Treat "(pdf)", "(video)", "(html)" etc. as title-blank (anchor-text leakage)
m[, ti_blank := !nzchar(trimws(as.character(title))) | is.na(title) |
                  grepl("^\\(\\s*(pdf|pptx?|pptm|html?|video|audio|mp3|mp4|key)\\s*\\)$",
                        tolower(trimws(as.character(title))), perl = TRUE)]

# Combined heuristic: row is an event header when it has no useful content AND
# the visible label/speaker text looks like an event marker.
m[, is_event_header := (
    # Both blank → header
    (sp_blank & ti_blank) |
    # No real title and the speaker contains an event keyword
    (ti_blank & sp_eh) |
    # No real speaker and the title contains an event keyword
    (sp_blank & ti_eh) |
    # Both fields contain event keywords (e.g. "Coffee Break - 15 mins")
    (sp_eh & ti_eh)
  )]
# Filter only when the row also has no usable file (no_file, error, or no
# extractable extension — guards against rows with status='ok' but no file_ext).
m[, has_no_file := download_status %in% c("no_file", "error") |
                      is.na(file_ext) | !nzchar(as.character(file_ext))]
m[, is_real_talk := !(has_no_file & is_event_header)]
m[, has_no_file := NULL]
m[, c("sp_eh", "ti_eh", "sp_blank", "ti_blank") := NULL]
m_real <- m[is_real_talk == TRUE]
cat(sprintf("Real talks    : %d (filtered %d event-header rows)\n",
            nrow(m_real), nrow(m) - nrow(m_real)))

n_written <- 0L
for (i in seq_len(nrow(m_real))) {
  body <- render_note(m_real[i], jsons[[m_real$slug[i]]])
  out_path <- file.path(NOTES_DIR, paste0(m_real$slug[i], ".md"))
  writeLines(body, out_path, useBytes = TRUE)
  n_written <- n_written + 1L
}
cat(sprintf("Wrote %d note pages\n", n_written))

# Use m_real downstream so rollups don't include event-headers
m <- m_real

# ---- Rollups: years/<YYYY>.md -----------------------------------------------
n_yr <- 0L
for (yr in sort(unique(m$year))) {
  rows <- m[year == yr][order(time_slot, title)]
  body <- paste0(
    frontmatter(type = "Year", title = paste("OSQF", yr), timestamp = RUN_TS,
                year = yr, n_talks = nrow(rows),
                tags = c("osqf", "year", as.character(yr))),
    "\n# OSQF ", yr, "\n\n",
    sprintf("%d talks (%d with files, %d without).\n\n",
            nrow(rows),
            sum(!is.na(rows$file_local) & rows$download_status == "ok"),
            sum(rows$download_status == "no_file")),
    "## Talks\n",
    paste(mapply(function(time_slot, talk_type, speaker, title, slug) {
      bits <- character()
      if (nzchar(time_slot)) bits <- c(bits, sprintf("`%s`", time_slot))
      if (nzchar(talk_type)) bits <- c(bits, sprintf("*%s*", talk_type))
      if (nzchar(speaker))   bits <- c(bits, sprintf("**%s**", speaker))
      bits <- c(bits, sprintf("[%s](../notes/%s.md)", title, slug))
      paste0("- ", paste(bits, collapse = " — "))
    }, rows$time_slot %||% "", rows$talk_type %||% "",
       rows$speaker_raw, rows$title, rows$slug),
      collapse = "\n"),
    "\n"
  )
  writeLines(body, file.path(YEARS_DIR, sprintf("%d.md", yr)), useBytes = TRUE)
  n_yr <- n_yr + 1L
}
cat(sprintf("Wrote %d year pages\n", n_yr))

# ---- Rollups: speakers/<slug>.md (every speaker, even singletons) -----------
spk_rows <- m[nzchar(speaker_slug)]
n_sp <- 0L
for (sp in unique(spk_rows$speaker_slug)) {
  rows <- spk_rows[speaker_slug == sp][order(year, title)]
  display <- rows$speaker_raw[1]
  body <- paste0(
    frontmatter(type = "Speaker", title = paste("Speaker:", display),
                timestamp = RUN_TS,
                speaker = display, speaker_slug = sp,
                n_talks = nrow(rows),
                tags = c("osqf", "speaker", sp)),
    "\n# Speaker: ", display, "\n\n",
    sprintf("%d talk(s) at OSQF.\n\n", nrow(rows)),
    "## Talks\n",
    paste(sprintf("- %d — [%s](../notes/%s.md)",
                  rows$year, rows$title, rows$slug),
          collapse = "\n"),
    "\n"
  )
  writeLines(body, file.path(SPK_DIR, sprintf("%s.md", sp)), useBytes = TRUE)
  n_sp <- n_sp + 1L
}
cat(sprintf("Wrote %d speaker pages\n", n_sp))

# ---- Rollups: topics/, methods/ (>= 2 talks only) ---------------------------
write_rollup <- function(out_dir, key_norm, kind, pairs_dt, slug_col) {
  rows <- pairs_dt[get(slug_col) == key_norm]
  rows <- merge(rows, m[, .(slug, year, title, speaker_raw, speaker_slug)],
                by = "slug")
  rows <- rows[order(year, title)]
  display <- key_norm  # normalized form
  body <- paste0(
    frontmatter(type = tools::toTitleCase(kind),
                title = paste0(tools::toTitleCase(kind), ": ", display),
                timestamp = RUN_TS,
                key = display, kind = kind,
                n_talks = nrow(rows),
                tags = c("osqf", kind, slugify(display))),
    "\n# ", tools::toTitleCase(kind), ": ", display, "\n\n",
    sprintf("%d talk(s) discuss this %s.\n\n", nrow(rows), kind),
    "## Talks\n",
    paste(sprintf("- %d — %s — [%s](../notes/%s.md)",
                  rows$year, rows$speaker_raw, rows$title, rows$slug),
          collapse = "\n"),
    "\n"
  )
  writeLines(body, file.path(out_dir, sprintf("%s.md", slugify(display))),
             useBytes = TRUE)
}

n_tp <- 0L
if (length(TOPIC_KEEP) > 0) {
  setnames(all_topic_pairs, "topic_norm", "topic_norm")
  for (k in TOPIC_KEEP) {
    write_rollup(TOPICS_DIR, k, "topic", all_topic_pairs, "topic_norm")
    n_tp <- n_tp + 1L
  }
}
cat(sprintf("Wrote %d topic pages\n", n_tp))

n_md <- 0L
if (length(METHOD_KEEP) > 0) {
  for (k in METHOD_KEEP) {
    write_rollup(METHODS_DIR, k, "method", all_method_pairs, "method_norm")
    n_md <- n_md + 1L
  }
}
cat(sprintf("Wrote %d method pages\n", n_md))

# ---- index.md ---------------------------------------------------------------
by_year   <- m[, .N, by = year][order(year)]
by_format <- m[, .N, by = file_ext][order(-N)]
by_speaker_top <- m[, .N, by = .(speaker_slug, speaker_raw)][order(-N)][1:min(30, .N)]

year_tbl <- paste(c("| Year | Talks | Page |",
                    "|---:|---:|---|",
                    sprintf("| %d | %d | [years/%d.md](years/%d.md) |",
                            by_year$year, by_year$N, by_year$year, by_year$year)),
                  collapse = "\n")
fmt_tbl <- paste(c("| Format | Talks |",
                   "|---|---:|",
                   sprintf("| `%s` | %d |",
                           ifelse(is.na(by_format$file_ext), "(no file)", by_format$file_ext),
                           by_format$N)),
                 collapse = "\n")
spk_tbl <- if (nrow(by_speaker_top) == 0) "*(none)*" else
  paste(c("| Speaker | Talks | Page |",
          "|---|---:|---|",
          sprintf("| %s | %d | [speakers/%s.md](speakers/%s.md) |",
                  by_speaker_top$speaker_raw, by_speaker_top$N,
                  by_speaker_top$speaker_slug, by_speaker_top$speaker_slug)),
        collapse = "\n")

topic_top <- topic_counts[N >= 2][1:min(30, .N)]
method_top <- method_counts[N >= 2][1:min(30, .N)]
topic_tbl <- if (nrow(topic_top) == 0) "*(no topic shared by ≥2 talks)*" else
  paste(c("| Topic | Talks | Page |",
          "|---|---:|---|",
          sprintf("| %s | %d | [topics/%s.md](topics/%s.md) |",
                  topic_top$topic_norm, topic_top$N,
                  slugify(topic_top$topic_norm),
                  slugify(topic_top$topic_norm))),
        collapse = "\n")
method_tbl <- if (nrow(method_top) == 0) "*(no method shared by ≥2 talks)*" else
  paste(c("| Method | Talks | Page |",
          "|---|---:|---|",
          sprintf("| %s | %d | [methods/%s.md](methods/%s.md) |",
                  method_top$method_norm, method_top$N,
                  slugify(method_top$method_norm),
                  slugify(method_top$method_norm))),
        collapse = "\n")

rare_topics  <- topic_counts[N == 1, topic_norm]
rare_methods <- method_counts[N == 1, method_norm]
rare_topic_block <- if (length(rare_topics) == 0) "" else paste0(
  "\n<details><summary>Rare topics (1 talk each, ", length(rare_topics), ")</summary>\n\n",
  paste(sprintf("- %s", rare_topics), collapse = "\n"),
  "\n\n</details>\n"
)
rare_method_block <- if (length(rare_methods) == 0) "" else paste0(
  "\n<details><summary>Rare methods (1 talk each, ", length(rare_methods), ")</summary>\n\n",
  paste(sprintf("- %s", rare_methods), collapse = "\n"),
  "\n\n</details>\n"
)

index_body <- paste0(
  frontmatter(type = "Index", title = "OSQF Conference Wiki — Index",
              timestamp = RUN_TS,
              n_talks = nrow(m),
              n_with_file = sum(!is.na(m$file_local) & m$download_status == "ok"),
              tags = c("osqf", "index")),
  "\n# OSQF Conference Wiki — Index\n\n",
  sprintf("%d talks across %d years (%s).\n\n",
          nrow(m), nrow(by_year),
          paste(range(by_year$year), collapse = "-")),
  "See [README.md](README.md) for query patterns and [schema.md](schema.md) for conventions.\n\n",
  "## By year\n", year_tbl, "\n\n",
  "## By file format\n", fmt_tbl, "\n\n",
  "## Top speakers\n", spk_tbl, "\n\n",
  "## Top topics\n", topic_tbl, rare_topic_block, "\n",
  "## Top methods\n", method_tbl, rare_method_block, "\n"
)
writeLines(index_body, file.path(WIKI_ROOT, "index.md"), useBytes = TRUE)
cat("Wrote index.md\n")

# ---- log.md -----------------------------------------------------------------
log_path <- file.path(WIKI_ROOT, "log.md")
log_entry <- sprintf(
  "## [%s] render | n_talks=%d, n_with_file=%d, n_years=%d, n_speakers=%d, n_topics=%d, n_methods=%d\n\n",
  RUN_DATE, nrow(m),
  sum(!is.na(m$file_local) & m$download_status == "ok"),
  n_yr, n_sp, n_tp, n_md)
existing <- if (file.exists(log_path)) readLines(log_path, warn = FALSE) else character()
header <- if (length(existing) == 0)
  c("# OSQF Wiki — Activity Log", "") else character()
writeLines(c(header, log_entry, existing), log_path, useBytes = TRUE)
cat("Appended log.md entry\n")

cat("\n== Done ==\n")
