---
type: Talk
title: Getting the most out of RcppHigh-Performance C++ in Practice
description: "This talk discusses optimizing Rcpp for high-performance C++ in R, focusing on performance measurement, code optimization, and trade-offs in computational complexity."
timestamp: "2026-07-08T00:00:00Z"
year: 2016
date: ~
speaker: Matt Dziubinski
speaker_slug: matt_dziubinski
talk_type: Talk
time_slot: "15:25 - 15:45"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/MattDziubinski.pdf"
file_local: "./_cache/files/2016/2016__matt_dziubinski.pdf"
slug: 2016__matt_dziubinski
status: archived
tags: [osqf, 2016, matt_dziubinski, rcpp_optimization]
---

# Getting the most out of RcppHigh-Performance C++ in Practice

_2016 · Matt Dziubinski (Aalborg University / CREATES)_

**Headline:** This talk discusses optimizing Rcpp for high-performance C++ in R, focusing on performance measurement, code optimization, and trade-offs in computational complexity.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/MattDziubinski.pdf>
- Local: `./_cache/files/2016/2016__matt_dziubinski.pdf`
- Talk type: Talk
- Time slot: 15:25 - 15:45

## Topics
- Rcpp optimization
- performance measurement
- computational complexity
- algorithm efficiency
- trade-offs in software optimization

## Methods
- benchmarking
- doubling ratio experiments
- Rcpp integration
- algorithmic optimization
- microarchitectural analysis

## Datasets used
*(none extracted)*

## Code & tools
- `Rcpp`
- `RcppArmadillo`
- `RcppEigen`
- std::vector
- `Eigen`
- `Armadillo`
- `rbenchmark`
- `Boost`
- Intel® 64 Optimization Manual

## Key findings
- Eigen_Map outperforms other implementations due to efficient memory handling.  
  > sum_Eigen_Map(v) 100 0.64 1.000 0.64
- Pass-by-reference reduces overhead compared to pass-by-value.  
  > implicit conversions - costly copies - worth avoiding
- Algorithmic choices significantly impact performance (e.g., for loops vs. vectorized operations).  
  > sum_Rcpp_NumericVector_sugar faster than sum_Rcpp_NumericVector_for
- Microarchitectural features like cache behavior influence runtime.  
  > the cost of address translation and cache misses

## Applications
- high-performance computing in R
- optimizing numerical algorithms
- efficient data processing

## References cited
- Computer Architecture: A Quantitative Approach
- Algorithms (Sedgewick and Wayne)
- Lock-Free Approaches to Parallelizing Stochastic Gradient Descent
- Array Layouts for Comparison-Based Searching

## See also
- [`years/2016.md`](../years/2016.md)
- [`speakers/matt_dziubinski.md`](../speakers/matt_dziubinski.md)
- [`topics/rcpp_optimization.md`](../topics/rcpp_optimization.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=75% (3/4), source=ocr(paddle)*

