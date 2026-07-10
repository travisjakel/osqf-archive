---
type: Talk
title: "Are High Frequency Traders Prudent and Temperate?"
description: Analyzes high-frequency trading behavior through statistical measures of prudence (skewness preference) and temperance (kurtosis aversion) using R packages.
timestamp: "2026-07-08T00:00:00Z"
year: 2015
date: ~
speaker: Jerzy Pawlowksi
speaker_slug: jerzy_pawlowksi
talk_type: Lightning
time_slot: "16:40 - 16:58"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/JerzyPawlowski.pdf"
file_local: "./_cache/files/2015/2015__jerzy_pawlowksi.pdf"
slug: 2015__jerzy_pawlowksi
status: archived
tags: [osqf, 2015, jerzy_pawlowksi, high_frequency_trading, garman_klass_volatility_estimator]
---

# Are High Frequency Traders Prudent and Temperate?

_2015 · Jerzy Pawlowksi (NYU Polytechnic School of Engineering)_

**Headline:** Analyzes high-frequency trading behavior through statistical measures of prudence (skewness preference) and temperance (kurtosis aversion) using R packages.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/JerzyPawlowski.pdf>
- Local: `./_cache/files/2015/2015__jerzy_pawlowksi.pdf`
- Talk type: Lightning
- Time slot: 16:40 - 16:58

## Topics
- high-frequency trading
- volatility estimation
- skewness/kurtosis analysis
- trading strategies

## Methods
- Garman-Klass volatility estimator
- Rogers-Satchell volatility estimator
- custom skewness calculation from OHLC data
- contrarian trading strategy

## Datasets used
- TAQ data
- OHLC data

## Code & tools
- `HighFreq`
- `TTR`
- `PerformanceAnalytics`
- `xts`
- `quantmod`
- `lubridate`
- `caTools`

## Key findings
- SPY returns showed negative skewness (-0.377) and high kurtosis (7.448)  
  > [1] -0.3773046
[1] 7.448475
- Daily contrarian strategy showed 14.3% correlation between skew oscillator and returns  
  > sample estimates:
      cor
0.1428891
- Intraday strategy using skew threshold generated cumulative PnL chart  
  > cumu_pnl <- cumsum(po_sition[, 2]*re_turns[, 1])

## Applications
- contrarian trading strategies based on skewness
- volatility forecasting

## References cited
- Amaya et al., Does Realized Skewness Predict the Cross-Section of Equity Returns? (SSRN abstract id=1898735)

## See also
- [`years/2015.md`](../years/2015.md)
- [`speakers/jerzy_pawlowksi.md`](../speakers/jerzy_pawlowksi.md)
- [`topics/high_frequency_trading.md`](../topics/high_frequency_trading.md)
- [`methods/garman_klass_volatility_estimator.md`](../methods/garman_klass_volatility_estimator.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3)*

