---
type: Talk
title: Complex Portfolio Optimization with PortfolioAnalytics
description: "PortfolioAnalytics is an R package for portfolio optimization with complex constraints and objectives, demonstrating random portfolios, solver support, and visualization tools."
timestamp: "2026-07-08T00:00:00Z"
year: 2014
date: ~
speaker: Ross Bennett
speaker_slug: ross_bennett
talk_type: Tutorial
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/workshop/RossBennett.pdf"
file_local: "./_cache/files/2014/2014__ross_bennett.pdf"
slug: 2014__ross_bennett
status: archived
tags: [osqf, 2014, ross_bennett, portfolio_optimization]
---

# Complex Portfolio Optimization with PortfolioAnalytics

_2014 · Ross Bennett_

**Headline:** PortfolioAnalytics is an R package for portfolio optimization with complex constraints and objectives, demonstrating random portfolios, solver support, and visualization tools.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/workshop/RossBennett.pdf>
- Local: `./_cache/files/2014/2014__ross_bennett.pdf`
- Talk type: Tutorial

## Topics
- portfolio optimization
- risk management
- constraint handling
- R package development

## Methods
- DEoptim
- random portfolios (sample/simplex/grid)
- ROI solvers
- risk budgeting
- CRRA utility maximization

## Datasets used
- CRSP large/mid/small cap stocks (1997-2010)
- EDHEC-Risk Alternative Indexes (1997-2014)

## Code & tools
- `PortfolioAnalytics`
- `ROI`
- `DEoptim`
- `pso`
- `GenSA`
- `PerformanceAnalytics`
- `NMOF`
- `Shiny`

## Key findings
- PortfolioAnalytics supports multiple solvers including DEoptim and ROI for complex optimization.  
  > Support for multiple solvers
Linear and Quadratic Programming Solvers
· R Optimization Infrastructure (ROI)
     - GLPK (Rglpk)
     - Symphony (Rsymphony)
     - Quadprog (quadprog)
- The package implements three random portfolio generation methods: sample, simplex, and grid.  
  > PortfolioAnalytics has three methods to generate random portfolios.
1. The sample method... 2. The simplex method... 3. The grid method...
- Custom moment functions enable advanced objectives like CRRA utility maximization.  
  > Define a custom moment function
The default function for momentFUN is set.portfolio.moments. We need to write our own function...

## Applications
- portfolio optimization
- risk budgeting
- backtesting
- asset allocation

## References cited
- Martellini paper
- Boudt paper
- Shiny App

## See also
- [`years/2014.md`](../years/2014.md)
- [`speakers/ross_bennett.md`](../speakers/ross_bennett.md)
- [`topics/portfolio_optimization.md`](../topics/portfolio_optimization.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3)*

