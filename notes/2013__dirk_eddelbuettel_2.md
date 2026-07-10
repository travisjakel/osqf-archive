---
type: Talk
title: RcppArmadilloAccelerating R with High-Performance C++ Linear Algebra
description: RcppArmadillo accelerates R by integrating high-performance C++ linear algebra libraries for statistical computing.
timestamp: "2026-07-08T00:00:00Z"
year: 2013
date: ~
speaker: Dirk Eddelbuettel
speaker_slug: dirk_eddelbuettel
talk_type: Talk
time_slot: "13:20 - 13:40"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/DirkEddelbuettel.pdf"
file_local: "./_cache/files/2013/2013__dirk_eddelbuettel_2.pdf"
slug: 2013__dirk_eddelbuettel_2
status: archived
tags: [osqf, 2013, dirk_eddelbuettel]
---

# RcppArmadilloAccelerating R with High-Performance C++ Linear Algebra

_2013 · Dirk Eddelbuettel_

**Headline:** RcppArmadillo accelerates R by integrating high-performance C++ linear algebra libraries for statistical computing.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/DirkEddelbuettel.pdf>
- Local: `./_cache/files/2013/2013__dirk_eddelbuettel_2.pdf`
- Talk type: Talk
- Time slot: 13:20 - 13:40

## Topics
- C++ linear algebra integration
- RcppArmadillo performance
- Kalman filter implementation
- statistical computing with C++

## Methods
- C++ linear algebra operations
- Rcpp interface
- Kalman filter implementation

## Datasets used
*(none extracted)*

## Code & tools
- `RcppArmadillo`
- `Rcpp`
- `Armadillo`
- R

## Key findings
- Armadillo's delayed evaluation reduces temporary memory usage through compile-time optimizations.  
  > A delayed evaluation approach is employed (at compile-time) to combine several operations into one and reduce (or eliminate) the need for temporaries.
- RcppArmadillo achieves 66x speed improvement over R for Kalman filter computations.  
  > Even byte-compiled 'better' Rversion is 66 times slower: ... KalmanCpp(pos) 100 0.087 1.0000 ... KalmanRC(pos) 100 5.774 66.3678

## Applications
- statistical computing
- time-series analysis
- financial modeling

## References cited
- Sanderson (2010) technical report
- Rcpp book

## See also
- [`years/2013.md`](../years/2013.md)
- [`speakers/dirk_eddelbuettel.md`](../speakers/dirk_eddelbuettel.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=50% (1/2), source=ocr(paddle)*

