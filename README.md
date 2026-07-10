# osqf-archive

**Eighteen years of osQF / R-in-finance conference talks (2009–2026), turned into
a searchable, chattable archive** — derived notes, embeddings, an entity graph,
and an MCP server — built end-to-end with local open-weight models on a single
workstation GPU (one RTX 3090 Ti, zero cloud calls in the pipeline).

Companion artifact to the paper *"Text, OCR, or Pixels? A Retrieval Decision
Matrix for Quant-Finance Documents, Built on Eighteen Years of the osQF
Archive"* (osQF 2026 submission — `docs/`).

## Chat with the archive in five minutes

No models, no GPU, no server needed:

1. `pip install "mcp>=1.9" "duckdb>=1.1"`
2. Download `notes.duckdb` from this repo's **Releases** (~50 MB).
3. Register the stdio server in your MCP client (Claude Desktop, Claude Code,
   Cursor, ...) — full copy-paste configs in
   [`osqf_mcp/CLIENT_SETUP.md`](osqf_mcp/CLIENT_SETUP.md).

Then ask things like *"Who are the recurring experts on portfolio optimization
and what did they present most recently?"* or *"Which talks covered regime
switching, across all 18 years?"*

Conference attendees: a hosted endpoint + shared token are on the talk's
closing slide — same tools, zero install.

## What's inside

| path | contents |
|---|---|
| `notes/` | 626 derived talk notes (markdown; headline, key findings with verbatim evidence quotes, methods, source URL) |
| `wiki/` | rollup pages: years, speakers, 199 topics, 111 methods |
| `R/pipeline/` | the 8-stage build pipeline (scrape → text extract → OCR gate → LLM extraction → render → embed → paper harvest → MCP precompute) |
| `R/query.R`, `R/assoc.R` | semantic search + Personalized-PageRank associative retrieval |
| `python/pixel/` | PixelRAG layer: page rendering, pixel embedding (late-interaction), VLM reader with crop-on-demand zoom, OCR serving |
| `osqf_mcp/` | the MCP server (stdio + authenticated HTTP), see its `CLIENT_SETUP.md` |
| `docs/` | the retrieval **decision matrix** and the paper |

Release assets (not tracked): `notes.duckdb` — chunks + embeddings, notes,
manifest, tags, precomputed related-talks/experts tables, and a persisted
full-text index so search works with zero models.

## How it was built

1. **Scrape** the public conference agenda pages → manifest of 800+ entries.
2. **Extract text** per deck (pdftools/officer), with a **VLM-OCR pass**
   (PaddleOCR-VL served by vLLM) applied only where it beats native
   extraction — an acceptance gate keeps the better of the two per document.
3. **LLM extraction** (qwen3:14b via Ollama, forced tool-call): structured
   notes where every key finding must carry a **verbatim evidence quote**
   validated against the source text (69% corpus pass rate).
4. **Embeddings** (nomic-embed-text, 768-d) into DuckDB with an HNSW index;
   4,111 chunks across 462 extracted talks + 440 companion-paper pages.
5. **Pixel layer**: 12,276 page images at 300 dpi, late-interaction
   (ColQwen-style MaxSim) retrieval — for the chart/table questions where all
   text pipelines fail.
6. **Entity graph**: talk↔topic/speaker/tag edges, IDF-weighted; Personalized
   PageRank surfaces bridging talks and per-topic experts.

When to use which layer is the point of the paper — the short version is in
[`docs/decision_matrix.md`](docs/decision_matrix.md).

## Rebuild it yourself

The pipeline is re-runnable from a clean clone (R ≥ 4.3 + a local Ollama):

```r
# smoke: one conference year end-to-end
Sys.setenv(OSQF_YEARS = "2025")
source("R/pipeline/run_all.R")
```

The pixel/OCR layers additionally need a CUDA GPU and the Python services
under `python/pixel/` (each script documents its venv and serving mode).
Model weights are **not** in this repo — scripts pull from their upstream
repos (see `NOTICE.md` for licenses).

## Provenance, licensing, takedown

Talk decks are indexed from their **publicly posted** conference URLs; original
PDFs are **not redistributed** — every note links back to the source file.
Code is MIT; derived notes are CC-BY-4.0 with speaker attribution. Details and
takedown process: [`NOTICE.md`](NOTICE.md).
