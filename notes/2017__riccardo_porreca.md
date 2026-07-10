---
type: Talk
title: "Efficient, Consistent and Flexible Credit Default Simulation"
description: "Efficient, consistent, and flexible credit default simulation using TRNG and RcppParallel for integrated market and default risk modeling"
timestamp: "2026-07-08T00:00:00Z"
year: 2017
date: ~
speaker: Riccardo Porreca
speaker_slug: riccardo_porreca
talk_type: Lightning
time_slot: "14:55 - 15:07"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/RiccardoPorreca.pdf"
file_local: "./_cache/files/2017/2017__riccardo_porreca.pdf"
slug: 2017__riccardo_porreca
status: archived
tags: [osqf, 2017, riccardo_porreca, monte_carlo_simulation]
---

# Efficient, Consistent and Flexible Credit Default Simulation

_2017 · Riccardo Porreca (Mirai Solutions GmbH)_

**Headline:** Efficient, consistent, and flexible credit default simulation using TRNG and RcppParallel for integrated market and default risk modeling

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/RiccardoPorreca.pdf>
- Local: `./_cache/files/2017/2017__riccardo_porreca.pdf`
- Talk type: Lightning
- Time slot: 14:55 - 15:07

## Topics
- credit default simulation
- Monte Carlo methods
- parallel computing
- risk modeling
- financial portfolio analysis

## Methods
- Monte Carlo simulation
- TRNG (parallel random number generator)
- RcppParallel for parallel execution
- integrated market and default risk model

## Datasets used
*(none extracted)*

## Code & tools
- `TRNG`
- `RcppParallel`
- `rTRNG`
- PortfolioRiskMC (GitHub repository)
- R (with Rcpp integration)

## Key findings
- TRNG enables parallel Monte Carlo simulations with exact reproducibility and jump/split capabilities  
  > TRNG: 'state of the art C++ pseudo-random number generator library for sequential and parallel Monte Carlo simulations' [H. Bauke, http://numbercrunch.de/trng]
- Sub-portfolio simulations can be performed without re-simulating entire portfolios  
  > All this achieved without re-simulating the whole BBB portfolio!
- Parallel execution via RcppParallel achieves significant speed improvements  
  > microbenchmark results (M = 1000, K = 10) number of parallel threads

## Applications
- risk management
- portfolio analysis
- stress testing

## References cited
- H. Bauke, http://numbercrunch.de/trng

## See also
- [`years/2017.md`](../years/2017.md)
- [`speakers/riccardo_porreca.md`](../speakers/riccardo_porreca.md)
- [`methods/monte_carlo_simulation.md`](../methods/monte_carlo_simulation.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

