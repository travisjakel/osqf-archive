# NOTICE — provenance, licensing, and takedown

## Source material

This archive derives from presentation files **publicly posted** on the
osQF / R-in-finance conference websites (osqf.org and its predecessor
domains), 2009–2026.

What this repository and its release assets contain:

- **Derived notes** — LLM-generated structured summaries with *short verbatim
  evidence quotes* (each validated against the source text), speaker
  attribution, and a link back to the original file's public URL.
- **Embeddings and indexes** over that derived text.
- **No original presentation files.** Speaker PDFs/decks are never
  redistributed here; the pipeline downloads them from their public URLs at
  build time only. The same applies to companion research papers — only
  page-level text excerpts and links are indexed; fetched PDFs stay local.

## Licensing

- **Code** (R pipeline, Python services, MCP server): MIT — see `LICENSE`.
- **Derived notes and wiki pages** (`notes/`, `wiki/`): CC-BY-4.0. Attribution
  belongs to the original speakers named in each note; the compilation and
  note structure are provided by the archive maintainer.
- **Original talks**: copyright remains entirely with their authors. Inclusion
  here is indexing/commentary with linked attribution, not republication.

## Models

No model weights ship in this repository. Build scripts pull from upstream:

| model | role | license (see upstream card) |
|---|---|---|
| qwen3:14b (Ollama) | structured note extraction | Apache-2.0 |
| nomic-embed-text v1.5 | text embeddings | Apache-2.0 |
| PaddleOCR-VL | VLM-OCR of low-fidelity decks | Apache-2.0 |
| Qwen VL family (incl. ColQwen retriever) | pixel retrieval + page reading | Apache-2.0 / Qwen license |

## Takedown

If you are a speaker or rights holder and want a talk's derived note, quotes,
or index entries removed: **open a GitHub issue** on this repository (or
contact the maintainer) with the talk slug — it will be removed from the repo
and the next release asset. No justification required.
