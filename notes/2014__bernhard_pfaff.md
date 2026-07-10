---
type: Talk
title: The R package cccpSolving Cone Constrained Convex Programs
description: Introduction of the R package cccp for solving cone constrained convex programs with a focus on implementation details and dependencies.
timestamp: "2026-07-08T00:00:00Z"
year: 2014
date: ~
speaker: Bernhard Pfaff
speaker_slug: bernhard_pfaff
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/BernhardPfaff.pdf"
file_local: "./_cache/files/2014/2014__bernhard_pfaff.pdf"
slug: 2014__bernhard_pfaff
status: archived
tags: [osqf, 2014, bernhard_pfaff, convex_optimization, s4_classes_methods]
---

# The R package cccpSolving Cone Constrained Convex Programs

_2014 · Bernhard Pfaff (Invesco Asset Management GmbH)_

**Headline:** Introduction of the R package cccp for solving cone constrained convex programs with a focus on implementation details and dependencies.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/BernhardPfaff.pdf>
- Local: `./_cache/files/2014/2014__bernhard_pfaff.pdf`
- Talk type: Lightning

## Topics
- convex optimization
- R package development
- cone constrained programming

## Methods
- S4-classes/methods
- C++ integration
- log-barrier functions
- Nesterov-Todd scalings

## Datasets used
*(none extracted)*

## Code & tools
- `Matrix`
- `numDeriv`
- `Rcpp`
- `RcppEigen`
- `RUnit`
- `rbenchmark`

## Key findings
- Few R packages exist for cone-constrained convex programs.  
  > Only a few R packages available for solving convex problems with cone constraints...
- cccp uses S4-classes and C++ integration.  
  > Implementation in R with interface (module) to C++. Employment of S4-classes/methods...
- Dependencies include Matrix, RcppEigen, and numDeriv.  
  > Dependencies: Matrix, numDeriv, Rcpp, RcppEigen, and RUnit...

## Applications
- convex optimization with cone constraints

## References cited
- Andersen et al. (2011)
- Boyd and Vandenberghe (2009)
- Bates and Eddelbuettel (2013)
- Bates and Mächler (2013)
- Burger et al. (2010)
- Eddelbuettel (2013)
- Eddelbuettel and François (2011)
- Gilbert and Varadhan (2012)
- Kusnierczyk (2012)

## See also
- [`years/2014.md`](../years/2014.md)
- [`speakers/bernhard_pfaff.md`](../speakers/bernhard_pfaff.md)
- [`topics/convex_optimization.md`](../topics/convex_optimization.md)
- [`methods/s4_classes_methods.md`](../methods/s4_classes_methods.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3), source=ocr(paddle)*

