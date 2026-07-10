---
type: Talk
title: Tail Risk Budgeting versus Modern Portfolio Theory
description: Comparison of Tail Risk Budgeting approaches versus Modern Portfolio Theory in portfolio optimization
timestamp: "2026-07-08T00:00:00Z"
year: 2011
date: ~
speaker: Martin
speaker_slug: martin
talk_type: Talk
time_slot: "10:30 - 10:50"
file_format: pptx
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2011/DougMartin.pptx"
file_local: "./_cache/files/2011/2011__martin.pptx"
slug: 2011__martin
status: archived
tags: [osqf, 2011, martin]
---

# Tail Risk Budgeting versus Modern Portfolio Theory

_2011 · Martin (University of Washington, Department of Applied Mathematics)_

**Headline:** Comparison of Tail Risk Budgeting approaches versus Modern Portfolio Theory in portfolio optimization

## Source
- File format: `pptx`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2011/DougMartin.pptx>
- Local: `./_cache/files/2011/2011__martin.pptx`
- Talk type: Talk
- Time slot: 10:30 - 10:50

## Topics
- Tail Risk Budgeting
- Modern Portfolio Theory
- Factor Models
- Risk Decomposition
- Portfolio Optimization

## Methods
- Mean-ETL Optimization
- Factor Model Monte Carlo (FMMC)
- Reverse Optimization
- Euler Risk Decomposition
- Bootstrap Standard Error Estimation

## Datasets used
- hedgefund.net (379 hedge funds, 12/1991-11/2009)
- FinAnalytica, Inc. (skewed t-distribution models)

## Code & tools
- R
- robust package
- glmnet package
- `regsubsets`

## Key findings
- Tail Risk Budgeting uses Euler's homogeneous risk measures for additive decomposition  
  > RSK(λw) = λ · RSK(w), λ > 0 satisfies RSK(w) = ∑ n i=1 w i · ∂ RSK(w) / ∂ w i
- Minimum ETL portfolios outperform minimum volatility portfolios in backtests  
  > Mean of 100 Portfolio Values on a Monthly Basis (slide 10)
- Factor Model Monte Carlo improves risk estimates with bootstrap standard errors  
  > Risk Estimates and Bootstrap S.E.'s (slides 25-28)

## Applications
- Hedge fund portfolio optimization
- Risk management
- Asset allocation

## References cited
- Rockafellar and Uryasev (2000)
- Tasche (2000)
- Stambaugh (1997)
- Pastor and Stambaugh (2002)

## See also
- [`years/2011.md`](../years/2011.md)
- [`speakers/martin.md`](../speakers/martin.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3), source=ocr(paddle)*

