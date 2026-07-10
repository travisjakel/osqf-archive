---
type: Talk
title: "Achieving High-Performing, Simulation-Based Operational Risk Measurement with R and RevoScaleR"
description: Operational risk measurement using R and RevoScaleR with Monte Carlo simulations and parallelization techniques.
timestamp: "2026-07-08T00:00:00Z"
year: 2012
date: ~
speaker: Humke
speaker_slug: humke
talk_type: Lightning
time_slot: "16:50 - 17:02"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2012/talk/DavidHumke.pdf"
file_local: "./_cache/files/2012/2012__humke.pdf"
slug: 2012__humke
status: archived
tags: [osqf, 2012, humke, operational_risk, monte_carlo_simulation]
---

# Achieving High-Performing, Simulation-Based Operational Risk Measurement with R and RevoScaleR

_2012 · Humke (Northern Trust Corporation)_

**Headline:** Operational risk measurement using R and RevoScaleR with Monte Carlo simulations and parallelization techniques.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2012/talk/DavidHumke.pdf>
- Local: `./_cache/files/2012/2012__humke.pdf`
- Talk type: Lightning
- Time slot: 16:50 - 17:02

## Topics
- operational risk
- Monte Carlo simulation
- parallel computing
- R/RevoScaleR
- Basel II
- Loss Distribution Approach (LDA)

## Methods
- Monte Carlo Simulation
- Poisson distribution
- parametric distribution fitting
- parallelization (doSMP, doSNOW, doRSR)
- 32/64-bit R version comparison

## Datasets used
*(none extracted)*

## Code & tools
- R
- `RevoScaleR`
- `doSMP`
- `doSNOW`
- `doRSR`
- `actuar`
- `GAMLSS`

## Key findings
- Parallelization significantly improves simulation performance with linear time scaling.  
  > Elapsed time is linear in # of iterations
- 64-bit R shows marginal performance improvements over 32-bit.  
  > 64bit marginally better that 32bit
- RevoScaleR's parallelization scales across cluster resources.  
  > Revolution Analytics’ parallization routines are scalable

## Applications
- operational risk measurement
- risk management

## References cited
- Risk-Based Capital Standards: Advanced Capital Adequacy Framework – Basel II; Final Rule (2007)

## See also
- [`years/2012.md`](../years/2012.md)
- [`speakers/humke.md`](../speakers/humke.md)
- [`topics/operational_risk.md`](../topics/operational_risk.md)
- [`methods/monte_carlo_simulation.md`](../methods/monte_carlo_simulation.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3)*

