---
type: Talk
title: R tools for Portfolio Optimization
description: "Presentation on using R packages for portfolio optimization techniques including mean-variance, conditional value-at-risk, and nonlinear methods."
timestamp: "2026-07-08T00:00:00Z"
year: 2009
date: ~
speaker: Guy Yollin
speaker_slug: guy_yollin
talk_type: ~
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2009/yollin_slides.pdf"
file_local: "./_cache/files/2009/2009__guy_yollin.pdf"
slug: 2009__guy_yollin
status: archived
tags: [osqf, 2009, guy_yollin, portfolio_optimization, quadratic_programming]
---

# R tools for Portfolio Optimization

_2009 · Guy Yollin (Rotella Capital Management)_

**Headline:** Presentation on using R packages for portfolio optimization techniques including mean-variance, conditional value-at-risk, and nonlinear methods.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2009/yollin_slides.pdf>
- Local: `./_cache/files/2009/2009__guy_yollin.pdf`

## Topics
- portfolio optimization
- mean-variance
- conditional value-at-risk
- nonlinear optimization
- risk management
- R tools

## Methods
- quadratic programming
- linear programming
- differential evolution algorithm

## Datasets used
*(none extracted)*

## Code & tools
- `tseries`
- `quadprog`
- `Rglpk_solve_LP`
- `DEoptim`

## Key findings
- R's tseries package provides portfolio.optim function for mean-variance optimization  
  > portfolio.optim {tseries} computer mean-variance efficient portfolio
- DEoptim package implements differential evolution for nonlinear constraints  
  > DEoptim package Omega Optimization Adding Constraints Maximum Drawdown Optimization
- Efficient frontier calculation uses portfolio.optim in a loop  
  > effFrontier = function (averet, rcov, nports = 20, shorts=T, wmax=1)

## Applications
- portfolio optimization
- risk management

## References cited
*(none extracted)*

## See also
- [`years/2009.md`](../years/2009.md)
- [`speakers/guy_yollin.md`](../speakers/guy_yollin.md)
- [`topics/portfolio_optimization.md`](../topics/portfolio_optimization.md)
- [`methods/quadratic_programming.md`](../methods/quadratic_programming.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3)*

