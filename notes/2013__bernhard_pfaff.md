---
type: Talk
title: Portfolio Selection with Probabilistic UtilityRevisited
description: Reinterpreting utility functions as log-densities and using Hybrid Monte Carlo for high-dimensional portfolio optimization.
timestamp: "2026-07-08T00:00:00Z"
year: 2013
date: ~
speaker: Bernhard Pfaff
speaker_slug: bernhard_pfaff
talk_type: Talk
time_slot: "11:45 - 12:05"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/BernhardPfaff.pdf"
file_local: "./_cache/files/2013/2013__bernhard_pfaff.pdf"
slug: 2013__bernhard_pfaff
status: archived
tags: [osqf, 2013, bernhard_pfaff, portfolio_selection]
---

# Portfolio Selection with Probabilistic UtilityRevisited

_2013 · Bernhard Pfaff (Invesco Asset Management GmbH Frankfurt am Main)_

**Headline:** Reinterpreting utility functions as log-densities and using Hybrid Monte Carlo for high-dimensional portfolio optimization.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/BernhardPfaff.pdf>
- Local: `./_cache/files/2013/2013__bernhard_pfaff.pdf`
- Talk type: Talk
- Time slot: 11:45 - 12:05

## Topics
- portfolio selection
- probabilistic utility
- Markov Chain Monte Carlo
- Hybrid Monte Carlo
- sensitivity analysis

## Methods
- Hybrid Monte Carlo (HMC)
- Markov Chain Monte Carlo (MCMC)
- Quadratic Utility Function
- Bayesian estimation

## Datasets used
- MultiAsset (FRAPO package, 2004:11 - 2011:11)

## Code & tools
- `FRAPO`
- `MASS`
- `numDeriv`
- `parallel`
- `compiler`
- `solve.QP`
- `hybridMC`
- `grad`
- `LUdens`
- CRAN Bayesian task view

## Key findings
- Probabilistic utility reinterprets traditional utility functions as log-probability densities.  
  > Utility function is interpreted as the logarithm of the probability density for a portfolio.
- Hybrid Monte Carlo achieves better convergence than standard MCMC.  
  > Faster convergence to equilibrium distribution. High acceptance rate, ideally all moves are accepted.
- Probabilistic utility avoids corner solutions common in mean-variance optimization.  
  > However, some arbitrariness with respect to ν, but in general corner-solutions as in MU-settings can be circumvented.

## Applications
- portfolio optimization
- risk management

## References cited
- Brooks et al. (2011)
- Duane et al. (1987)
- Gilks et al. (1995)
- Marschinski et al. (2007)
- Michaud (1989)
- Neal (2011)
- Pfaff (2012)
- Rossi et al. (2002)

## See also
- [`years/2013.md`](../years/2013.md)
- [`speakers/bernhard_pfaff.md`](../speakers/bernhard_pfaff.md)
- [`topics/portfolio_selection.md`](../topics/portfolio_selection.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

