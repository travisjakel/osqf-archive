## [2026-07-10] osqf_mcp attendee server built + smoke-tested (osQF submission task 3/5)

`osqf_wiki/mcp/` (canonical) → exported to `osqf_mcp/` in the public staging tree. Merges the two house templates: piper data-product sandbox (in-memory catalog, `enable_external_access=false`, SELECT/WITH-only, 500-row cap) + the daily-insight HTTP transport (sha256 bearer tokens, DNS-rebinding protection, /health) **plus a global rate limiter (60 req/min, 429)**.

- **One-file data plane**: `scripts/07_mcp_precompute.R` builds the enriched release `notes.duckdb` (48.8 MB): chunks 4,111 + paper_chunks 440 (embeddings intact for server-side semantic) + talks 835 (sanitized manifest) + notes 626 (from the IP-gated staging export, NOT raw) + talk_tags/paper_links + **precomputed PPR** `related_talks` (1,187 rows / 322 talks) + `experts` (395 rows / 232 topic-tag entities, same IDF-weighted entity-graph design as assoc_wiki) + **persisted FTS index** (zero-model BM25 fallback — offline bundle needs only `pip install mcp duckdb`).
- Tools: about / search_talks (semantic via local Ollama nomic, auto-fallback BM25) / get_talk / browse / related_talks / find_experts / run_select (embedding columns stripped from the sandbox catalog).
- Smokes ALL PASS: tool logic (incl. 4 sandbox negatives + row cap), semantic self-retrieval score=1.0 + filter combo, stdio JSON-RPC (initialize→tools/list→call), HTTP (health open, 401/403 auth, session tool calls, rate-limit 429s), staged post-rewrite copy.
- Gotchas: (1) `key` is a reserved arg of `data.table()` — can't be a column name at construction; (2) multibyte chars shift `regmatches` offsets on some notes → strict `^(topics|speakers)/[a-z0-9_]+$` validation on extracted entities (one junk graph node otherwise); (3) export gate correctly caught deny-listed vocab in 06_harvest_papers.R header — reworded.
- 90_export_public.R now stages the MCP package + scripts 06/07 (GATE PASSED, 1,443 files); notes.duckdb release asset OWNED by 07 (90 no longer clobbers it with the raw copy).
- Next (Jul 14): README/LICENSE/NOTICE, git init staging → private → review → public; `tailscale funnel --bg 8788`; CLIENT_SETUP tested off-network.

## [2026-07-08] render | n_talks=626, n_with_file=468, n_years=15, n_speakers=380, n_topics=199, n_methods=111

## [2026-07-08] VLM-OCR full re-extraction + PixelRAG pixel_osqf

Full-corpus re-extraction with **PaddleOCR-VL** (bake-off winner over baidu/Unlimited-OCR — fidelity 0.76 vs 0.48, hallucination 4/37 vs 13/37 pages, downstream evidence pass 70% vs 40%; `_cache/ocr_bakeoff/results.json`; policy: `wiki/ops/ocr_vlm_conditions_of_use.md`).

- Prep: 74 ppt/pptx/pptm → PDF via LibreOffice (`convert_decks_to_pdf.R`, 0 failures — closes the legacy-`.ppt` gap); 462/487 docs rendered to 12,276 page-PNGs @300dpi (25 corrupt PDFs fail `fitz.open` — dead downloads); shared render feeds OCR + PixelRAG.
- OCR (vLLM :8905, ~4h): 462 transcripts. `02b_ocr_apply.R` gate (≥300 chars AND ≥0.7× old): **349 accepted / 113 ocr_no_gain** (median ratio 1.09; no-gain ≈ 2009-2011 beamer PDFs where pdftools wins).
- Stage 03 re-run (qwen3:14b): 218 fresh extractions at **71.1%** evidence pass; 51 persistent `no_tool_call` failures **reverted to pre-OCR text+json** (`02c_revert_03_failures.R` — strict best-of-both, no regressions). Fixed latent bare-string `key_findings` crash in 03+04 validators.
- Result: **462 extracted talks** (was 443; +19 recovered incl. legacy ppt + garbled PDFs), corpus evidence pass 69.2% (68.9% before, on a larger pool), **4,111 chunks** in notes.duckdb (18 stale orphans purged by the new stage-05 cleanup), 199 topic / 111 method pages (181/96). OCR-sourced notes carry `source=ocr(paddle)` footers.
- Downstream: unified Qdrant rebuilt (osqf 4,111 of 11,612); Rich_R `wiki_assoc` graph rebuilt (985 nodes / 462 talks / 890 entity edges; "robust portfolio optimization" → Palomar/Pfaff/Kapler ✓); **`pixel_osqf`** Qdrant collection embedding 12,276 page-images (Qwen3-VL-Embedding-2B) — `pixel_search(corpus='osqf')` in chat.py for chart/table questions.
- Rollback: `_cache/text_pre_ocr_20260708/`, `_cache/json_pre_ocr_20260708/`, `embeddings/notes.duckdb.bak_20260708`.

## [2026-06-17] render | n_talks=626, n_with_file=468, n_years=15, n_speakers=380, n_topics=181, n_methods=96


# OSQF Wiki — Activity Log

## [2026-05-03] render | n_talks=626, n_with_file=468, n_years=15, n_speakers=380, n_topics=181, n_methods=96

Final state after post-build audit. Event-header filter extended to drop Break/Lunch/Kickoff/Conclusion/Conference Reception/Optional rows + anchor-text-leakage `(pdf)`/`(video)` titles. 209 event-header rows filtered from 835 manifest rows. Embeddings DB rebuilt: **3,940 chunks across 443 unique slugs** (only `archived` + `tiny_deck` notes embedded; `no_file` + `extraction_failed` skipped per stage 05).

## [2026-05-02] build | initial pipeline run, 2025 smoke test → full backfill 2009-2025

Smoke test (`OSQF_YEARS=2025`): 41 manifest rows → 25 with files → 25 LLM extractions → 41 note pages, 225 embedded chunks, semantic queries validated.

Full backfill (started 22:30, complete 02:30 = ~4 hr wall-clock):
- Stage 01: 835 rows scraped across 15 years (2009-2019, 2022-2025; 2020-2021 absent), 469 files downloaded, 45 download errors (broken old links), 321 no-file rows (event headers, missing decks, panels).
- Stage 02: 455 talks text-extracted (PDF: pdftools, PPTX/PPTM: officer, HTML: rvest), 20 thin extractions (<300 chars) logged to `_cache/extraction_errors.fst`. ~75s elapsed via 4 parallel workers.
- Stage 03: 418 successful LLM extractions, 12 failures (no_tool_call on garbled old PDFs), 8 tiny_deck stubs. Mean evidence_quote pass rate **68.9%** (whitespace-normalized first-60-char substring match). Throughput ~17s/talk after model warmup.
- Stage 04: rendered 685 note pages initially, refined to **626** after extending event-header filter; 15 year pages, 380 speaker pages, 181 topic pages, 96 method pages.
- Stage 05: 3,940 embedded chunks via `nomic-embed-text:latest` (768d), HNSW cosine index built. Topic/method tags persisted to sidecar `embeddings/talk_tags.fst`.

Top speakers (real people): Dirk Eddelbuettel 12, Kris Boudt 9, Ilya Kipnis 9, Thomas Harte 8, Michael Kane 7.
