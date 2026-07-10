---
type: Talk
title: Bayesian Estimation of Stock Market Value at Risk Using Vine-Copula models
description: Bayesian Estimation of Stock Market Value at Risk Using Vine-Copula models to analyze multivariate dependencies in portfolio risk management
timestamp: "2026-07-08T00:00:00Z"
year: 2018
date: ~
speaker: Wilmer Pineda
speaker_slug: wilmer_pineda
talk_type: Lightning
time_slot: "13:35 - 13:59"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/WilmerPineda.pdf"
file_local: "./_cache/files/2018/2018__wilmer_pineda.pdf"
slug: 2018__wilmer_pineda
status: archived
tags: [osqf, 2018, wilmer_pineda, value_at_risk_var_estimation]
---

# Bayesian Estimation of Stock Market Value at Risk Using Vine-Copula models

_2018 · Wilmer Pineda_

**Headline:** Bayesian Estimation of Stock Market Value at Risk Using Vine-Copula models to analyze multivariate dependencies in portfolio risk management

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/WilmerPineda.pdf>
- Local: `./_cache/files/2018/2018__wilmer_pineda.pdf`
- Talk type: Lightning
- Time slot: 13:35 - 13:59

## Topics
- Value at Risk (VaR) estimation
- Bayesian inference
- Vine Copula models
- Portfolio risk management

## Methods
- ARFIMA-GARCH models
- Bayesian Estimation with Rjags
- Vine Copula structure (D-vine)
- Monte Carlo integration with importance sampling

## Datasets used
- Returns data for Bancolombia, Grupo Sura, Ecopetrol (June 10th, 2015 - 2017)

## Code & tools
- `Rugarch`
- `Rjags`
- `VineCopula`
- R

## Key findings
- VaR calculated at 90%, 95%, 99% confidence levels with equal weights for returns  
  > Value at risk is calculated at 90%, 95% and 99% confidence level with equal weights for the returns.
- Bayesian parameter estimation achieved 68-71% acceptance rates for copula parameters  
  > Acceptation rate 0.6867687... Correlation coefficient: -0.22841
- Backtesting validated VaR estimates using ARFIMA-GARCH model from Rugarch package  
  > We backtested the method at 90%, 95% and 99% confidence level as follows:

## Applications
- Risk management
- Investment decision-making

## References cited
- Albert, J. (2009). Bayesian computation with R
- Brechmann E & Schepsmeier U. (2013). Modeling Dependence with C- and D-Vine Copulas
- Czado, C. (2013). Vine copulas and their applications to financial data

## See also
- [`years/2018.md`](../years/2018.md)
- [`speakers/wilmer_pineda.md`](../speakers/wilmer_pineda.md)
- [`topics/value_at_risk_var_estimation.md`](../topics/value_at_risk_var_estimation.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

