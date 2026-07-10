---
type: Talk
title: Bunched Random Forest in Monte Carlo Risk Simulation
description: Applying bunched random forest to Monte Carlo simulations for energy market risk modeling
timestamp: "2026-07-08T00:00:00Z"
year: 2017
date: ~
speaker: Eina Ooka
speaker_slug: eina_ooka
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/EinaOoka.pdf"
file_local: "./_cache/files/2017/2017__eina_ooka.pdf"
slug: 2017__eina_ooka
status: archived
tags: [osqf, 2017, eina_ooka]
---

# Bunched Random Forest in Monte Carlo Risk Simulation

_2017 · Eina Ooka (The Energy Authority)_

**Headline:** Applying bunched random forest to Monte Carlo simulations for energy market risk modeling

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/EinaOoka.pdf>
- Local: `./_cache/files/2017/2017__eina_ooka.pdf`
- Talk type: Lightning

## Topics
- Monte Carlo risk simulation
- random forest aggregation
- energy market modeling
- stochastic forecasting

## Methods
- Bunched Random Forest
- Heston model
- ARIMA
- Pinball-loss scoring

## Datasets used
*(none extracted)*

## Code & tools
- randomForest::predict.randomForest()

## Key findings
- Traditional random forests produce unstable volatility in MC simulations  
  > Aggregation of a few hundred trees moderate values too much  Low volatility
- Bunched RF achieves stable volatility while maintaining predictability  
  > Aggregating a selected number of trees for each Monte Carlo iteration
- Method successfully replicates power price time series characteristics  
  > Need to achieve all time series characteristics. o Volatility, seasonality, moments, …

## Applications
- mid-term portfolio management
- energy market risk simulation
- natural gas dispatch optimization

## References cited
*(none extracted)*

## See also
- [`years/2017.md`](../years/2017.md)
- [`speakers/eina_ooka.md`](../speakers/eina_ooka.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3)*

