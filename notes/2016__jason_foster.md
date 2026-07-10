---
type: Talk
title: Multi-Asset Principal Component Regression using RcppParallel
description: "The 'roll' R package uses RcppParallel to accelerate rolling principal component regression and linear models for multi-asset portfolio analysis."
timestamp: "2026-07-08T00:00:00Z"
year: 2016
date: ~
speaker: Jason Foster
speaker_slug: jason_foster
talk_type: Talk
time_slot: "15:57 - 16:17"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/JasonFoster.pdf"
file_local: "./_cache/files/2016/2016__jason_foster.pdf"
slug: 2016__jason_foster
status: archived
tags: [osqf, 2016, jason_foster]
---

# Multi-Asset Principal Component Regression using RcppParallel

_2016 · Jason Foster (CRAN)_

**Headline:** The 'roll' R package uses RcppParallel to accelerate rolling principal component regression and linear models for multi-asset portfolio analysis.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/JasonFoster.pdf>
- Local: `./_cache/files/2016/2016__jason_foster.pdf`
- Talk type: Talk
- Time slot: 15:57 - 16:17

## Topics
- principal component regression
- rolling statistics
- RcppParallel optimization
- multi-asset portfolio analysis
- factor modeling

## Methods
- principal component analysis
- linear regression
- rolling window calculations
- parallel processing

## Datasets used
- KFRENCH/FACTORS_D
- Quandl factor returns (Jul-1926 to Mar-2016)

## Code & tools
- R
- `RcppParallel`
- roll package
- `Quandl`
- pls (plsr function)

## Key findings
- RcppParallel reduces rolling PCA computation time from 241.9 seconds to 1.1 seconds (214x faster)  
  > 214x over R version!
Median portfolio
R-squared (%)
- roll_pcr coefficients match standard pcr function results  
  > all.equal(r_pcr_coef, roll_pcr_coef)
## [1] TRUE
- Rolling Fama-French model calculations accelerated 414x using RcppParallel  
  > 414x over R version!
- Variance inflation factors reveal strong multicollinearity across asset classes  
  > Variances inflation factors
Variances inflation factors

## Applications
- portfolio risk management
- factor analysis
- performance attribution

## References cited
- Sharpe, William F. 1988. 'Determining a Fund's Effective Asset Mix.'
- BlackRock Global Investment Outlook (Apr-2016)

## See also
- [`years/2016.md`](../years/2016.md)
- [`speakers/jason_foster.md`](../speakers/jason_foster.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (4/4), source=ocr(paddle)*

