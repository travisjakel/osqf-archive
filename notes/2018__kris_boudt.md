---
type: Talk
title: The Minimum Regularized Covariance Determinant Estimator
description: The MRCD estimator combines the MCD approach with shrinkage to improve covariance matrix estimation in high-dimensional data.
timestamp: "2026-07-08T00:00:00Z"
year: 2018
date: ~
speaker: Kris Boudt
speaker_slug: kris_boudt
talk_type: Talk
time_slot: "10:24 - 10:44"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/KrisBoudt.pdf"
file_local: "./_cache/files/2018/2018__kris_boudt.pdf"
slug: 2018__kris_boudt
status: archived
tags: [osqf, 2018, kris_boudt, robust_statistics]
---

# The Minimum Regularized Covariance Determinant Estimator

_2018 · Kris Boudt_

**Headline:** The MRCD estimator combines the MCD approach with shrinkage to improve covariance matrix estimation in high-dimensional data.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/KrisBoudt.pdf>
- Local: `./_cache/files/2018/2018__kris_boudt.pdf`
- Talk type: Talk
- Time slot: 10:24 - 10:44

## Topics
- robust statistics
- covariance matrix estimation
- outlier detection
- high-dimensional data
- finance applications

## Methods
- Minimum Covariance Determinant (MCD) estimator
- shrinkage techniques
- C-step algorithm
- simulation studies

## Datasets used
- Industry_10
- Octane data

## Code & tools
- `RiskPortfolios`
- `robustbase`
- `rrcov`
- R code at https://wis.kuleuven.be/stat/robust/Programs/MRCD

## Key findings
- MRCD outperforms OGK in simulation studies with contaminated data  
  > Outperformance wrt OGK.
- Shrinkage to identity matrix is non-robust to outliers  
  > one big outlier is sufficient to put all the weight on the target
- MRCD maintains high breakdown point while being well-conditioned  
  > Preserves high breakdown properties of MCD and is well-conditioned, even when p > n

## Applications
- outlier detection (chemistry)
- regression analysis (criminology)
- minimum variance portfolios (finance)

## References cited
- Ledoit and Wolf (2004)
- Agostinelli et al. (2015)
- Maronna and Zamar (2002)

## See also
- [`years/2018.md`](../years/2018.md)
- [`speakers/kris_boudt.md`](../speakers/kris_boudt.md)
- [`topics/robust_statistics.md`](../topics/robust_statistics.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

