---
type: Talk
title: Portfolio Analysis and Optimization with R/Rmetrics
description: "Portfolio optimization techniques using R/Rmetrics, covering risk measures, constraints, and software tools."
timestamp: "2026-07-08T00:00:00Z"
year: 2009
date: ~
speaker: Diethelm Wuertz
speaker_slug: diethelm_wuertz
talk_type: ~
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2009/ChicagoWuertz.pdf"
file_local: "./_cache/files/2009/2009__diethelm_wuertz.pdf"
slug: 2009__diethelm_wuertz
status: archived
tags: [osqf, 2009, diethelm_wuertz, portfolio_optimization]
---

# Portfolio Analysis and Optimization with R/Rmetrics

_2009 · Diethelm Wuertz (ETH Zurich, Rmetrics Association, Theta Fundmanagement)_

**Headline:** Portfolio optimization techniques using R/Rmetrics, covering risk measures, constraints, and software tools.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2009/ChicagoWuertz.pdf>
- Local: `./_cache/files/2009/2009__diethelm_wuertz.pdf`

## Topics
- portfolio optimization
- risk measures
- constraint handling
- R/Rmetrics software
- quadratic programming
- portfolio backtesting

## Methods
- Markowitz mean-variance model
- CVaR optimization
- LPM (Lower Partial Moments)
- quadratic programming (QP)
- Rglpk solver
- Rsymphony solver
- Rdonlp2 solver

## Datasets used
*(none extracted)*

## Code & tools
- `fPortfolio`
- `fAssets`
- `Rglpk`
- `Rsymphony`
- `Rdonlp2`
- `Rnlminb`
- `Rsocp`
- `RlpSolve`
- `RlpSolveAPI`
- `Rsimplex`
- `Ripop`
- `timeDate`
- `timeSeries`
- `datafeed`

## Key findings
- CVaR (Conditional Value-at-Risk) is implemented via linear programming formulations.  
  > Rockafeller and Uryasev 1992: CVAR: e s = max ∏ 0 , VaR - ∑ n i=1 w i r i
- Quadratic programming (QP) is used for mean-variance portfolio optimization.  
  > Markowitz 1952, QP1: Minimize Risk for a given Return: min w T ˆ ˜ ˜ ˜ ˜ ˜ w
- Rmetrics provides specialized packages for portfolio backtesting and performance analysis.  
  > fPortfolioBacktest* 1 2 fPortfolioPerformance* 3
- Lower Partial Moments (LPM) are used for risk-averse portfolio optimization.  
  > Nawrocki, 1992: quadratic Lower Partial Moments: LPM = E[{max( 0, τ - y) } a ]

## Applications
- portfolio optimization
- risk management
- portfolio backtesting

## References cited
- Markowitz 1952
- Rockafeller and Uryasev 1992
- Nawrocki 1992

## See also
- [`years/2009.md`](../years/2009.md)
- [`speakers/diethelm_wuertz.md`](../speakers/diethelm_wuertz.md)
- [`topics/portfolio_optimization.md`](../topics/portfolio_optimization.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=75% (3/4), source=ocr(paddle)*

