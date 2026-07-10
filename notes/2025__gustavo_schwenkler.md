---
type: Talk
title: The Networks Of Firms Implied By The News
description: Extracting firm networks from news articles to address data scarcity in economic networks.
timestamp: "2026-07-08T00:00:00Z"
year: 2025
date: ~
speaker: Gustavo Schwenkler
speaker_slug: gustavo_schwenkler
talk_type: Lightning
time_slot: "10:12 - 10:19"
file_format: pdf
file_url: "https://www.osqf.org/archive/2025/GustavoSchwenkler.pdf"
file_local: "./_cache/files/2025/2025__gustavo_schwenkler.pdf"
slug: 2025__gustavo_schwenkler
status: archived
tags: [osqf, 2025, gustavo_schwenkler]
---

# The Networks Of Firms Implied By The News

_2025 · Gustavo Schwenkler (Santa Clara University / Man Numeric)_

**Headline:** Extracting firm networks from news articles to address data scarcity in economic networks.

## Source
- File format: `pdf`
- URL: <https://www.osqf.org/archive/2025/GustavoSchwenkler.pdf>
- Local: `./_cache/files/2025/2025__gustavo_schwenkler.pdf`
- Talk type: Lightning
- Time slot: 10:12 - 10:19

## Topics
- firm networks
- natural language processing
- network analysis
- financial data extraction

## Methods
- Named Entity Recognition (spaCy in R)
- organization clustering
- CRSP database matching
- co-mention link detection

## Datasets used
- Reuters (2006-10 through 2013-11)
- NYT (1981-01 through 2023-12)

## Code & tools
- `spaCy`
- R

## Key findings
- Identified 40,000 links among 13,500 firms in NYT sample  
  > We identify 40,000 links among 13,500 firms in NYT sample
- Method achieved 96.48% precision and 48.94% recall in firm matching  
  > Precision (TP / (TP + FP ): 96.48% Recall (TP / (TP + FN ): 48.94%
- Network features predict aggregate defaults with statistically significant coefficients  
  > Centrality 0.042 (0.963) Interconnectivity 0.069 Adj. R2

## Applications
- predict aggregate outcomes
- predict returns among peers
- construct credit/supply chain networks

## References cited
- Acemoglu et al. (2012)
- Herskovic (2018)

## See also
- [`years/2025.md`](../years/2025.md)
- [`speakers/gustavo_schwenkler.md`](../speakers/gustavo_schwenkler.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

