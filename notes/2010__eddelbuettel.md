---
type: Talk
title: Rcpp / RinsideExtending and Embedding R with C
description: Tutorial on extending and embedding R with C++ using Rcpp and RInside for high-performance computing
timestamp: "2026-07-08T00:00:00Z"
year: 2010
date: ~
speaker: Eddelbuettel
speaker_slug: eddelbuettel
talk_type: Tutorial
time_slot: "09:00 - 10:00"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2010/DirkEddelbuettel_Tutorial.pdf"
file_local: "./_cache/files/2010/2010__eddelbuettel.pdf"
slug: 2010__eddelbuettel
status: archived
tags: [osqf, 2010, eddelbuettel]
---

# Rcpp / RinsideExtending and Embedding R with C

_2010 · Eddelbuettel (Debian & R)_

**Headline:** Tutorial on extending and embedding R with C++ using Rcpp and RInside for high-performance computing

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2010/DirkEddelbuettel_Tutorial.pdf>
- Local: `./_cache/files/2010/2010__eddelbuettel.pdf`
- Talk type: Tutorial
- Time slot: 09:00 - 10:00

## Topics
- Extending R with C++
- Rcpp package usage
- Embedding R in C++ applications
- Performance optimization
- Inline code integration

## Methods
- .C and .Call interfaces
- inline package for embedding code
- Rcpp for C++ integration
- convolution examples
- linear regression with GSL and Armadillo

## Datasets used
*(none extracted)*

## Code & tools
- `Rcpp`
- `RInside`
- `inline`
- GSL (GNU Scientific Library)
- `Armadillo`
- R

## Key findings
- Rcpp simplifies C++ integration with R by automating low-level SEXP handling  
  > Rcpp makes it easier to interface C++ and R code. Using the .Call interface, we can use features of the C++ language to automate the tedious bits of the macro-based C-level interface to R.
- Rcpp's new API reduces boilerplate code compared to traditional .Call methods  
  > The new Rcpp API allows implicit type conversion and STL container support, reducing the need for explicit SEXP manipulation.
- Rcpp implementations show 1-11x speed improvements over base R for convolution operations  
  > Table 1: Performance for convolution example shows NumericVector::begin implementation at 33ms (1.0x relative to R API)

## Applications
- High-performance statistical computing
- Financial modeling
- Large-scale regression analysis

## References cited
- Chambers (2008) Software for Data Analysis: Programming with R

## See also
- [`years/2010.md`](../years/2010.md)
- [`speakers/eddelbuettel.md`](../speakers/eddelbuettel.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3), source=ocr(paddle)*

