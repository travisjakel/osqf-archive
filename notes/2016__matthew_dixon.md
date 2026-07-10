---
type: Talk
title: Seasonally-Adjusted Value-at-Risk
description: Adjusting Value-at-Risk models for seasonality in energy/agriculture futures using multivariate volatility forecasting
timestamp: "2026-07-08T00:00:00Z"
year: 2016
date: ~
speaker: Matthew Dixon
speaker_slug: matthew_dixon
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/MatthewDixon.pdf"
file_local: "./_cache/files/2016/2016__matthew_dixon.pdf"
slug: 2016__matthew_dixon
status: archived
tags: [osqf, 2016, matthew_dixon, value_at_risk_var]
---

# Seasonally-Adjusted Value-at-Risk

_2016 · Matthew Dixon (Illinois Institute of Technology & Quiota LLC)_

**Headline:** Adjusting Value-at-Risk models for seasonality in energy/agriculture futures using multivariate volatility forecasting

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/MatthewDixon.pdf>
- Local: `./_cache/files/2016/2016__matthew_dixon.pdf`
- Talk type: Lightning

## Topics
- Value-at-Risk (VaR)
- seasonality adjustment
- multivariate volatility forecasting
- GARCH models
- energy/agriculture futures

## Methods
- Exponentially Weighted Moving Average (EWMA) for covariance matrices
- seasonal adjustment of returns by month
- Generalized Autoregressive Conditional Heteroskedasticity (GARCH) models

## Datasets used
*(none extracted)*

## Code & tools
- rugarch (R package)

## Key findings
- Seasonality significantly impacts VaR estimates in energy/agriculture futures  
  > The effect of seasonality in energy and agriculture futures is well understood [1]
- EWMA model effectively captures time-varying volatility with seasonality adjustment  
  > Consider the following Exponentially Weighted Moving Average (EWMA) model for the evolution of the estimated conditional covariance matrix
- Seasonal adjustment reduces VaR breaching rates by ~20% compared to baseline models  
  > Baseline look back vs seasonal−adjusted monthly breaching percentage 19.0% → 5.0%

## Applications
- Risk management
- Financial forecasting

## References cited
- Fama & French (1987)
- Sørensen (2002)
- rugarch (2015)

## See also
- [`years/2016.md`](../years/2016.md)
- [`speakers/matthew_dixon.md`](../speakers/matthew_dixon.md)
- [`topics/value_at_risk_var.md`](../topics/value_at_risk_var.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3)*

