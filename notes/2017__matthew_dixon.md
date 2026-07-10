---
type: Talk
title: MLEMVDA R Package for Maximum Likelihood Estimation of Multivariate Diffusion Models
description: "The MLEMVD R package enables maximum likelihood estimation for multivariate diffusion models, with applications in financial modeling."
timestamp: "2026-07-08T00:00:00Z"
year: 2017
date: ~
speaker: Matthew Dixon
speaker_slug: matthew_dixon
talk_type: Talk
time_slot: "13:35 - 13:55"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/MatthewDixon.pdf"
file_local: "./_cache/files/2017/2017__matthew_dixon.pdf"
slug: 2017__matthew_dixon
status: archived
tags: [osqf, 2017, matthew_dixon]
---

# MLEMVDA R Package for Maximum Likelihood Estimation of Multivariate Diffusion Models

_2017 · Matthew Dixon (Illinois Institute of Technology)_

**Headline:** The MLEMVD R package enables maximum likelihood estimation for multivariate diffusion models, with applications in financial modeling.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/MatthewDixon.pdf>
- Local: `./_cache/files/2017/2017__matthew_dixon.pdf`
- Talk type: Talk
- Time slot: 13:35 - 13:55

## Topics
- multivariate diffusion models
- maximum likelihood estimation
- financial modeling
- Heston model calibration
- R package development
- statistical parameter estimation

## Methods
- Hermite expansion for likelihood approximation
- Jacobian-based likelihood transformation
- numerical optimization for parameter estimation
- maximum likelihood estimation (MLE)

## Datasets used
- simulated Geometric Brownian Motion data
- simulated Heston model data
- ATM option prices (constant maturity)

## Code & tools
- R package MLEMVD
- devtools (R package)
- GitHub (for package installation)

## Key findings
- Estimated parameters for Geometric Brownian Motion (0.525, 0.204) closely match actual values (0.5, 0.2) with small standard errors.  
  > Estimated parameters (0.525, 0.204) closely match actual (0.5, 0.2) with small standard errors.
- Heston model calibration achieves parameter estimates within 1-2% of true values using simulated data.  
  > Estimated parameters (−0.81, 3.4, 0.201, 0.2476) near true values (−0.8, 3.0, 0.2, 0.25).
- Model calibration errors for simulated Heston data show absolute price errors <0.005 and volatility errors <0.002.  
  > Last 0.000486872616368927 (price error); Last 0.00122376798258172 (volatility error).

## Applications
- financial model calibration
- option pricing
- statistical parameter estimation in finance

## References cited
- Sahalia (2002) on multivariate diffusion models
- SSRN paper by Dixon and Wu (2017)

## See also
- [`years/2017.md`](../years/2017.md)
- [`speakers/matthew_dixon.md`](../speakers/matthew_dixon.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=0% (0/3)*

