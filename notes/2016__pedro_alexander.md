---
type: Talk
title: Portfolio Selection with Support Vector Regression
description: Using Support Vector Regression (SVR) with kernel selection to optimize stock portfolio returns while managing risk.
timestamp: "2026-07-08T00:00:00Z"
year: 2016
date: ~
speaker: Pedro Alexander
speaker_slug: pedro_alexander
talk_type: Lightning
time_slot: ~
file_format: ppt
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/PedroAlexander.ppt"
file_local: "./_cache/files/2016/2016__pedro_alexander.ppt"
slug: 2016__pedro_alexander
status: archived
tags: [osqf, 2016, pedro_alexander, portfolio_optimization]
---

# Portfolio Selection with Support Vector Regression

_2016 · Pedro Alexander (University of Brasília, Brazil)_

**Headline:** Using Support Vector Regression (SVR) with kernel selection to optimize stock portfolio returns while managing risk.

## Source
- File format: `ppt`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/PedroAlexander.ppt>
- Local: `./_cache/files/2016/2016__pedro_alexander.ppt`
- Talk type: Lightning

## Topics
- portfolio optimization
- machine learning in finance
- support vector machines
- risk management
- feature selection

## Methods
- Support Vector Regression (SVR)
- kernel selection (Gaussian, Cauchy, Exponential, etc.)
- cross-validation
- feature reduction (127→24 features)
- LIBSVM library

## Datasets used
- S&P 100 (06/30/2014)
- Fundamental data (06/29/1990–06/30/2014)

## Code & tools
- `LIBSVM`
- `Kernlab`
- `Robustbase`
- `PerformanceAnalytics`
- `Ggplot2`
- `Dplyr`
- `Fselector`
- `Mlbench`
- `Foreach`
- `doParallel`
- `doSNOW`
- `rgl`

## Key findings
- Exponential Kernel achieved highest returns (110%–170% excess returns) but similar VaR (-7.0%) compared to other kernels.  
  > Exponential Kernel | -7.0% | 7.1%
- Wavelet Kernel had lowest risk (-12.5% VaR) but lower average returns (5.0%) compared to market average (4.0%).  
  > Wavelet Kernel | -12.5% | 5.0%
- 15 kernels tested, with Cauchy and Generalized T-Student kernels showing consistent performance across periods.  
  > Cauchy Kernel | 25% | 10% | 15% | 20% | 25%
- Feature selection reduced 127 variables to 24, improving model efficiency without sacrificing accuracy.  
  > From 127 down to 24 features

## Applications
- portfolio optimization
- stock selection using machine learning

## References cited
- Fan, A., & Palaniswami, M. (2001)
- Marcelino, S., Henrique, P. A., & Albuquerque, P. H. M. (2015)
- Huerta, Ramon, Fernando Corbacho, and Charles Elkan (2013)
- Emir, S., Dinçer, H., & Timor, M. (2012)

## See also
- [`years/2016.md`](../years/2016.md)
- [`speakers/pedro_alexander.md`](../speakers/pedro_alexander.md)
- [`topics/portfolio_optimization.md`](../topics/portfolio_optimization.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=50% (2/4), source=ocr(paddle)*

