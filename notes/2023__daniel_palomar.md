---
type: Talk
title: Estimation of Heavy-Tailed Distributions for Portfolio Design
description: Presentation on the R package fitHeavyTail for estimating heavy-tailed distributions in portfolio optimization.
timestamp: "2026-07-08T00:00:00Z"
year: 2023
date: ~
speaker: Daniel Palomar
speaker_slug: daniel_palomar
talk_type: Lightning
time_slot: "11:30 - 11:37"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2023/DanielPalomar.pdf"
file_local: "./_cache/files/2023/2023__daniel_palomar.pdf"
slug: 2023__daniel_palomar
status: archived
tags: [osqf, 2023, daniel_palomar]
---

# Estimation of Heavy-Tailed Distributions for Portfolio Design

_2023 · Daniel Palomar (Hong Kong University of Science and Technology (HKUST))_

**Headline:** Presentation on the R package fitHeavyTail for estimating heavy-tailed distributions in portfolio optimization.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2023/DanielPalomar.pdf>
- Local: `./_cache/files/2023/2023__daniel_palomar.pdf`
- Talk type: Lightning
- Time slot: 11:30 - 11:37

## Topics
- heavy-tailed distributions
- portfolio optimization
- covariance matrix estimation
- R package development

## Methods
- majorization-minimization (MM) framework
- Tyler's scatter estimator
- Cauchy estimator
- multivariate t-distribution fitting

## Datasets used
*(none extracted)*

## Code & tools
- `fitHeavyTail`
- `mvtnorm`
- stats::cov
- QRM::fit.mst
- MASS::cov.trov
- robustbase::covMcd
- rrcov::CovMrcd
- sn::selm

## Key findings
- Heavy-tailed estimators reduce mean squared error by ~50% compared to sample covariance matrix.  
  > sum((mu_sm - mu)^2) 0.2857323 vs fitted$mu 0.1487845
- fitHeavyTail methods achieve best trade-off between estimation error and CPU time.  
  > The methods provided by the package fitHeavyTail ... best trade-off of estimation error and CPU time.
- Student's t-distribution MLE has no closed-form solution.  
  > But it does not have a closed-form solution.

## Applications
- portfolio optimization

## References cited
- Aas and Haff (2006)
- Liu and Rubin (1995)
- Markowitz (1952)
- Ollila et al. (2021)
- Pascal et al. (2021)
- Sun et al. (2014)
- Sun et al. (2015)
- Sun et al. (2017)

## See also
- [`years/2023.md`](../years/2023.md)
- [`speakers/daniel_palomar.md`](../speakers/daniel_palomar.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3)*

