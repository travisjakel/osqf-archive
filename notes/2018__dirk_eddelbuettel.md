---
type: Talk
title: RcppFrom Simple Examples to Machine Learning
description: "Introduction to Rcpp, covering performance improvements, integration with machine learning libraries, and practical examples from simple functions to complex algorithms."
timestamp: "2026-07-08T00:00:00Z"
year: 2018
date: ~
speaker: Dirk Eddelbuettel
speaker_slug: dirk_eddelbuettel
talk_type: Tutorial
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/DirkEddelbuettel.pdf"
file_local: "./_cache/files/2018/2018__dirk_eddelbuettel.pdf"
slug: 2018__dirk_eddelbuettel
status: archived
tags: [osqf, 2018, dirk_eddelbuettel, rcpp_integration]
---

# RcppFrom Simple Examples to Machine Learning

_2018 · Dirk Eddelbuettel (Debian / R Project / U of Illinois)_

**Headline:** Introduction to Rcpp, covering performance improvements, integration with machine learning libraries, and practical examples from simple functions to complex algorithms.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/DirkEddelbuettel.pdf>
- Local: `./_cache/files/2018/2018__dirk_eddelbuettel.pdf`
- Talk type: Tutorial

## Topics
- Rcpp integration
- performance optimization
- machine learning with Rcpp
- STL type mapping
- parallel processing
- package development

## Methods
- Rcpp functions (cppFunction, sourceCpp)
- STL algorithms
- RcppArmadillo for linear algebra
- RcppMLPACK for machine learning
- parallel processing with RcppParallel
- Boost integration via BH

## Datasets used
- wine (for K-means example)
- trees (for linear regression example)

## Code & tools
- `Rcpp`
- `RcppArmadillo`
- `RcppMLPACK`
- `RcppParallel`
- Boost via BH
- `STL`
- `dplyr`
- `ggplot2`
- `MASS`
- `Matrix`
- `zoo`
- `data.table`

## Key findings
- Rcpp enables significant speed improvements (e.g., C++ implementation of Fibonacci function was ~250x faster than R)  
  > A nice gain of a few orders of magnitude.
- Over 1300 CRAN packages use Rcpp as of 2018  
  > 1364 CRAN packages (with ~ 340 added since last year)
- RcppMLPACK's K-means implementation outperformed base R's kmeans by ~33.8x  
  > mlKmeans(t(wine), 3) 100 0.028 1.000 ... kmeans(wine, 3) 100 0.947 33.821

## Applications
- machine learning (K-means, linear/logistic regression, nearest neighbors)
- high-performance computing
- package development

## References cited
- Rcpp package vignettes
- MLPACK library documentation

## See also
- [`years/2018.md`](../years/2018.md)
- [`speakers/dirk_eddelbuettel.md`](../speakers/dirk_eddelbuettel.md)
- [`topics/rcpp_integration.md`](../topics/rcpp_integration.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

