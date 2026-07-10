---
type: Talk
title: Partial Moments in QF
description: "Partial moments in quantitative finance, their equivalences to traditional statistics, and applications in portfolio theory, forecasting, and utility modeling."
timestamp: "2026-07-08T00:00:00Z"
year: 2025
date: ~
speaker: Fred Viole
speaker_slug: fred_viole
talk_type: Talk
time_slot: "11:30 - 11:50"
file_format: pdf
file_url: "https://www.osqf.org/archive/2025/FredViole.pdf"
file_local: "./_cache/files/2025/2025__fred_viole.pdf"
slug: 2025__fred_viole
status: archived
tags: [osqf, 2025, fred_viole]
---

# Partial Moments in QF

_2025 · Fred Viole (OVVO Labs)_

**Headline:** Partial moments in quantitative finance, their equivalences to traditional statistics, and applications in portfolio theory, forecasting, and utility modeling.

## Source
- File format: `pdf`
- URL: <https://www.osqf.org/archive/2025/FredViole.pdf>
- Local: `./_cache/files/2025/2025__fred_viole.pdf`
- Talk type: Talk
- Time slot: 11:30 - 11:50

## Topics
- partial moments
- statistical equivalences
- nonlinear regression
- time-series forecasting
- portfolio optimization
- utility theory

## Methods
- LPM/UPM calculations
- covariance equivalence
- copula modeling
- maximum entropy bootstrap
- nonparametric vector autoregression
- matrix decomposition

## Datasets used
- AirPassengers

## Code & tools
- NNS package (LPM, UPM, Co.LPM, NNS.meboot)
- `PerformanceAnalytics`
- `forecast`
- `rgl`
- base R functions

## Key findings
- Variance equals UPM(2) + LPM(2) scaled by sample size  
  > var(x) * ((length(x) - 1) / length(x))
[1] 0.8249005
UPM(2, mu_x, x) + LPM(2, mu_x, x)
[1] 0.8249005
- Skewness calculated via UPM(3) - LPM(3) normalized by variance  
  > ((UPM(3, mu_x, x) - LPM(3, mu_x, x)) / (UPM(2, mu_x, x) + LPM(2, mu_x,
- Multivariate extensions use cross-product partial moments  
  > CLP M(degree, target, x, y) = ∑ [max(0, target − xt )]degree [max(0, target − yt )]degree
- Stress testing uses CLP M to maintain dependence structure  
  > Restrict observations to CLP M and use NNS.reg(), maintains dependence structure
- Utility theory integrates loss-aversion (n) and gain-seeking (q) parameters  
  > loss-aversion: n
gain-seeking: q

## Applications
- stress testing
- options pricing
- portfolio optimization
- macro nowcasting
- dispersion measures

## References cited
- Markowitz (1959) utility theory
- LinkedIn article on expected partial moments
- OVVO Financial GitHub repo

## See also
- [`years/2025.md`](../years/2025.md)
- [`speakers/fred_viole.md`](../speakers/fred_viole.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=80% (4/5), source=ocr(paddle)*

