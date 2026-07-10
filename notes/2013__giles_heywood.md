---
type: Talk
title: Covariance forecasting for portfolio optimisation
description: "The talk discusses methods for covariance forecasting to improve portfolio optimization, using PCA, APT, and Bayesian shrinkage techniques."
timestamp: "2026-07-08T00:00:00Z"
year: 2013
date: ~
speaker: Giles Heywood
speaker_slug: giles_heywood
talk_type: Talk
time_slot: "14:10 - 14:30"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/GilesHeywood.pdf"
file_local: "./_cache/files/2013/2013__giles_heywood.pdf"
slug: 2013__giles_heywood
status: archived
tags: [osqf, 2013, giles_heywood, principal_components_analysis_pca]
---

# Covariance forecasting for portfolio optimisation

_2013 · Giles Heywood_

**Headline:** The talk discusses methods for covariance forecasting to improve portfolio optimization, using PCA, APT, and Bayesian shrinkage techniques.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/GilesHeywood.pdf>
- Local: `./_cache/files/2013/2013__giles_heywood.pdf`
- Talk type: Talk
- Time slot: 14:10 - 14:30

## Topics
- covariance forecasting
- portfolio optimisation
- principal component analysis (PCA)
- arbitrage pricing theory (APT)
- Bayesian shrinkage
- backtesting

## Methods
- Principal Components Analysis (PCA)
- Arbitrage Pricing Theory (APT)
- Bayesian shrinkage
- quadprog constrained optimisation

## Datasets used
*(none extracted)*

## Code & tools
- `aa`
- `BurStFin`
- `quadprog`
- R

## Key findings
- PCA enables dimension reduction for APT by summarizing covariance with principal components.  
  > PCA as 'dimension reduction' • eigenvalues are descending in magnitude • covariance can be summarised with the first k
- Bayesian shrinkage reduces volatility underestimation in covariance forecasts.  
  > Underestimate of volatility is reduced
- Proxy baskets track target stocks with minimum variance for hedging and alpha generation.  
  > Tracks the target stock with minimum variance
- Market-neutral tilt portfolios achieve factor neutrality using quadprog optimisation.  
  > Factor-1 neutral within sector/region • Factor 2:k neutral

## Applications
- forecast-free portfolio construction
- market-neutral tilt portfolio

## References cited
*(none extracted)*

## See also
- [`years/2013.md`](../years/2013.md)
- [`speakers/giles_heywood.md`](../speakers/giles_heywood.md)
- [`methods/principal_components_analysis_pca.md`](../methods/principal_components_analysis_pca.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=75% (3/4), source=ocr(paddle)*

