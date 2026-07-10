---
type: Talk
title: Comparing Fitted Factor Models with the fit.models Package
description: The talk presents the fit.models R package for comparing robust and maximum likelihood fitted factor models in financial time series analysis.
timestamp: "2026-07-08T00:00:00Z"
year: 2016
date: ~
speaker: Kjell Konis
speaker_slug: kjell_konis
talk_type: Lightning
time_slot: "14:05 - 14:35"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/KjellKonis.pdf"
file_local: "./_cache/files/2016/2016__kjell_konis.pdf"
slug: 2016__kjell_konis
status: archived
tags: [osqf, 2016, kjell_konis, factor_models, robust_regression]
---

# Comparing Fitted Factor Models with the fit.models Package

_2016 · Kjell Konis (University of Washington, Dept. Applied Mathematics)_

**Headline:** The talk presents the fit.models R package for comparing robust and maximum likelihood fitted factor models in financial time series analysis.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/KjellKonis.pdf>
- Local: `./_cache/files/2016/2016__kjell_konis.pdf`
- Talk type: Lightning
- Time slot: 14:05 - 14:35

## Topics
- factor models
- model comparison
- robust statistics
- R programming
- financial time series
- statistical packages

## Methods
- robust regression
- maximum likelihood estimation (MLE)
- nested model comparison
- factor analysis

## Datasets used
- managers

## Code & tools
- `fit.models`
- `factorAnalytics`
- `robust`
- `MASS`
- R

## Key findings
- Robust and MLE fits show different coefficient estimates and residual scales (e.g., robust scale: 0.01837 vs MLE: 0.01695).  
  > Residual Scale Estimates: Robust: 0.01837 on 58 degrees of freedom MLE: 0.01695 on 58 degrees of freedom
- Adding factors in nested models improves R-squared from 0.6199 (single factor) to 0.7089 (three factors).  
  > Multiple R-squared: TF: 0.7089 SF: 0.6199
- fitTsfm produces varying R-squared values across assets (e.g., HAM1: 0.6199, HAM2: 0.1490).  
  > R-squared values: HAM1 0.6199 HAM2 0.1490 HAM3 0.6526 HAM4 0.4245 HAM5 0.1049 HAM6 0.2521
- Three-factor models reduce residual volatility for most assets compared to single-factor models.  
  > Residual Volatilities: sfm: 0.01695 0.01863 tfm: 0.01510 0.01506

## Applications
- financial modeling
- risk management
- asset return analysis

## References cited
- Eric Zivot and Jiahui Wang (2006). Modeling Financial Time Series with S-PLUS. Chapter 15.

## See also
- [`years/2016.md`](../years/2016.md)
- [`speakers/kjell_konis.md`](../speakers/kjell_konis.md)
- [`topics/factor_models.md`](../topics/factor_models.md)
- [`methods/robust_regression.md`](../methods/robust_regression.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=50% (2/4), source=ocr(paddle)*

