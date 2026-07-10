---
type: Talk
title: ICA for Multivariate Nonlinear Financial Time Series
description: Application of Independent Component Analysis (ICA) to multivariate financial time series for volatility modeling and dimensionality reduction.
timestamp: "2026-07-08T00:00:00Z"
year: 2009
date: ~
speaker: David Matteson
speaker_slug: david_matteson
talk_type: ~
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2009/RFinanceConference20090425Matteson.pdf"
file_local: "./_cache/files/2009/2009__david_matteson.pdf"
slug: 2009__david_matteson
status: archived
tags: [osqf, 2009, david_matteson]
---

# ICA for Multivariate Nonlinear Financial Time Series

_2009 · David Matteson (Cornell University)_

**Headline:** Application of Independent Component Analysis (ICA) to multivariate financial time series for volatility modeling and dimensionality reduction.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2009/RFinanceConference20090425Matteson.pdf>
- Local: `./_cache/files/2009/2009__david_matteson.pdf`

## Topics
- Independent Component Analysis (ICA)
- Multivariate Volatility Modeling
- Dimensionality Reduction in Time Series
- Constrained Factor Models

## Methods
- ICA via Kullback-Leibler divergence minimization
- Quasi-maximum likelihood estimation
- Givens rotations for parameterization
- Nonlinear decorrelation
- Newton's method for optimization

## Datasets used
- Daily log returns of 10 U.S. companies (9/98-9/08)

## Code & tools
*(none extracted)*

## Key findings
- ICA reduces dimensionality by decomposing multivariate series into independent components  
  > Estimation reduced to series of disjoint univariate models
- Constrained ICA improves sector-specific volatility modeling  
  > Sector variations explain most variabilities in the asset returns
- Asymptotic equivalence achieved after one Newton iteration  
  > Difference between off-diagonal and new estimator converges to zero in probability at rate √n

## Applications
- Multivariate volatility modeling
- Asset pricing
- Portfolio selection
- Risk management

## References cited
- Hyväriinen et al. (2001)

## See also
- [`years/2009.md`](../years/2009.md)
- [`speakers/david_matteson.md`](../speakers/david_matteson.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

