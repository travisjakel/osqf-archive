---
type: Talk
title: Generalized Autoregressive Score Models in RThe GAS Package
description: Introduces the GAS R package for volatility modeling and Value-at-Risk prediction using Generalized Autoregressive Score models.
timestamp: "2026-07-08T00:00:00Z"
year: 2017
date: ~
speaker: Leopoldo Catania
speaker_slug: leopoldo_catania
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/LeopoldoCatania.pdf"
file_local: "./_cache/files/2017/2017__leopoldo_catania.pdf"
slug: 2017__leopoldo_catania
status: archived
tags: [osqf, 2017, leopoldo_catania, volatility_modeling, gas_models]
---

# Generalized Autoregressive Score Models in RThe GAS Package

_2017 · Leopoldo Catania (University of Rome, Tor Vergata)_

**Headline:** Introduces the GAS R package for volatility modeling and Value-at-Risk prediction using Generalized Autoregressive Score models.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/LeopoldoCatania.pdf>
- Local: `./_cache/files/2017/2017__leopoldo_catania.pdf`
- Talk type: Lightning

## Topics
- volatility modeling
- GAS models
- risk management
- R package development

## Methods
- GAS models
- Maximum Likelihood estimation
- GARCH comparison

## Datasets used
- General Electric (GE) returns
- Apple returns

## Code & tools
- R
- GAS package
- C++
- `CRAN`
- `GitHub`

## Key findings
- GAS models outperform GARCH in VaR prediction for GE at 1% confidence level  
  > Figure: One–step ahead VaR forecasts for General Electric (GE) at the α = 1% confidence level for the GAS–N (solid) and GAS–ST (dotted) models.
- GAS models with Student's t distribution show different volatility reactions compared to GARCH  
  > A GAS model with Student’s t distribution with ν degrees of freedom would imply: (ν + 1)yt2 / [(ν − 2)σt2 + yt2] − 1
- GAS models are applicable beyond finance (e.g., electricity prices)  
  > Figure: GAS estimated volatility for Nordpool electricity prices. Gaussian GAS is equivalent to Gaussian GARCH.

## Applications
- risk management
- VaR prediction
- volatility forecasting

## References cited
- Ardia et al. (2016)
- Ardia et al. (2017)
- Creal et al. (2013)
- Harvey (2013)

## See also
- [`years/2017.md`](../years/2017.md)
- [`speakers/leopoldo_catania.md`](../speakers/leopoldo_catania.md)
- [`topics/volatility_modeling.md`](../topics/volatility_modeling.md)
- [`methods/gas_models.md`](../methods/gas_models.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3)*

