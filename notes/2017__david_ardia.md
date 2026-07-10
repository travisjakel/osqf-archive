---
type: Talk
title: Markov-Switching GARCH Models in RThe MSGARCH Package
description: "Empirical study shows Markov-Switching GARCH (MSGARCH) models outperform single-regime GARCH models in risk forecasting, especially for stocks, using MCMC estimation."
timestamp: "2026-07-08T00:00:00Z"
year: 2017
date: ~
speaker: David Ardia
speaker_slug: david_ardia
talk_type: Talk
time_slot: "14:15 - 14:35"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/DavidArdia.pdf"
file_local: "./_cache/files/2017/2017__david_ardia.pdf"
slug: 2017__david_ardia
status: archived
tags: [osqf, 2017, david_ardia, volatility_modeling]
---

# Markov-Switching GARCH Models in RThe MSGARCH Package

_2017 · David Ardia_

**Headline:** Empirical study shows Markov-Switching GARCH (MSGARCH) models outperform single-regime GARCH models in risk forecasting, especially for stocks, using MCMC estimation.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/DavidArdia.pdf>
- Local: `./_cache/files/2017/2017__david_ardia.pdf`
- Talk type: Talk
- Time slot: 14:15 - 14:35

## Topics
- volatility modeling
- GARCH models
- Markov-switching models
- risk forecasting
- Bayesian estimation

## Methods
- MSGARCH models
- GARCH models
- GJR models
- Value-at-Risk (VaR) tests
- Diebold-Mariano (DM) statistics
- MCMC estimation
- Maximum Likelihood (ML) estimation

## Datasets used
- S&P 500 stocks
- major stock indices
- currencies

## Code & tools
- MSGARCH R package

## Key findings
- MSGARCH models significantly outperform single-regime GARCH models in VaR tests for stocks (e.g., 1% VaR: GJR skS MS: 0.50 vs SR: 2.50).  
  > GJR skS
0.50
0.25
0.25
2.50
- MCMC estimation significantly improves forecasting performance over ML for MSGARCH models.  
  > Star indicates significant outperformance between MCMC and ML.
- Skewness and Student's t-distribution improve MSGARCH performance compared to normal distributions.  
  > - MSGARCH with a (skew) Student is required.
- MSGARCH with skew-normal distribution fails to capture excess kurtosis in stock returns.  
  > - MSGARCH with a (skew) Normal distribution is not able to jointly account for the switch in the parameters as well as for the excess of kurtosis exhibited from the data.

## Applications
- risk management
- VaR forecasting
- tail risk prediction

## References cited
- Ardia, D., 2008. Financial Risk Management with Bayesian Estimation of GARCH Models...
- Bauwens, L., Preminger, A., Rombouts, J.V.K., 2010. Theory and inference for a Markov switching GARCH model...
- Engle, R.F., Manganelli, S., 2004. CAViaR: Conditional autoregressive Value at Risk by regression quantiles...

## See also
- [`years/2017.md`](../years/2017.md)
- [`speakers/david_ardia.md`](../speakers/david_ardia.md)
- [`topics/volatility_modeling.md`](../topics/volatility_modeling.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=75% (3/4), source=ocr(paddle)*

