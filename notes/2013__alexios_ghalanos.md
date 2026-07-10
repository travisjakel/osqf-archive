---
type: Talk
title: Time Varying Higher Moments and the Cost of GARCH
description: The talk discusses time-varying higher moments in financial data and evaluates the cost of using GARCH models through simulation studies and empirical analysis on the Dow 10 dataset.
timestamp: "2026-07-08T00:00:00Z"
year: 2013
date: ~
speaker: Alexios Ghalanos
speaker_slug: alexios_ghalanos
talk_type: Talk
time_slot: "15:45 - 16:05"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/AlexiosGhalanos.pdf"
file_local: "./_cache/files/2013/2013__alexios_ghalanos.pdf"
slug: 2013__alexios_ghalanos
status: archived
tags: [osqf, 2013, alexios_ghalanos]
---

# Time Varying Higher Moments and the Cost of GARCH

_2013 · Alexios Ghalanos_

**Headline:** The talk discusses time-varying higher moments in financial data and evaluates the cost of using GARCH models through simulation studies and empirical analysis on the Dow 10 dataset.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/AlexiosGhalanos.pdf>
- Local: `./_cache/files/2013/2013__alexios_ghalanos.pdf`
- Talk type: Talk
- Time slot: 15:45 - 16:05

## Topics
- time-varying higher moments
- GARCH model limitations
- ACD model
- risk modeling
- volatility forecasting
- statistical testing

## Methods
- Hong and Li non-parametric density test
- BDS test for iid
- VaR and Expected Shortfall tests
- Autoregressive Conditional Density (ACD) model
- GARCH-NIG model
- likelihood ratio tests

## Datasets used
- Yahoo finance
- Dow 10 Dataset (1984-2013)

## Code & tools
- `rugarch`
- `tseries`
- R

## Key findings
- GARCH models with constant higher moments are rejected in 9/10 Dow stocks via likelihood ratio tests (p<0.10).  
  > Tested at the 10% level of significance, the GARCH model is rejected in 9 of the 10 securities tested.
- ACD models outperform GARCH in VaR forecasting for most Dow stocks under 1% and 5% VaR loss functions.  
  > The Table presents p-values from the MCS test... for the 10 Dow constituents under alternative ACD and GARCH dynamics.
- Simulation studies show GARCH-NIG models with time-varying skewness and kurtosis reject the null hypothesis 50-87% of the time under misspecification.  
  > DGP: GARCH(1,1)-NIG(ρt ,ζt )... %Rejections... 50                   87                  85

## Applications
- risk management
- portfolio optimization
- VaR forecasting

## References cited
- Hansen [1982]
- Engle [1982]
- Bollerslev [1986]
- Hong and Li [2005]
- Brock and Dechert [1988]
- Kupiec [1995]
- McNeil and Frey [2000]
- Hansen et al. [2003]
- Jondeau and Rockinger [2003]
- Wilhelmsson [2009]

## See also
- [`years/2013.md`](../years/2013.md)
- [`speakers/alexios_ghalanos.md`](../speakers/alexios_ghalanos.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3), source=ocr(paddle)*

