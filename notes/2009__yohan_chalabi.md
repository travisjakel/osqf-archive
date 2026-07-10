---
type: Talk
title: "Econometrics and Practice: Mind the Gap"
description: "The talk explores gaps between econometric theory and practice, focusing on GARCH models, regime switching, indirect inference, and portfolio optimization challenges."
timestamp: "2026-07-08T00:00:00Z"
year: 2009
date: ~
speaker: Yohan Chalabi
speaker_slug: yohan_chalabi
talk_type: ~
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2009/2009-04-Chicago-trans.pdf"
file_local: "./_cache/files/2009/2009__yohan_chalabi.pdf"
slug: 2009__yohan_chalabi
status: archived
tags: [osqf, 2009, yohan_chalabi]
---

# Econometrics and Practice: Mind the Gap

_2009 · Yohan Chalabi (ETH Zurich, Switzerland)_

**Headline:** The talk explores gaps between econometric theory and practice, focusing on GARCH models, regime switching, indirect inference, and portfolio optimization challenges.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2009/2009-04-Chicago-trans.pdf>
- Local: `./_cache/files/2009/2009__yohan_chalabi.pdf`

## Topics
- Econometrics models
- GARCH volatility modeling
- Regime switching
- Indirect inference
- Portfolio optimization

## Methods
- GARCH(1,1) model
- Markov Switching Models
- Indirect Inference
- Black-Litterman Portfolio Optimization

## Datasets used
- dem2gbp

## Code & tools
- R
- `nlminb`
- `fBasics`
- `fGarch`
- `MASS`
- `timeDate`
- `timeSeries`

## Key findings
- Estimating GARCH parameters is sensitive to initial values and optimization schemes  
  > Numerical errors can come from : misspecifications, different parameter initializations, different values for ε0 and σ0 and different optimization schemes.
- Outliers significantly impact portfolio optimization results  
  > robust estimation of the covariance matrix in portfolio optimization can lead to underestimated risk.
- Markov Switching models can decompose IGARCH processes  
  > one can often decompose an IGARCH process to a MS-GARCH.

## Applications
- portfolio optimization
- risk management
- volatility forecasting

## References cited
- Bollerslev [2008]
- Engle [1982]
- Brooks [2001]
- Zivot [2008]
- Caporale et al. [2003]
- Pesaran and Timmermann [2004]
- Guidolin and Timmermann [2007]
- Mankert [2006]

## See also
- [`years/2009.md`](../years/2009.md)
- [`speakers/yohan_chalabi.md`](../speakers/yohan_chalabi.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

