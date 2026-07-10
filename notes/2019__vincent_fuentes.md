---
type: Talk
title: "Large scale portfolio optimization: which sigma works?"
description: "Evaluating covariance matrix estimators (Sigma) for large-scale portfolio optimization, focusing on computational feasibility and performance."
timestamp: "2026-07-08T00:00:00Z"
year: 2019
date: ~
speaker: Vincent Fuentes
speaker_slug: vincent_fuentes
talk_type: Lightning
time_slot: "15:32 - 15:38"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/VincentFuentes.pdf"
file_local: "./_cache/files/2019/2019__vincent_fuentes.pdf"
slug: 2019__vincent_fuentes
status: archived
tags: [osqf, 2019, vincent_fuentes, portfolio_optimization]
---

# Large scale portfolio optimization: which sigma works?

_2019 · Vincent Fuentes (Charles Schwab & Co., Inc.)_

**Headline:** Evaluating covariance matrix estimators (Sigma) for large-scale portfolio optimization, focusing on computational feasibility and performance.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/VincentFuentes.pdf>
- Local: `./_cache/files/2019/2019__vincent_fuentes.pdf`
- Talk type: Lightning
- Time slot: 15:32 - 15:38

## Topics
- portfolio optimization
- covariance matrix estimation
- risk management
- computational efficiency in finance

## Methods
- MRCD
- Shrinkage (Ledoit-Wolf)
- EWMA
- DCC-GARCH
- Sample covariance

## Datasets used
- S&P100 (Jan 1996-Mar 2019)
- R2000 (same back-testing characteristics)

## Code & tools
- `quadProg`
- `rrcov`
- `rmgarch`
- R

## Key findings
- When days > securities, all Sigma estimators work but DCC-GARCH is computationally intensive.  
  > When days > securities, all Sigma estimators work... with the exception of DCC-GARCH
- MRCD and Shrinkage outperform others in securities >> days scenarios.  
  > When securities >> days, only MRCD and Shrinkage work
- MRCD achieves higher Sharpe ratios in large-cap portfolios.  
  > MRCD: 0.74 Sharpe vs. SHRK: 0.71 in S&P100
- Shrinkage shows better performance in small-cap long-only constraints.  
  > SHRK_EXP2: 0.77 Sharpe vs. MRCD_EXP2: 0.81 in small-cap

## Applications
- portfolio optimization
- risk management
- computational efficiency in finance

## References cited
- Kris Boudt (R in Finance 2018): Minimum Regularized Covariance Determinant Estimator

## See also
- [`years/2019.md`](../years/2019.md)
- [`speakers/vincent_fuentes.md`](../speakers/vincent_fuentes.md)
- [`topics/portfolio_optimization.md`](../topics/portfolio_optimization.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=25% (1/4)*

