---
type: Talk
title: Asset Allocation with Higher Order Moments and Factor Models
description: Asset allocation using higher-order moments and factor models to address non-normal returns and the curse of dimensionality in portfolio optimization.
timestamp: "2026-07-08T00:00:00Z"
year: 2014
date: ~
speaker: Kris Boudt
speaker_slug: kris_boudt
talk_type: Talk
time_slot: "16:11 - 16:31"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/KrisBoudt.pdf"
file_local: "./_cache/files/2014/2014__kris_boudt.pdf"
slug: 2014__kris_boudt
status: archived
tags: [osqf, 2014, kris_boudt, asset_allocation]
---

# Asset Allocation with Higher Order Moments and Factor Models

_2014 · Kris Boudt (VU Brussel, Amsterdam)_

**Headline:** Asset allocation using higher-order moments and factor models to address non-normal returns and the curse of dimensionality in portfolio optimization.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/KrisBoudt.pdf>
- Local: `./_cache/files/2014/2014__kris_boudt.pdf`
- Talk type: Talk
- Time slot: 16:11 - 16:31

## Topics
- asset allocation
- higher order moments
- factor models
- portfolio optimization
- curse of dimensionality

## Methods
- Differential Evolution (DE) with DEoptim
- factor models for comoment estimation
- Taylor expansion of utility functions
- Cornish-Fisher expansion for downside risk

## Datasets used
- 17-asset portfolio (bonds, equities, commodities) 2001-2013

## Code & tools
- `DEoptim`
- `PerformanceAnalytics`
- `Rcpp`
- `PortfolioAnalytics`
- `xts`

## Key findings
- Higher-order moments (skewness, kurtosis) significantly impact portfolio optimization but are challenging to estimate due to the curse of dimensionality.  
  > The challenge is that while the sample size in terms of history of returns is often limited, many problems require to optimize over a large number of assets: Curse of dimensionality in the number of parameters large estimation errors.
- Factor models reduce parameter estimation complexity by assuming independence of idiosyncratic terms, zeroing out many comoment matrix elements.  
  > Under the factor model, we can rewrite the higher order comoments as a function of the comoments of the factors and a residual matrix that mostly contains 0s (because of the independence assumption).
- Using factor models and expected utility objectives (vs. variance minimization) improves out-of-sample returns and reduces downside risk.  
  > Three actions seem to increase the out-of-sample return and reduce the portfolio downside risk: (i) imposing more structure on the estimates... (iii) switching from a minimum variance objective to a CRRA expected utility objective.

## Applications
- portfolio optimization
- risk management
- asset allocation

## References cited
- Martellini and Ziemann (2010)
- Jondeau, Poon, and Rockinger (2007)
- Boudt, Peterson, and Croux (2008)
- Zivot (2011)

## See also
- [`years/2014.md`](../years/2014.md)
- [`speakers/kris_boudt.md`](../speakers/kris_boudt.md)
- [`topics/asset_allocation.md`](../topics/asset_allocation.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

