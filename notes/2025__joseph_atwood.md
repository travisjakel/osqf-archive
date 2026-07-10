---
type: Talk
title: Simulating Multivariate Variables Using Non-Parametric Smoothed Historical Data Procedures
description: Simulating multivariate variables using non-parametric smoothed historical data procedures to assess portfolio risk and generate potential future VaR/cVaR levels.
timestamp: "2026-07-08T00:00:00Z"
year: 2025
date: ~
speaker: Joseph Atwood
speaker_slug: joseph_atwood
talk_type: Lightning
time_slot: "11:50 - 11:57"
file_format: pdf
file_url: "https://www.osqf.org/archive/2025/JosephAtwood.pdf"
file_local: "./_cache/files/2025/2025__joseph_atwood.pdf"
slug: 2025__joseph_atwood
status: archived
tags: [osqf, 2025, joseph_atwood, risk_management]
---

# Simulating Multivariate Variables Using Non-Parametric Smoothed Historical Data Procedures

_2025 · Joseph Atwood (Montana State University - Bozeman)_

**Headline:** Simulating multivariate variables using non-parametric smoothed historical data procedures to assess portfolio risk and generate potential future VaR/cVaR levels.

## Source
- File format: `pdf`
- URL: <https://www.osqf.org/archive/2025/JosephAtwood.pdf>
- Local: `./_cache/files/2025/2025__joseph_atwood.pdf`
- Talk type: Lightning
- Time slot: 11:50 - 11:57

## Topics
- risk management
- historical data simulation
- non-parametric methods
- copula models
- portfolio risk assessment

## Methods
- kernel density estimation
- historical copula binding
- rank-order transformation
- smoothing procedures
- Monte Carlo simulation

## Datasets used
*(none extracted)*

## Code & tools
- R
- density()
- sample()
- rankorder()
- copula package

## Key findings
- Non-parametric historical procedures avoid marginal distribution estimation and dependency structure modeling.  
  > Nonparametric and distribution free. Does not require the estimation/modeling of each asset's marginal distribution.
- Historical copulas provide more flexible dependency modeling than empirical copulas.  
  > Historical copulas are related to empirical copulas but are (in our opinion) more flexible and often generate more consistent results.
- Smoothing HCOP improves serial dependency modeling for multivariate normality.  
  > HCOPN ~ MVN(mean(Y), cov(Y)) since Y and HCOP have the same mean and covariance matrix.

## Applications
- risk management
- portfolio optimization

## References cited
- Atwood (2025)
- Butler and Schachter (1996)
- Hull (2023)
- McNeil et al. (2015)

## See also
- [`years/2025.md`](../years/2025.md)
- [`speakers/joseph_atwood.md`](../speakers/joseph_atwood.md)
- [`topics/risk_management.md`](../topics/risk_management.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

