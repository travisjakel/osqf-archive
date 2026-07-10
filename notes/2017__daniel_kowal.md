---
type: Talk
title: A Bayesian Multivariate Functional Dynamic Linear Model
description: "A Bayesian model for multivariate functional time series, decomposing data into dynamic factors and functional components using splines and MCMC."
timestamp: "2026-07-08T00:00:00Z"
year: 2017
date: ~
speaker: Daniel Kowal
speaker_slug: daniel_kowal
talk_type: Talk
time_slot: "09:55 - 10:15"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/DanielKowal.pdf"
file_local: "./_cache/files/2017/2017__daniel_kowal.pdf"
slug: 2017__daniel_kowal
status: archived
tags: [osqf, 2017, daniel_kowal, gibbs_sampling]
---

# A Bayesian Multivariate Functional Dynamic Linear Model

_2017 · Daniel Kowal (Cornell University and Rice University)_

**Headline:** A Bayesian model for multivariate functional time series, decomposing data into dynamic factors and functional components using splines and MCMC.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/DanielKowal.pdf>
- Local: `./_cache/files/2017/2017__daniel_kowal.pdf`
- Talk type: Talk
- Time slot: 09:55 - 10:15

## Topics
- Bayesian multivariate functional models
- dynamic linear models
- functional data analysis
- stochastic volatility
- financial time series

## Methods
- Gibbs sampling
- Kalman filter (KFAS)
- nonparametric regression with splines
- roughness penalty priors

## Datasets used
- FED Yield Curve data
- UK_Yields (commented out example)

## Code & tools
- `KFAS`
- FDLM R package
- R functions: fdlm(), sampleFLC(), SSMcustom()

## Key findings
- FDLM decomposes functional time series into dynamic factors and functional components via nonparametric regression with splines.  
  > Decompose a functional time series y t into • functional component {f k (T )
- Factor loading curves are estimated using splines with roughness penalties in the prior.  
  > d k ~ N ( ∇ , λ k -1 ∇ 2 -1 ) Flexible, computationally efficient, and smooth
- MCMC sampling algorithm enables joint estimation of factors, error variances, and basis coefficients.  
  > Sample the factors, {βk,t}, ... Sample the factor loading curves, {fk}

## Applications
- finance/economics
- neuroscience
- astronomy

## References cited
- KFAS (Helske, 2017)
- Kowal et al. (2016) Bayesian multivariate functional dynamic linear model

## See also
- [`years/2017.md`](../years/2017.md)
- [`speakers/daniel_kowal.md`](../speakers/daniel_kowal.md)
- [`methods/gibbs_sampling.md`](../methods/gibbs_sampling.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

