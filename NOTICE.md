# NOTICE: attribution, licensing, provenance and takedown

osqf-archive
Copyright 2026 Travis S. Jakel
https://github.com/travisjakel/osqf-archive

## Attribution

If you redistribute this code, or a work derived from it, section 4(d) of the
Apache License 2.0 requires you to carry the attribution notices in this file.

If you reuse the derived notes or the index, CC BY 4.0 requires credit. Use
this line, or an equivalent that names the same author and source:

> osqf-archive by Travis S. Jakel, https://github.com/travisjakel/osqf-archive (CC BY 4.0)

To cite the project in writing, use `CITATION.cff` (GitHub's "Cite this
repository" button reads it).

## Unofficial

osqf-archive is an independent, unofficial project. It is not affiliated with,
sponsored by or endorsed by the osQF conference, its organizing committee,
R/Finance or the University of Illinois Chicago. The name osQF is used only to
describe the talks the archive indexes.

## Licensing

- **Code** (R pipeline, Python services, MCP server): Apache License 2.0, see
  `LICENSE`. Releases up to and including v0.1 were published under the MIT
  License, and copies obtained under it stay under it.
- **Derived notes, rollup pages and indexes** (`notes/`, `wiki/`, and the
  `notes.duckdb` release asset): CC BY 4.0, see `LICENSE-DATA`. The licence
  covers the maintainer's own contribution, to the extent the maintainer holds
  rights in it: the selection and arrangement of talks, the note structure and schema,
  tags, rollups and summaries. It does **not** cover:
  - verbatim quotations from talks (short evidence quotes, each attributed to
    its speaker), which stay with the speakers and are included as quotation
    for commentary;
  - slide content or images of slide pages;
  - talk titles, speaker names and abstracts as published by the conference.
- **Original talks**: copyright stays entirely with their authors. Inclusion
  here is indexing and commentary with linked attribution, not republication.

## Source material

This archive derives from presentation files **publicly posted** on the
osQF / R-in-finance conference websites (osqf.org and its predecessor
domains), 2009–2026.

What this repository and its release assets contain:

- **Derived notes**: LLM-generated structured summaries with *short verbatim
  evidence quotes* (each validated against the source text), speaker
  attribution, and a link back to the original file's public URL.
- **Embeddings and indexes** over that derived text.
- **No original presentation files.** Speaker PDFs and decks are never
  redistributed here; the pipeline downloads them from their public URLs at
  build time only. The same applies to companion research papers: only
  page-level text excerpts and links are indexed, and fetched PDFs stay local.

The hosted chat at osqf.assetflow.ai additionally shows downsampled images of
individual slide pages, so a reader can check an answer against the page it
cites. Those images are served only to access-token holders and are not part
of this repository or its release assets.

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
index entries or page images removed, **open a GitHub issue** on this
repository (or contact the maintainer) with the talk slug. It will be removed
from the repository, the next release asset and the hosted chat. No
justification required.
