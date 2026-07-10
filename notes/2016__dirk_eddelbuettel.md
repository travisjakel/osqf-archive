---
type: Talk
title: Introduction to Rcpp and RcppArmadillo
description: Tutorial on using Rcpp and RcppArmadillo for integrating C++ with R
timestamp: "2026-07-08T00:00:00Z"
year: 2016
date: ~
speaker: Dirk Eddelbuettel
speaker_slug: dirk_eddelbuettel
talk_type: Tutorial
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/workshop/DirkEddelbuettel.pdf"
file_local: "./_cache/files/2016/2016__dirk_eddelbuettel.pdf"
slug: 2016__dirk_eddelbuettel
status: archived
tags: [osqf, 2016, dirk_eddelbuettel, rcpp_integration]
---

# Introduction to Rcpp and RcppArmadillo

_2016 · Dirk Eddelbuettel (Ketchum Trading, Debian, and R Projects)_

**Headline:** Tutorial on using Rcpp and RcppArmadillo for integrating C++ with R

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/workshop/DirkEddelbuettel.pdf>
- Local: `./_cache/files/2016/2016__dirk_eddelbuettel.pdf`
- Talk type: Tutorial

## Topics
- Rcpp integration
- RcppArmadillo usage
- C++ in R
- Performance optimization
- Package development with Rcpp
- STL and Boost integration

## Methods
- Rcpp::export
- STL transform
- Boost integration
- parallel matrix transformation
- Rcpp sugar syntax

## Datasets used
*(none extracted)*

## Code & tools
- `Rcpp`
- `RcppArmadillo`
- `RcppParallel`
- `RcppMLPACK`
- `BH`
- `STL`
- `RcppEigen`
- `RcppGSL`

## Key findings
- C++ implementation of Fibonacci function showed orders-of-magnitude speed gains over R  
  > A nice gain of a few orders of magnitude.
- Rcpp is used by 667 CRAN packages and 72 BioConductor packages  
  > Rcpp is currently used by 667 CRAN packages
- Rcpp sugar enables compact C++ code with R-like syntax  
  > The code is essentially identical.

## Applications
- speed optimization in R functions
- package development
- parallel computing
- financial modeling with RcppArmadillo

## References cited
- Seamless R and C++ Integration with Rcpp (book)
- Rcpp and RcppEigen in J Stat Software
- RcppArmadillo in Comp Stat & Data Analys

## See also
- [`years/2016.md`](../years/2016.md)
- [`speakers/dirk_eddelbuettel.md`](../speakers/dirk_eddelbuettel.md)
- [`topics/rcpp_integration.md`](../topics/rcpp_integration.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

