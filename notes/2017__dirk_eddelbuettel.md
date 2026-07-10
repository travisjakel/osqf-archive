---
type: Talk
title: RcppFrom Simple Examples to Machine learning
description: "Introduction to Rcpp, highlighting its performance benefits, ease of integration with R, and applications in machine learning through examples."
timestamp: "2026-07-08T00:00:00Z"
year: 2017
date: ~
speaker: Dirk Eddelbuettel
speaker_slug: dirk_eddelbuettel
talk_type: Tutorial
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/workshop/DirkEddelbuettel.pdf"
file_local: "./_cache/files/2017/2017__dirk_eddelbuettel.pdf"
slug: 2017__dirk_eddelbuettel
status: archived
tags: [osqf, 2017, dirk_eddelbuettel]
---

# RcppFrom Simple Examples to Machine learning

_2017 · Dirk Eddelbuettel (Ketchum Trading; Debian and R Projects)_

**Headline:** Introduction to Rcpp, highlighting its performance benefits, ease of integration with R, and applications in machine learning through examples.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/workshop/DirkEddelbuettel.pdf>
- Local: `./_cache/files/2017/2017__dirk_eddelbuettel.pdf`
- Talk type: Tutorial

## Topics
- Rcpp integration with R
- Performance optimization
- Machine learning with Rcpp
- Package development with Rcpp

## Methods
- Rcpp::cppFunction for embedding C++ code
- STL algorithms in Rcpp
- C++11 features in Rcpp
- Linking with external libraries (MLPACK, Armadillo)

## Datasets used
- wine dataset
- trees dataset

## Code & tools
- `Rcpp`
- `RcppArmadillo`
- `RcppMLPACK`
- `RcppEigen`
- `RcppParallel`
- Boost (via BH)
- `RStudio`
- `sourceCpp`
- `evalCpp`
- `cppFunction`

## Key findings
- Rcpp allows significant performance improvements, as shown by the Fibonacci example where C++ was 232.8x faster than R.  
  > A nice gain of a few orders of magnitude.
- Rcpp simplifies integrating C++ with R, demonstrated by the simple odd/even function example.  
  > Rcpp::cppFunction(...) ... isOdd_cpp(42L) ## [1] FALSE
- The adoption of Rcpp has grown substantially, with 800 CRAN packages using it in 2017.  
  > 2017 | 800 | 8.5

## Applications
- Machine learning model implementation
- Performance-critical R package development
- Integration of C++ libraries into R

## References cited
- Dirk Eddelbuettel (2013). Seamless R and C++ Integration with Rcpp. UseR! 2013.

## See also
- [`years/2017.md`](../years/2017.md)
- [`speakers/dirk_eddelbuettel.md`](../speakers/dirk_eddelbuettel.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3), source=ocr(paddle)*

