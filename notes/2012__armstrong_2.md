---
type: Talk
title: CppBugsNative MCMC for R
description: "rcppbugs is an R package providing native MCMC sampling with C++ backend, offering faster alternatives to BUGS/JAGS for Bayesian modeling."
timestamp: "2026-07-08T00:00:00Z"
year: 2012
date: ~
speaker: Armstrong
speaker_slug: armstrong
talk_type: Talk
time_slot: "16:10 - 16:30"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2012/talk/WhitArmstrong.pdf"
file_local: "./_cache/files/2012/2012__armstrong_2.pdf"
slug: 2012__armstrong_2
status: archived
tags: [osqf, 2012, armstrong]
---

# CppBugsNative MCMC for R

_2012 · Armstrong (KLS Diversified Asset Management)_

**Headline:** rcppbugs is an R package providing native MCMC sampling with C++ backend, offering faster alternatives to BUGS/JAGS for Bayesian modeling.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2012/talk/WhitArmstrong.pdf>
- Local: `./_cache/files/2012/2012__armstrong_2.pdf`
- Talk type: Talk
- Time slot: 16:10 - 16:30

## Topics
- MCMC
- Bayesian inference
- R package development
- Performance optimization
- Statistical modeling

## Methods
- Random walk Metropolis
- Gibbs sampling
- Model specification in R
- C++ integration

## Datasets used
*(none extracted)*

## Code & tools
- `Rcpp`
- `Armadillo`
- `JAGS`
- `PyMC`
- `MCMCpack`

## Key findings
- rcppbugs achieves 186x speed improvement over JAGS in linear model benchmarks  
  > benchmark results
print(round(all.times.ratio, 4))
##             time   ratio
## rcppbugs   0.889   1.000
## jags     165.435 186.091
- The package uses random walk Metropolis with planned Gibbs within Metropolis support  
  > I   rcppbugs is a new package that attempts to provide a pure R alternative to
    using OpenBUGS/WinBUGS/JAGS for MCMC
I   it uses random walk Metropolis for sampling (Gibbs within Metropolis will be
    a future feature)
- Model specification remains in R while core is implemented in C++  
  > The core of the package is c++, but the model specification is in R

## Applications
- Statistical modeling
- Bayesian inference
- MCMC simulation

## References cited
- JAGS
- PyMC
- MCMCpack

## See also
- [`years/2012.md`](../years/2012.md)
- [`speakers/armstrong.md`](../speakers/armstrong.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3)*

