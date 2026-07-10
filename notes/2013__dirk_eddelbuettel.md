---
type: Talk
title: Example-driven Introduction to Rcpp
description: "Rcpp enables seamless integration of C++ with R, demonstrated through performance comparisons and example implementations."
timestamp: "2026-07-08T00:00:00Z"
year: 2013
date: ~
speaker: Dirk Eddelbuettel
speaker_slug: dirk_eddelbuettel
talk_type: Tutorial
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/workshop/DirkEddelbuettel.pdf"
file_local: "./_cache/files/2013/2013__dirk_eddelbuettel.pdf"
slug: 2013__dirk_eddelbuettel
status: archived
tags: [osqf, 2013, dirk_eddelbuettel, rcpp_integration]
---

# Example-driven Introduction to Rcpp

_2013 · Dirk Eddelbuettel_

**Headline:** Rcpp enables seamless integration of C++ with R, demonstrated through performance comparisons and example implementations.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/workshop/DirkEddelbuettel.pdf>
- Local: `./_cache/files/2013/2013__dirk_eddelbuettel.pdf`
- Talk type: Tutorial

## Topics
- Rcpp integration
- performance optimization
- C++ and R type mapping
- example-driven programming
- R package development with Rcpp

## Methods
- Rcpp sugar for vectorized operations
- using cppFunction and sourceCpp for C++ integration
- STL type mapping
- Armadillo for linear algebra

## Datasets used
*(none extracted)*

## Code & tools
- `Rcpp`
- `RcppArmadillo`
- `RInside`
- `BH`
- `rbenchmark`
- R
- `RStudio`

## Key findings
- C++ implementations via Rcpp achieve significant speed gains over pure R code (e.g., 600x faster for Fibonacci sequence calculation).  
  > A nice 600-fold gain.
- Rcpp provides seamless type mapping between R and C++ objects, including support for STL containers and Armadillo matrices.  
  > This uses implicit conversion via as<> and wrap - cf package vignette Rcpp-extending.
- Rcpp sugar allows writing compact C++ code that mirrors R's vectorized operations.  
  > The code is essentially identical.

## Applications
- statistical computing
- R package development
- performance optimization in R

## References cited
- John Chambers' talk at Stanford in October 2010; personal correspondence.

## See also
- [`years/2013.md`](../years/2013.md)
- [`speakers/dirk_eddelbuettel.md`](../speakers/dirk_eddelbuettel.md)
- [`topics/rcpp_integration.md`](../topics/rcpp_integration.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

