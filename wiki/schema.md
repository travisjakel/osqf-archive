# OSQF Wiki — Schema & Conventions

## Slug

`<year>__<speaker_slug>` (e.g. `2025__dale_rosenthal`). Built from year + slugified primary speaker name. Multiple speakers join with `_and_`. Within-year collisions append `_2`, `_3`.

## Note frontmatter

```yaml
updated:      YYYY-MM-DD
year:         INTEGER
date:         (mostly empty — OSQF rarely lists per-talk dates)
speaker:      "raw display name(s)"
speaker_slug: jane_q_smith
title:        "Talk title"
talk_type:    Tutorial | Talk | Keynote | Panel | (empty)
time_slot:    "09:05 - 09:25" | (empty)
file_format:  pdf | pptx | pptm | html
file_url:     https://www.osqf.org/archive/.../...
file_local:   _cache/files/<year>/<slug>.<ext>
slug:         <year>__<speaker_slug>
status:       archived | tiny_deck | extraction_failed | no_file
tags:         [osqf, <year>, <speaker_slug>, <top_topic_slug>, <top_method_slug>]
```

## Note H2 sections (fixed order)

1. **Source** — file format, URL, local path, talk type, time slot
2. **Topics** — high-level themes (1-6)
3. **Methods** — specific techniques
4. **Datasets used** — explicitly named only
5. **Code & tools** — R/Python packages, GitHub repos, frameworks (package-y items in backticks)
6. **Key findings** — bullet + verbatim `> evidence_quote`
7. **Applications** — practical use cases
8. **References cited** — papers / books / author-year stubs
9. **See also** — links to year, speaker, top topic, top method rollups

Footer: `*Extraction: model=…, evidence_quote pass rate=NN% (k/n)*` — gains
`, source=ocr(<model>)` when the text cache came from the VLM-OCR re-extraction
(2026-07-08, PaddleOCR-VL). For those notes evidence quotes validate against
OCR output, not born-digital source truth. See
`wiki/ops/ocr_vlm_conditions_of_use.md`.

## Status values

- `archived` — full extraction succeeded.
- `tiny_deck` — source text < 500 chars; LLM call skipped, headline = title, all arrays empty.
- `extraction_failed` — LLM call failed and no JSON cached.
- `no_file` — manifest row had no file URL (panels, intros, lunches, missing decks).

OCR repair decisions (not statuses — logged in `_cache/ocr_repair_log.fst` by
`02b_ocr_apply.R`): `accepted` (text cache replaced by OCR transcript; header
gains `ocr_model=`) and `ocr_no_gain` (OCR failed the gate — <300 chars or
<0.7× old length — old text kept).

## Cross-rollups

- `years/<YYYY>.md` — every talk, regardless of status.
- `speakers/<slug>.md` — every speaker, including singletons.
- `topics/<slug>.md` — only topics with ≥2 talks (singletons live in `index.md` rare-topics).
- `methods/<slug>.md` — only methods with ≥2 talks (singletons live in `index.md` rare-methods).

## Topic / method normalization

`normalize_topic()` lowercases, strips diacritics, drops a small stopword set (`a, an, the, of, on, in, for, and, with, using, to, via`), collapses whitespace. Display in note bullets uses original LLM phrasing; rollup filename and tag use the normalized slug.

## Embeddings

DuckDB `chunks` table — one row per `(slug, H2 section)`:

```
chunk_id, slug, section, text, text_hash, year, speaker, speaker_slug,
file_format, status, embedding (FLOAT[768])
```

Topic/method tags in sidecar `embeddings/talk_tags.fst` (`slug, tag_value`). Joined at query time when `filter = list(topic = ..., method = ...)` is passed.

Embeddings are idempotent on `text_hash` — re-runs only re-embed sections that changed.

## What NOT to expect

- Per-talk dates rarely available (year only).
- Speaker affiliations only when stated in the deck.
- Tickers usually empty (academic conference, not equity research).
- PPTX text extraction misses image-rendered text and SmartArt — since the
  2026-07-08 VLM-OCR re-extraction these decks are OCR'd instead
  (PaddleOCR-VL); residual gaps flagged via `_cache/ocr_repair_log.fst`.
- Chart DATA is not in the text layer under any extractor — chart questions
  route to PixelRAG `pixel_search(corpus='osqf')` (page-image retrieval over
  the same decks, Qdrant `pixel_osqf`).
