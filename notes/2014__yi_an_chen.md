---
type: Talk
title: Estimating Factor Models and Managing Risk with FactorAnalytics
description: The factorAnalytics R package provides tools for estimating factor models and managing portfolio risk through factor decomposition and risk budgeting.
timestamp: "2026-07-08T00:00:00Z"
year: 2014
date: ~
speaker: Yi-An Chen
speaker_slug: yi_an_chen
talk_type: Tutorial
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/workshop/YiAnChen.pdf"
file_local: "./_cache/files/2014/2014__yi_an_chen.pdf"
slug: 2014__yi_an_chen
status: archived
tags: [osqf, 2014, yi_an_chen, factor_models]
---

# Estimating Factor Models and Managing Risk with FactorAnalytics

_2014 · Yi-An Chen (Department of Economics University of Washington)_

**Headline:** The factorAnalytics R package provides tools for estimating factor models and managing portfolio risk through factor decomposition and risk budgeting.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/workshop/YiAnChen.pdf>
- Local: `./_cache/files/2014/2014__yi_an_chen.pdf`
- Talk type: Tutorial

## Topics
- factor models
- risk management
- statistical factor analysis
- principal components analysis
- portfolio risk analysis
- factor risk budgeting

## Methods
- time-series regression
- factor analysis
- principal components analysis
- asymptotic principal component analysis (APCA)
- Monte Carlo simulations

## Datasets used
*(none extracted)*

## Code & tools
- `factorAnalytics`
- `PerformanceAnalytics`
- `ReturnAnalytics`

## Key findings
- The factorAnalytics package supports three factor model types: time series, fundamental, and statistical.  
  > According to different model setup, 3 main different types of models:
- APCA is used for statistical factor models when the number of assets exceeds time periods (N > T).  
  > If N > T, then the sample covariance matrix of returns becomes singular which complicates traditional factor and principal components analysis. In this case, the method of 'asymptotic principal component analysis' is more appropriate.
- Factor risk decomposition allows attributing portfolio risk to specific factors for hedging and allocation.  
  > Factor Risk Budgeting: Additively decompose (slice and dice) individual asset or portfolio return risk measures into factor contributions

## Applications
- portfolio risk analysis
- factor risk budgeting
- risk management

## References cited
- Henriksson-Merton Model (1981)
- Treynor-Mazuy Model (1966)
- Conner and Korajczyk (1986)
- Bai and Ng (2002)

## See also
- [`years/2014.md`](../years/2014.md)
- [`speakers/yi_an_chen.md`](../speakers/yi_an_chen.md)
- [`topics/factor_models.md`](../topics/factor_models.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3), source=ocr(paddle)*

