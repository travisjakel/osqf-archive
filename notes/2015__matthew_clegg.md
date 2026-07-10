---
type: Talk
title: The partialAR Package for Modeling Time Series with both Permanent and Transient Components
description: "The partialAR package models time series with both permanent and transient components, enabling cointegration analysis in financial data."
timestamp: "2026-07-08T00:00:00Z"
year: 2015
date: ~
speaker: Matthew Clegg
speaker_slug: matthew_clegg
talk_type: Lightning
time_slot: "13:25 - 13:43"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/MatthewClegg.pdf"
file_local: "./_cache/files/2015/2015__matthew_clegg.pdf"
slug: 2015__matthew_clegg
status: archived
tags: [osqf, 2015, matthew_clegg, time_series_modeling]
---

# The partialAR Package for Modeling Time Series with both Permanent and Transient Components

_2015 · Matthew Clegg_

**Headline:** The partialAR package models time series with both permanent and transient components, enabling cointegration analysis in financial data.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/MatthewClegg.pdf>
- Local: `./_cache/files/2015/2015__matthew_clegg.pdf`
- Talk type: Lightning
- Time slot: 13:25 - 13:43

## Topics
- time series modeling
- partially autoregressive processes
- mean reversion
- financial econometrics

## Methods
- Kalman filter estimation
- partialAR model fitting

## Datasets used
- Coca-Cola (KO) and Pepsi (PEP) adjusted prices 2013

## Code & tools
- `quantmod`
- `tseries`
- `egcm`
- `partialAR`
- `fit.par`
- `test.par`

## Key findings
- The model decomposes series into mean-reverting (M) and random walk (R) components  
  > X[t] = M[t] + R[t]
M[t] = 0.6396 M[t-1] + eps_M,t...
- 55.53% of variance in Coca-Cola/Pepsi residuals is mean-reverting  
  > Proportion of variance attributable to mean reversion (pvmr) = 0.5553
- Test rejects random walk null hypothesis at 5.8% significance  
  > Random Walk
-2.83
0.058

## Applications
- cointegration testing
- mean-reverting series analysis

## References cited
- Summers [1986]
- Poterba and Summers [1988]
- Clegg (2015) SSRN:2556957

## See also
- [`years/2015.md`](../years/2015.md)
- [`speakers/matthew_clegg.md`](../speakers/matthew_clegg.md)
- [`topics/time_series_modeling.md`](../topics/time_series_modeling.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

