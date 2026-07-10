---
type: Talk
title: Portfolio Allocation with Cluster Risk Parity
description: Cluster Risk Parity (CRP) is a heuristic portfolio allocation method using dynamic clustering and risk parity to maximize diversification.
timestamp: "2026-07-08T00:00:00Z"
year: 2013
date: ~
speaker: Michael Kapler
speaker_slug: michael_kapler
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/MichaelKapler.pdf"
file_local: "./_cache/files/2013/2013__michael_kapler.pdf"
slug: 2013__michael_kapler
status: archived
tags: [osqf, 2013, michael_kapler]
---

# Portfolio Allocation with Cluster Risk Parity

_2013 · Michael Kapler_

**Headline:** Cluster Risk Parity (CRP) is a heuristic portfolio allocation method using dynamic clustering and risk parity to maximize diversification.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/MichaelKapler.pdf>
- Local: `./_cache/files/2013/2013__michael_kapler.pdf`
- Talk type: Lightning

## Topics
- portfolio allocation
- risk parity
- clustering methods
- backtesting
- diversification
- asset allocation

## Methods
- Hierarchical clustering
- K-Means clustering
- Risk Parity
- Equal Risk Contribution (ERC)

## Datasets used
- 10 Major Asset Classes (ETFs) Nov 2005-May 2013
- DOW 30 Stocks Dec 1995 - May 2013

## Code & tools
- R

## Key findings
- CRP combines dynamic clustering with risk parity to normalize risk across asset groups.  
  > Cluster Risk Parity ( CRP ) Heuristic portfolio allocation method that uses Dynamic Clustering to discover market macrostructure Risk Parity to normalize risk within and across clusters
- CRP construction involves three steps: clustering assets, creating risk parity portfolios within clusters, and distributing weights across clusters.  
  > Steps to construct CRP portfolio 1. Create groups (clusters) of assets 2. Create risk parity portfolios within each group 3. Distribute weights across clusters using risk parity
- CRP variants showed higher Sharpe ratios compared to traditional methods in backtests.  
  > Dynamic Clustering with Risk Parity - ERC 8.18 1.08

## Applications
- portfolio allocation
- backtesting

## References cited
*(none extracted)*

## See also
- [`years/2013.md`](../years/2013.md)
- [`speakers/michael_kapler.md`](../speakers/michael_kapler.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

