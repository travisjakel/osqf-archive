---
type: Runbook
title: "OCR / VLM Conditions of Use — document text & visual extraction"
description: "Which tool to reach for when extracting content from documents (PDFs, decks, scans): pdftools/officer vs PaddleOCR-VL vs PixelRAG, per the 2026-07-08 OSQF bake-off."
timestamp: 2026-07-08T00:00:00Z
tags: [ops, ocr, vlm, pixelrag, osqf]
status: active
---

# OCR / VLM Conditions of Use — document text & visual extraction

_Created 2026-07-08 (OSQF/R_Finance corpus re-extraction project). Owner: osqf-archive._

Which tool to reach for when getting content out of documents (PDFs, decks, scans), based on the 2026-07-08 bake-off on 15 stratified OSQF/R_Finance conference decks (`osqf_wiki/_cache/ocr_bakeoff/results.json`).

## Decision matrix

| Input / question | Tool | Why |
|---|---|---|
| Born-digital text PDF | `pdftools::pdf_text` (osqf stage 02) | Fastest, lossless for real text layers |
| PPTX/PPTM with real text boxes | `officer::pptx_summary` (osqf stage 02) | Native text, keeps slide structure |
| Scanned / garbled / image-rendered text / SmartArt / legacy `.ppt` | **VLM-OCR: PaddleOCR-VL** on vLLM :8905 (soffice→PDF→300dpi PNG→`23_ocr_osqf_corpus.py`) | Bake-off winner; recovers decks text-parsing can't touch |
| Chart/table/exhibit **retrieval** question ("what value is in that grid?") | **PixelRAG `pixel_search`** (`corpus='osqf'` conference decks) | Proven +0.50 over text on table Qs; OCR only fixes the text layer, pixels keep the layout |
| Chart **data** extraction (reading values off a plot) | PixelRAG (vision reader on the page image) | NEITHER OCR model reads charts well (both ~0.55 fidelity on chart pages) |
| Very long multi-page one-shot parse (40+ pp in one context) | Unlimited-OCR Base mode | Its only distinctive strength (flat KV cache); NOT worth it per-page — see bake-off |

## Bake-off results (2026-07-08, 15 decks / 37 judged pages, Claude-vision judge)

| Metric | Unlimited-OCR | **PaddleOCR-VL** |
|---|---|---|
| Fidelity (all pages) | 0.48 | **0.76** |
| Fidelity (chart pages) | 0.54 | 0.57 |
| Hallucinated pages | 13/37 | **4/37** |
| Stage-03 evidence-quote pass (downstream) | 39.7% | **70.1%** |
| Model size / VRAM | 6.4 GB / ~13 GB | **2.0 GB / ~13 GB @0.55 util** |

**Verdict: PaddleOCR-VL** for all per-page OCR. *(2026-07-09 addendum: MinerU
3.4 hybrid-engine tested as a third arm — fidelity tie 0.74 vs 0.76,
hallucination tie 3–3, downstream evidence pass 65.5% vs 70.1% → paddle holds.
MinerU is +0.09 better on chart pages but pixel retrieval owns charts anyway.
Details: `sota_upgrades_2026_07.md`, `results_paddle_vs_mineru.json`.)* Unlimited-OCR failure modes observed: returns *empty output* on many chart/dense pages, hallucinates (fake URLs, "this image has no text" narrations, coordinate markup leakage), and only answers its trained prompt `"Free OCR."` — markdown-mode and free-form prompts return 0 chars. PaddleOCR-VL answers `"OCR:"`.

## Runtime & serving (Mode D)

- Server: `python/pixel/start_ocr_server.sh` (`OCR_MODEL=paddle|unlimited`) → vLLM OpenAI API on **:8905**, `~/ocr_venv`, `--gpu-memory-utilization 0.55`.
- **vLLM must be 0.24.0 (pinned)** for PaddleOCR-VL on this box. Git-main (pre-0.25) crashes on WSL2 with `RuntimeError: UVA is not available`; Unlimited-OCR needs ≥0.25 which as of 2026-07-08 exists only as the `vllm/vllm-openai:unlimited-ocr` docker tag. `VLLM_USE_FLASHINFER_SAMPLER=0` required (no CUDA toolkit in WSL for flashinfer JIT).
- **Mode D** in the GPU table: OCR :8905 ≈ 13 GB — mutually exclusive with Mode A (vLLM-text :8000), Mode B (pixel :8903/:8904), and a *loaded* Windows Ollama model. Idle Ollama daemon is fine.
- Driver: `python/pixel/23_ocr_osqf_corpus.py` — per-page SHA1 cache keyed (png bytes, model, prompt) → fully resumable; transcripts land in `osqf_wiki/_cache/ocr_text/<slug>.txt`, pages joined by `--- PAGE BREAK ---`.
- Prompt probing tool: `wsl/test_ocr_prompt.py`. These OCR VLMs only answer trained task prompts — always probe before assuming a new prompt works.

## Cloud policy distinction

Extraction is **100% local** (models on the 3090 Ti; corpus never leaves the box). The bake-off **judge** ran on cloud Claude-vision via OpenRouter — acceptable **only because OSQF/R_Finance decks are public conference material**. Do NOT reuse the cloud judge on private corpora (client data) — use the local Qwen2.5-VL reader (:8904) instead.

## Provenance caveat (evidence quotes)

Notes whose text cache came from OCR carry `source=ocr(<model>)` in the extraction footer and `ocr_model=` in the text-cache header. For these, stage-03 **evidence quotes validate against OCR output, not born-digital source truth** — a verbatim-matching quote can still inherit an OCR misread. The acceptance gate (`02b_ocr_apply.R`: ≥300 chars AND ≥0.7× old length) blocks regressions vs the old text layer, and the 4/37 hallucination rate is the residual risk floor.

## Known limits

- Judge HTTP 400 on oversized base64 pages (photo-heavy 300-dpi slides) — 4/41 pages unjudged.
- Chart pages: both OCR models ~0.55 fidelity — treat OCR'd chart text as labels only, never as data. PixelRAG is the chart answer.
- 25 source PDFs are corrupt (fail `fitz.open`) — dead downloads, not extraction failures; they stay `extraction_failed`/`no_file`.
