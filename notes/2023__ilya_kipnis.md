---
type: Talk
title: Ex Ante vs. Ex Post Tracking Error
description: The talk compares ex-ante and ex-post tracking error estimation in direct indexing portfolios with ESG constraints.
timestamp: "2026-07-08T00:00:00Z"
year: 2023
date: ~
speaker: Ilya Kipnis
speaker_slug: ilya_kipnis
talk_type: Lightning
time_slot: "14:05 - 14:12"
file_format: pptx
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2023/IlyaKipnis.pptx"
file_local: "./_cache/files/2023/2023__ilya_kipnis.pptx"
slug: 2023__ilya_kipnis
status: archived
tags: [osqf, 2023, ilya_kipnis]
---

# Ex Ante vs. Ex Post Tracking Error

_2023 · Ilya Kipnis_

**Headline:** The talk compares ex-ante and ex-post tracking error estimation in direct indexing portfolios with ESG constraints.

## Source
- File format: `pptx`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2023/IlyaKipnis.pptx>
- Local: `./_cache/files/2023/2023__ilya_kipnis.pptx`
- Talk type: Lightning
- Time slot: 14:05 - 14:12

## Topics
- tracking error
- direct indexing
- portfolio optimization
- PCA
- covariance matrix estimation

## Methods
- PCA for dimensionality reduction
- ex-ante tracking error estimation
- constrained optimization

## Datasets used
*(none extracted)*

## Code & tools
- R
- `prcomp`

## Key findings
- Ex-post tracking error is calculated as sample s.d. between strategy and benchmark  
  > Tracking error is defined ex-post as the sample s.d. between the strategy and the benchmark
- Ex-ante estimation uses active weights and covariance matrix  
  > Can estimate tracking error ex-ante. (w_s - w_b)'S(w_s - w_b)
- PCA reduces dimensionality for covariance matrix estimation  
  > Using PCA on a subset of sample returns (E.G. 6 months), choose a number of PCAs that explains a cumulative amount of the variance
- RMSE between ex-ante and ex-post tracking error was 0.006878  
  > rmse 0.0068784173

## Applications
- portfolio optimization
- ESG investing
- tax-efficient investing

## References cited
*(none extracted)*

## See also
- [`years/2023.md`](../years/2023.md)
- [`speakers/ilya_kipnis.md`](../speakers/ilya_kipnis.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=75% (3/4), source=ocr(paddle)*

