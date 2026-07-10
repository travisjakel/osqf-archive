---
type: Talk
title: Using R for Regulatory Stress Testing Modeling
description: Using R for regulatory stress testing modeling in banks under DFAST/CCAR requirements
timestamp: "2026-07-08T00:00:00Z"
year: 2017
date: ~
speaker: Thomas Zakrzewski
speaker_slug: thomas_zakrzewski
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/ThomasZakrzewski.pdf"
file_local: "./_cache/files/2017/2017__thomas_zakrzewski.pdf"
slug: 2017__thomas_zakrzewski
status: archived
tags: [osqf, 2017, thomas_zakrzewski]
---

# Using R for Regulatory Stress Testing Modeling

_2017 · Thomas Zakrzewski (S&P Global Market Intelligence Risk Services)_

**Headline:** Using R for regulatory stress testing modeling in banks under DFAST/CCAR requirements

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/ThomasZakrzewski.pdf>
- Local: `./_cache/files/2017/2017__thomas_zakrzewski.pdf`
- Talk type: Lightning

## Topics
- regulatory stress testing
- credit risk modeling
- time series analysis
- R programming for finance
- capital adequacy analysis

## Methods
- exploratory data analysis
- linear regression
- ARIMA modeling
- Ljung-Box test
- variable selection (stepwise/Lasso)
- Kalman Filter forecasting

## Datasets used
- S&P Global Call Report data (31 banks, 1984 observations)
- Federal Reserve macroeconomic data (16 variables, 2001-2016)
- Scenario data (Baseline/Adverse/Severely Adverse, 2016-2019)

## Code & tools
- R (for data analysis and modeling)

## Key findings
- ARIMA outperformed other models by capturing time-series patterns  
  > ARIMA has been chosen to be the champion model: remaining models violated iid principle...
- Ljung-Box tests revealed significant autocorrelation in residuals  
  > p-value for Ljung-box Test result 0.00731...
- Multifamily loan models showed strong predictor relationships  
  > Unemployment rate and BBB Corporate Yield...Default Rate (LR) Prediction

## Applications
- Dodd-Frank Act stress testing (DFAST)
- Comprehensive Capital Analysis and Review (CCAR)

## References cited
*(none extracted)*

## See also
- [`years/2017.md`](../years/2017.md)
- [`speakers/thomas_zakrzewski.md`](../speakers/thomas_zakrzewski.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3), source=ocr(paddle)*

