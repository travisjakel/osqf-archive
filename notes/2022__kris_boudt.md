---
type: Talk
title: Estimation of Factors Using Higher-Order Multi-cumulants in Weak Factor Models
description: Higher-order factor analysis improves factor estimation in weak factor models by leveraging multi-cumulants instead of covariance matrices.
timestamp: "2026-07-08T00:00:00Z"
year: 2022
date: ~
speaker: Kris Boudt
speaker_slug: kris_boudt
talk_type: Talk
time_slot: "09:40 - 10:00"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2022/KrisBoudt.pdf"
file_local: "./_cache/files/2022/2022__kris_boudt.pdf"
slug: 2022__kris_boudt
status: archived
tags: [osqf, 2022, kris_boudt, factor_analysis]
---

# Estimation of Factors Using Higher-Order Multi-cumulants in Weak Factor Models

_2022 · Kris Boudt (HFA)_

**Headline:** Higher-order factor analysis improves factor estimation in weak factor models by leveraging multi-cumulants instead of covariance matrices.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2022/KrisBoudt.pdf>
- Local: `./_cache/files/2022/2022__kris_boudt.pdf`
- Talk type: Talk
- Time slot: 09:40 - 10:00

## Topics
- factor analysis
- PCA limitations
- higher-order moments
- weak factors
- equity premium forecasting
- statistical modeling

## Methods
- PCA-based factor analysis
- higher-order cumulant matrices
- simulation studies
- eigenvalue ratio selection
- linear factor fitting

## Datasets used
- FRED-MD (134 monthly macroeconomic time series)

## Code & tools
- hofa R package (https://github.com/GuanglinHuang/hofa)

## Key findings
- Standard PCA fails for weak factors as idiosyncratic variance obscures eigenvalue separation.  
  > Due to the large explanatory power of the idiosyncratic factors, there is no clear separation of the eigenvalues
- Higher-order cumulant PCA successfully separates factors even when variance of E is large.  
  > Success in estimating factors by doing eigenanalysis on C (3) (3) C (3)t instead of Xt X
- Fourth-order cumulant PCA achieves 2.28 MSE in equity premium forecasting vs 2.32 for standard PCA.  
  > PCA on 3rd order cumulant 2.280* PCA on 4th order cumulant 2.284*
- Factor selection via eigenvalue ratios of cumulant matrices is theoretically consistent.  
  > Asymptotic properties: Consistency and asymptotic normality of HFA for N, T → ∞

## Applications
- equity risk premium forecasting
- factor selection in high-dimensional data

## References cited
- Ahn and Horenstein (2013)
- DeMol et al. (2008)
- SSRN: 3599632

## See also
- [`years/2022.md`](../years/2022.md)
- [`speakers/kris_boudt.md`](../speakers/kris_boudt.md)
- [`topics/factor_analysis.md`](../topics/factor_analysis.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=75% (3/4), source=ocr(paddle)*

