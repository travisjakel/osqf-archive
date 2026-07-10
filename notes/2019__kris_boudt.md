---
type: Talk
title: Multivariate GARCH models in R
description: Tutorial on implementing multivariate GARCH models in R for financial return prediction and risk management
timestamp: "2026-07-08T00:00:00Z"
year: 2019
date: ~
speaker: Kris Boudt
speaker_slug: kris_boudt
talk_type: Tutorial
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/KrisBoudt.pdf"
file_local: "./_cache/files/2019/2019__kris_boudt.pdf"
slug: 2019__kris_boudt
status: archived
tags: [osqf, 2019, kris_boudt]
---

# Multivariate GARCH models in R

_2019 · Kris Boudt (Ghent University and VU Brussel/Amsterdam)_

**Headline:** Tutorial on implementing multivariate GARCH models in R for financial return prediction and risk management

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/KrisBoudt.pdf>
- Local: `./_cache/files/2019/2019__kris_boudt.pdf`
- Talk type: Tutorial

## Topics
- multivariate GARCH models
- risk management
- portfolio return prediction
- financial econometrics
- R programming for quantitative finance
- volatility forecasting

## Methods
- EWMA filters
- rolling window estimation
- shrinkage estimators
- structured estimators
- BEKK model
- DCC model
- GO-GARCH factor models
- GAS models
- rmgarch package
- GAS package

## Datasets used
*(none extracted)*

## Code & tools
- `rmgarch`
- `GAS`
- `PerformanceAnalytics`
- `quantmod`
- `highfrequency`
- `M2.ewma`
- `gogarchspec`
- `dccfit`
- `gogarchfilter`

## Key findings
- Multivariate moments (mean, covariance, coskewness, cokurtosis) are critical for portfolio risk management  
  > Once you know the multivariate moments… you also know the portfolio moments
- Rolling window estimation and EWMA filters provide non-parametric approaches to estimate comoments  
  > Use the return in each window to compute an unconditional estimate
- MGARCH models offer structured parametric alternatives to filters for volatility forecasting  
  > MGARCH models versus filters: Is there a difference?
- GO-GARCH models enable portfolio return distribution prediction using 10 Vanguard funds  
  > Illustration on predicting the distribution of the return of an equally-weighted portfolio of 10 Vanguard funds

## Applications
- risk management
- portfolio optimization
- volatility forecasting
- financial econometrics

## References cited
- Ghalanos, Alexios (2019). rmgarch: Multivariate GARCH models. R package version 1.3-6.
- Ardia, David, Kris Boudt, and Leopoldo Catania (2019). “Generalized Autoregressive Score Models in R: The GAS Package.” Journal of Statistical Software 88 (6), 1-28.
- Boudt, Kris, Alexios Ghalanos, Scott Payseur, and Eric Zivot. 2019. “Multivariate GARCH models for large-scale applications: A survey.” In H.D. Vinod and C.R. Rao (Ed.) Handbook of Statistics, Volume 41

## See also
- [`years/2019.md`](../years/2019.md)
- [`speakers/kris_boudt.md`](../speakers/kris_boudt.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=75% (3/4), source=ocr(paddle)*

