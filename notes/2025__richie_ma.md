---
type: Talk
title: "cme.mdp: Analyzing CME Market Data in R"
description: Introducing the cme.mdp R package for cleaning and analyzing Chicago Mercantile Exchange market data under the FIX protocol.
timestamp: "2026-07-08T00:00:00Z"
year: 2025
date: ~
speaker: Richie Ma
speaker_slug: richie_ma
talk_type: Lightning
time_slot: "14:52 - 14:59"
file_format: pdf
file_url: "https://www.osqf.org/archive/2025/RichieMa.pdf"
file_local: "./_cache/files/2025/2025__richie_ma.pdf"
slug: 2025__richie_ma
status: archived
tags: [osqf, 2025, richie_ma, r_package_development]
---

# cme.mdp: Analyzing CME Market Data in R

_2025 · Richie Ma (University of Illinois at Urbana-Champaign)_

**Headline:** Introducing the cme.mdp R package for cleaning and analyzing Chicago Mercantile Exchange market data under the FIX protocol.

## Source
- File format: `pdf`
- URL: <https://www.osqf.org/archive/2025/RichieMa.pdf>
- Local: `./_cache/files/2025/2025__richie_ma.pdf`
- Talk type: Lightning
- Time slot: 14:52 - 14:59

## Topics
- R package development
- market data analysis
- FIX protocol
- data cleaning

## Methods
- data.table package for data processing
- trade_summary function
- mbo_match_details function
- order_book reconstruction

## Datasets used
- R:/xcec_md_gc_fut_20200102-r-00390.gz
- R:/xcec_md_gc_fut.gz
- R:/xcme_md_es_fut.gz

## Code & tools
- `devtools`
- `data.table`
- `cme.mdp`

## Key findings
- The cme.mdp package focuses on cleaning CME market data under the FIX protocol.  
  > R  cme.mdp package focuses on how to clean and analyze the CME market data under the FIX protocol.
- The package handles both Market by Price (MBP) and Market by Order (MBO) data formats.  
  > Market by Price (MBP) and Market by Order (MBO)
- Data processing relies on the data.table package for efficiency.  
  > All data-related process is done by data.table package.
- The order_book() function reconstructs consolidated limit order books with user-defined depth levels.  
  > order_book() function provides an integrated method to reconstruct... consolidated limit order books easily.

## Applications
- academic research
- industry market data analysis

## References cited
*(none extracted)*

## See also
- [`years/2025.md`](../years/2025.md)
- [`speakers/richie_ma.md`](../speakers/richie_ma.md)
- [`topics/r_package_development.md`](../topics/r_package_development.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (4/4), source=ocr(paddle)*

