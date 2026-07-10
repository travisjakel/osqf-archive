---
type: Talk
title: Exploring Higher Order Risk Premia Using High Frequency Data
description: "Analyzing higher-order risk premia using high-frequency data and R packages for volatility, liquidity, and Hurst exponent estimation."
timestamp: "2026-07-08T00:00:00Z"
year: 2016
date: ~
speaker: Jerzy Pawlowski
speaker_slug: jerzy_pawlowski
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/JerzyPawlowski.pdf"
file_local: "./_cache/files/2016/2016__jerzy_pawlowski.pdf"
slug: 2016__jerzy_pawlowski
status: archived
tags: [osqf, 2016, jerzy_pawlowski, risk_premia, garman_klass_volatility_estimator]
---

# Exploring Higher Order Risk Premia Using High Frequency Data

_2016 · Jerzy Pawlowski (NYU Tandon School of Engineering)_

**Headline:** Analyzing higher-order risk premia using high-frequency data and R packages for volatility, liquidity, and Hurst exponent estimation.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/JerzyPawlowski.pdf>
- Local: `./_cache/files/2016/2016__jerzy_pawlowski.pdf`
- Talk type: Lightning

## Topics
- risk premia
- high-frequency data
- volatility estimation
- market liquidity
- Hurst exponent
- investor utility

## Methods
- Garman-Klass volatility estimator
- Rogers-Satchell estimator
- Hurst exponent calculation
- OHLC data aggregation

## Datasets used
- TAQ
- OHLC

## Code & tools
- `HighFreq`
- `TTR`
- `quantmod`
- `xts`
- `lubridate`
- `caTools`
- `PerformanceAnalytics`
- github.com/algoquant/HighFreq

## Key findings
- Investor preferences depend on higher moments (skew, kurtosis) of returns.  
  > Investor preference for higher returns and for lower volatility is expressed by maximizing the Sharpe ratio,
- HighFreq package enables TAQ data scrubbing and OHLC aggregation.  
  > The function scrub_agg() scrubs a single day of TAQ data, aggregates it, and converts it to OHLC format,
- Volatility estimators like Garman-Klass and Rogers-Satchell improve OHLC analysis.  
  > volatility() includes the Garman-Klass estimator: σ² = (0.5(Hi−Li)² −(2 log 2−1)(Ci−Oi)²)/n
- Market illiquidity is proportional to volatility divided by sqrt(trading volume).  
  > Market illiquidity is proportional to the price volatility divided by the square root of the trading volume:
- Hurst exponent measures long-term memory in OHLC data.  
  > The Hurst exponent is a measure of long-term memory of a time series, and is related to its autocorrelation:

## Applications
- volatility forecasting
- liquidity measurement
- risk premia analysis

## References cited
- Eugene Fama and Kenneth French, Dissecting Anomalies
- Asness et al., Fact, Fiction and Momentum Investing
- Amaya et al., Does Realized Skewness Predict the Cross-Section of Equity Returns?
- Donier et al., Why Do Markets Crash? Bitcoin Data Offers Unprecedented Insights

## See also
- [`years/2016.md`](../years/2016.md)
- [`speakers/jerzy_pawlowski.md`](../speakers/jerzy_pawlowski.md)
- [`topics/risk_premia.md`](../topics/risk_premia.md)
- [`methods/garman_klass_volatility_estimator.md`](../methods/garman_klass_volatility_estimator.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=40% (2/5)*

