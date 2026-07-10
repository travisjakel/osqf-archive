---
type: Talk
title: Dynamic Multiple Quantile Models
description: Dynamic multiple quantile models ensuring monotonicity via spacing-based construction and score-driven updates for risk management and density prediction
timestamp: "2026-07-08T00:00:00Z"
year: 2022
date: ~
speaker: Leopoldo Catania
speaker_slug: leopoldo_catania
talk_type: Talk
time_slot: "11:15 - 11:35"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2022/LeopoldoCatania.pdf"
file_local: "./_cache/files/2022/2022__leopoldo_catania.pdf"
slug: 2022__leopoldo_catania
status: archived
tags: [osqf, 2022, leopoldo_catania]
---

# Dynamic Multiple Quantile Models

_2022 · Leopoldo Catania (Aarhus University)_

**Headline:** Dynamic multiple quantile models ensuring monotonicity via spacing-based construction and score-driven updates for risk management and density prediction

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2022/LeopoldoCatania.pdf>
- Local: `./_cache/files/2022/2022__leopoldo_catania.pdf`
- Talk type: Talk
- Time slot: 11:15 - 11:35

## Topics
- dynamic quantile modeling
- risk management
- statistical inference for quantiles
- time series forecasting
- non-crossing quantile estimation
- score-driven models

## Methods
- quantile spacings method
- score-driven parameter updating
- M-estimation
- asymmetric Laplace likelihood
- non-crossing quantile constraints

## Datasets used
- Microsoft Corporation daily returns (2010-2018)
- CPI time series

## Code & tools
- `RcppArmadillo`
- `DEoptim`
- CRAN (R package)

## Key findings
- Quantile monotonicity ensured by construction through spacing parameters  
  > First contribution of the project: A multiple quantile model satisfying the non crossing condition by construction
- Score-driven updates use gradient of multiple quantile loss function  
  > Second contribution of the project: the forcing variable is proportional to the derivative of the quantile loss function
- Asymptotic normality established for parameter estimates  
  > sqrt(T)(widehat{theta}_T - theta_0) to_d N(0, Q_0^{-1} V_0 Q_0^{-1})

## Applications
- Risk Management
- Moments and Density predictions

## References cited
- Engle and Manganelli (2004)
- Koenker and Xiao (2006)
- Patton et al. (2019)
- White et al. (2015)
- Harvey (2013)

## See also
- [`years/2022.md`](../years/2022.md)
- [`speakers/leopoldo_catania.md`](../speakers/leopoldo_catania.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

