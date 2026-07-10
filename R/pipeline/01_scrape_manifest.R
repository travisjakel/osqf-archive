# 01_scrape_manifest.R
# Crawl https://www.osqf.org/archive/, parse per-year talk listings,
# download presentation files, persist manifest.fst.
# Resumable: re-running re-parses year pages (cheap, cached), skips downloads
# when destination file already exists.

suppressPackageStartupMessages({
  library(data.table)
  library(fst)
  library(httr2)
  library(rvest)
  library(xml2)
  library(digest)
})

source("R/pipeline/00_helpers.R")

MANIFEST_PATH <- file.path(WIKI_ROOT, "manifest.fst")

# ---- Year discovery ----------------------------------------------------------

discover_years <- function() {
  url <- file.path(OSQF_BASE, "archive")
  doc <- fetch_html(paste0(url, "/"))
  if (is.null(doc)) {
    cat("WARN: could not fetch /archive/ index. Falling back to hardcoded list.\n")
    return(integer(0))
  }
  links <- rvest::html_elements(doc, "a")
  hrefs <- rvest::html_attr(links, "href")
  hrefs <- hrefs[!is.na(hrefs)]
  m <- regmatches(hrefs, regexpr("/archive/(\\d{4})/?", hrefs))
  yrs <- unique(as.integer(regmatches(m, regexpr("\\d{4}", m))))
  yrs <- sort(yrs[!is.na(yrs)])
  yrs
}

resolve_years <- function() {
  env <- Sys.getenv("OSQF_YEARS", "")
  if (nzchar(env)) {
    raw <- strsplit(env, "[,\\s]+", perl = TRUE)[[1]]
    raw <- raw[nzchar(raw)]
    yrs <- as.integer(raw)
    yrs <- yrs[!is.na(yrs)]
    cat(sprintf("Using OSQF_YEARS env: %s\n", paste(yrs, collapse = ", ")))
    return(yrs)
  }
  discovered <- discover_years()
  fallback <- c(2009:2019, 2024:2025)
  if (length(discovered) == 0) {
    cat("Year discovery failed — using hardcoded fallback.\n")
    return(fallback)
  }
  diff_extra <- setdiff(discovered, fallback)
  diff_miss  <- setdiff(fallback, discovered)
  if (length(diff_extra) > 0) {
    cat(sprintf("INFO: discovered extra year(s) not in fallback: %s\n",
                paste(diff_extra, collapse = ", ")))
  }
  if (length(diff_miss) > 0) {
    cat(sprintf("INFO: fallback year(s) not discovered (likely empty): %s\n",
                paste(diff_miss, collapse = ", ")))
  }
  discovered
}

# ---- Per-year talk-row parser ------------------------------------------------

# OSQF year pages list talks as a sequence of links + surrounding text. The
# DOM varies across years (some use tables, some <ul>, some bare <p>). We use
# a defensive multi-pass extraction:
#   1) collect every <a> with an href that points to a file (not a year, not
#      "/archive/", not external).
#   2) for each such anchor, walk up the DOM until we hit a block element
#      (li, tr, p, div) and use its text as the talk row.
#   3) speaker_raw + title come from the row text; title prefers the anchor
#      text if it looks descriptive (>5 chars), else falls back to row text.

.is_file_link <- function(href) {
  if (is.na(href) || !nzchar(href)) return(FALSE)
  if (grepl("^(mailto:|tel:|javascript:)", href, ignore.case = TRUE)) return(FALSE)
  href_l <- tolower(href)
  ext <- tolower(tools::file_ext(sub("[?#].*$", "", href)))
  if (nzchar(ext) && ext %in% c("pdf", "pptx", "ppt", "pptm", "html", "htm",
                                 "key", "zip", "mp4", "mov")) return(TRUE)
  FALSE
}

.row_text <- function(anchor) {
  # Walk up through inline elements to find a block-level container
  node <- anchor
  for (depth in 1:6) {
    parent <- xml2::xml_parent(node)
    if (inherits(parent, "xml_missing") || is.null(parent)) break
    nm <- xml2::xml_name(parent)
    if (nm %in% c("li", "tr", "p", "div", "section", "article", "td", "dd")) {
      return(rvest::html_text2(parent))
    }
    node <- parent
    if (nm == "body") break
  }
  rvest::html_text2(anchor)
}

# Heuristic: from a row text and an anchor text, return list(speaker, title).
# Pattern observed on OSQF: "Speaker Name(s) — Talk Title" or
# "Speaker: Title" or "Talk Title — Speaker Name". The anchor text is
# usually the title. We split on common delimiters (em-dash, hyphen, colon).
.split_speaker_title <- function(row_text, anchor_text) {
  rt <- trimws(gsub("\\s+", " ", row_text))
  at <- trimws(gsub("\\s+", " ", anchor_text))

  if (!nzchar(rt)) {
    return(list(speaker = "", title = if (nzchar(at)) at else "Untitled"))
  }

  # Try splitting on em-dash, en-dash, hyphen-space, or colon
  for (sep in c("—", "–", " - ", " : ", ": ", " | ")) {
    parts <- strsplit(rt, sep, fixed = TRUE)[[1]]
    if (length(parts) >= 2) {
      a <- trimws(parts[1])
      b <- trimws(paste(parts[-1], collapse = sep))
      # Decide which side is speaker by length + capitalization heuristic:
      # speakers tend to be shorter (2-50 chars), titles longer.
      if (nchar(a) < nchar(b) && nchar(a) <= 80) {
        return(list(speaker = a, title = b))
      } else {
        return(list(speaker = b, title = a))
      }
    }
  }

  # No delimiter — anchor text becomes the title; speaker is whatever is
  # left in row_text after removing anchor_text.
  if (nzchar(at) && nchar(at) >= 5) {
    leftover <- trimws(sub(at, "", rt, fixed = TRUE))
    leftover <- gsub("[\\s—–:|-]+$", "", leftover, perl = TRUE)
    leftover <- gsub("^[\\s—–:|-]+", "", leftover, perl = TRUE)
    return(list(speaker = leftover, title = at))
  }
  list(speaker = "", title = rt)
}

# Primary parser: OSQF year pages use <td> rows with structured children:
#   <font class="rf-talk-type" rf-data-type="Tutorial|Talk|Keynote|Panel">Speaker</font>
#   <font>Talk Title</font>
#   <a href="...presentation.pdf">(pdf)</a>
# Sibling <td> in the parent <tr> may carry a time slot like "09:05 - 09:25".
parse_year_dom <- function(doc, year, base_url) {
  speaker_nodes <- rvest::html_elements(doc, "font.rf-talk-type")
  if (length(speaker_nodes) == 0) return(data.table())
  out <- vector("list", length(speaker_nodes))
  for (i in seq_along(speaker_nodes)) {
    sp <- speaker_nodes[[i]]
    td <- xml2::xml_parent(sp)
    if (inherits(td, "xml_missing")) next
    # Title: next <font> sibling that is NOT the speaker node
    fonts <- rvest::html_elements(td, "font")
    title <- ""
    for (f in fonts) {
      if (identical(xml2::xml_attr(f, "class"), "rf-talk-type")) next
      title <- rvest::html_text2(f)
      break
    }
    # File link
    a <- rvest::html_element(td, "a[href]")
    file_url <- if (inherits(a, "xml_missing") || is.null(a)) NA_character_ else
      abs_url(rvest::html_attr(a, "href"), base = base_url)
    anchor_text <- if (inherits(a, "xml_missing") || is.null(a)) "" else
      rvest::html_text2(a)
    file_ext <- clean_ext(file_url)
    if (!is.na(file_ext) && !.is_file_link(file_url)) {
      file_url <- NA_character_; file_ext <- NA_character_
    }
    # Talk type (Tutorial / Talk / Keynote / Panel / etc.)
    talk_type <- xml2::xml_attr(sp, "rf-data-type")
    if (is.na(talk_type)) talk_type <- ""
    # Time slot (sibling <td>)
    time_slot <- ""
    tr <- xml2::xml_parent(td)
    if (!inherits(tr, "xml_missing")) {
      time_td <- rvest::html_element(tr, "td:first-child")
      if (!inherits(time_td, "xml_missing") && !identical(xml2::xml_path(time_td), xml2::xml_path(td))) {
        time_slot <- trimws(rvest::html_text2(time_td))
      }
    }
    out[[i]] <- data.table(
      year         = year,
      speaker_raw  = trimws(rvest::html_text2(sp)),
      title        = trimws(title),
      talk_type    = talk_type,
      time_slot    = time_slot,
      file_url     = file_url,
      file_ext     = file_ext,
      anchor_text  = anchor_text,
      row_text     = trimws(rvest::html_text2(td))
    )
  }
  rbindlist(out, fill = TRUE)
}

# Fallback parser: scan all anchors with file extensions, walk up to the
# nearest block-level container, and split row text into speaker/title.
parse_year_fallback <- function(doc, year, base_url) {
  anchors <- rvest::html_elements(doc, "a")
  hrefs   <- rvest::html_attr(anchors, "href")
  texts   <- rvest::html_text2(anchors)
  keep <- vapply(hrefs, .is_file_link, logical(1))
  if (!any(keep)) return(data.table())
  out <- vector("list", sum(keep))
  idx <- 0L
  for (i in which(keep)) {
    idx <- idx + 1L
    href     <- hrefs[i]
    anchor   <- anchors[[i]]
    anchor_t <- texts[i]
    row_t    <- .row_text(anchor)
    file_url <- abs_url(href, base = base_url)
    file_ext <- clean_ext(file_url)
    st       <- .split_speaker_title(row_t, anchor_t)
    out[[idx]] <- data.table(
      year         = year,
      speaker_raw  = st$speaker,
      title        = st$title,
      talk_type    = "",
      time_slot    = "",
      file_url     = file_url,
      file_ext     = file_ext,
      anchor_text  = anchor_t,
      row_text     = row_t
    )
  }
  rbindlist(out, fill = TRUE)
}

parse_year_page <- function(year) {
  url <- sprintf("%s/archive/%d/", OSQF_BASE, year)
  doc <- fetch_html(url)
  if (is.null(doc)) {
    cat(sprintf("[%d] FAIL: could not fetch %s\n", year, url))
    return(data.table())
  }

  res <- parse_year_dom(doc, year, url)
  parser <- "dom"
  if (nrow(res) == 0) {
    res <- parse_year_fallback(doc, year, url)
    parser <- "fallback"
  }
  if (nrow(res) == 0) {
    cat(sprintf("[%d] WARN: no rows parsed (both DOM and fallback)\n", year))
    return(res)
  }
  if (nrow(res) == 0) return(res)

  # Dedupe by file_url within year (keeping rows without file_url too)
  has_url <- !is.na(res$file_url)
  if (any(has_url)) {
    res <- rbind(unique(res[has_url], by = "file_url"), res[!has_url], fill = TRUE)
  }

  # Compute slug + speaker_slug
  res[, speaker_slug := vapply(speaker_raw, slugify_speaker, character(1))]
  res[!nzchar(speaker_slug), speaker_slug := slugify(title)]
  res[!nzchar(speaker_slug), speaker_slug := sprintf("untitled_%d", seq_len(.N))]

  res[, slug := slug_for(year, speaker_slug)]

  # Disambiguate within-year slug collisions with _2/_3 suffixes
  res[, dup_idx := seq_len(.N) - 1L, by = slug]
  res[dup_idx > 0, slug := sprintf("%s_%d", slug, dup_idx + 1L)]
  res[, dup_idx := NULL]

  cat(sprintf("[%d] %s parsed %d rows (formats: %s)\n",
              year, parser, nrow(res),
              paste(sort(unique(na.omit(res$file_ext))), collapse = ",")))
  res
}

# ---- Main --------------------------------------------------------------------

cat("== 01_scrape_manifest.R ==\n")
years <- resolve_years()
if (length(years) == 0) {
  stop("No years to scrape.")
}
cat(sprintf("Years: %s\n", paste(years, collapse = ", ")))

per_year <- lapply(years, parse_year_page)
m <- rbindlist(per_year, fill = TRUE)

if (nrow(m) == 0) {
  cat("WARN: no rows parsed across all years; manifest will be empty.\n")
}

# Build local file path & download status fields
m[, file_local := file.path(FILES_DIR, year, paste0(slug, ".", file_ext))]
m[, fetched_at := as.character(NA)]
m[, sha256     := as.character(NA)]
m[, download_status := "pending"]

# ---- Download files ----------------------------------------------------------
cat(sprintf("\nDownloading %d files...\n", nrow(m)))
n_ok <- 0L; n_skip <- 0L; n_fail <- 0L
for (i in seq_len(nrow(m))) {
  if (is.na(m$file_url[i]) || !nzchar(m$file_url[i])) {
    set(m, i, "download_status", "no_file"); next
  }
  if (file.exists(m$file_local[i]) && file.size(m$file_local[i]) > 0) {
    set(m, i, "download_status", "ok")
    set(m, i, "sha256",
        digest::digest(file = m$file_local[i], algo = "sha256"))
    n_skip <- n_skip + 1L
    next
  }
  res <- download_file(m$file_url[i], m$file_local[i])
  set(m, i, "download_status", res$status)
  set(m, i, "fetched_at", as.character(Sys.time()))
  if (res$ok) {
    set(m, i, "sha256", res$sha256)
    n_ok <- n_ok + 1L
  } else {
    set(m, i, "file_local", NA_character_)
    n_fail <- n_fail + 1L
  }
  if (i %% 25 == 0 || i == nrow(m)) {
    cat(sprintf("  [%d/%d] ok=%d skip=%d fail=%d\n",
                i, nrow(m), n_ok, n_skip, n_fail))
  }
}

# ---- Persist manifest --------------------------------------------------------

# Reorder columns
keep_cols <- c("year", "speaker_raw", "speaker_slug", "title", "slug",
               "talk_type", "time_slot",
               "file_url", "file_ext", "file_local", "download_status",
               "sha256", "fetched_at", "anchor_text", "row_text")
keep_cols <- intersect(keep_cols, names(m))
m <- m[, ..keep_cols]

write_fst(m, MANIFEST_PATH)

cat("\n== Summary ==\n")
cat(sprintf("Total rows : %d\n", nrow(m)))
cat(sprintf("Downloaded : %d (newly)\n", n_ok))
cat(sprintf("Existing   : %d\n", n_skip))
cat(sprintf("Failed     : %d\n", n_fail))
cat(sprintf("No file    : %d\n", sum(m$download_status == "no_file")))
cat("\nBy year:\n")
print(m[, .N, by = year][order(year)])
cat("\nBy file_ext:\n")
print(m[, .N, by = file_ext][order(-N)])
cat("\nBy download_status:\n")
print(m[, .N, by = download_status][order(-N)])
cat(sprintf("\nManifest written to %s\n", MANIFEST_PATH))
