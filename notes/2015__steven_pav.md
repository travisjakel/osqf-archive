---
type: Talk
title: Portfolio Cramer-Rao Bounds (why bad things happen to good quants)
description: "The talk explains how the Cramer-Rao bound limits portfolio performance, highlighting issues like overfitting and the impact of diversification."
timestamp: "2026-07-08T00:00:00Z"
year: 2015
date: ~
speaker: Steven Pav
speaker_slug: steven_pav
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/StevenPav.pdf"
file_local: "./_cache/files/2015/2015__steven_pav.pdf"
slug: 2015__steven_pav
status: archived
tags: [osqf, 2015, steven_pav, portfolio_optimization]
---

# Portfolio Cramer-Rao Bounds (why bad things happen to good quants)

_2015 · Steven Pav (Cerebellum Capital)_

**Headline:** The talk explains how the Cramer-Rao bound limits portfolio performance, highlighting issues like overfitting and the impact of diversification.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/StevenPav.pdf>
- Local: `./_cache/files/2015/2015__steven_pav.pdf`
- Talk type: Lightning

## Topics
- portfolio optimization
- Cramer-Rao bounds
- overfitting
- diversification
- statistical limits in finance

## Methods
- Cramer-Rao bound application
- Sharpe ratio calculation
- KRS estimator

## Datasets used
*(none extracted)*

## Code & tools
- `shiny`
- `SharpeR`
- github.com/shabbychef/rfin2015

## Key findings
- A fundamental bound limits expected Sharpe ratio based on historical data and number of assets.  
  > EX [q (ν̂ (X))] ≤ effect size / (# knobs + effect size) with effect size = # years × (maximal Sharpe ratio)²
- Increasing number of assets can decrease expected Sharpe ratio if maximal Sharpe doesn't grow fast enough.  
  > for 10 stocks, the bound is 0.7; for 160 stocks, the bound is 0.21
- 1/n allocation is ineffective for long/short portfolios.  
  > The 1/n allocation is utterly useless in some situations, e.g., a long/short portfolio

## Applications
- portfolio optimization
- risk management

## References cited
- http://arxiv.org/abs/1409.5936
- SharpeR package

## See also
- [`years/2015.md`](../years/2015.md)
- [`speakers/steven_pav.md`](../speakers/steven_pav.md)
- [`topics/portfolio_optimization.md`](../topics/portfolio_optimization.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3)*

