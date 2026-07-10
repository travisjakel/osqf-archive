---
type: Talk
title: R/QuantLib Integration
description: "Presentation on integrating R with QuantLib for quantitative finance using SWIG, Rcpp, and RInside."
timestamp: "2026-07-08T00:00:00Z"
year: 2013
date: ~
speaker: Klaus Spanderen
speaker_slug: klaus_spanderen
talk_type: Talk
time_slot: "13:40 - 14:00"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/KlausSpanderen.pdf"
file_local: "./_cache/files/2013/2013__klaus_spanderen.pdf"
slug: 2013__klaus_spanderen
status: archived
tags: [osqf, 2013, klaus_spanderen]
---

# R/QuantLib Integration

_2013 · Klaus Spanderen_

**Headline:** Presentation on integrating R with QuantLib for quantitative finance using SWIG, Rcpp, and RInside.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/KlausSpanderen.pdf>
- Local: `./_cache/files/2013/2013__klaus_spanderen.pdf`
- Talk type: Talk
- Time slot: 13:40 - 14:00

## Topics
- R/QuantLib integration
- quantitative finance libraries
- interoperability between R and C++

## Methods
- SWIG interface layer
- Rcpp integration
- RInside embedding
- Quasi-Monte-Carlo with Brownian Bridges
- stochastic volatility model calibration

## Datasets used
*(none extracted)*

## Code & tools
- R
- C++
- `QuantLib`
- `SWIG`
- `Rcpp`
- `RInside`
- `RQuantLib`
- `inline`
- `Boost`

## Key findings
- QuantLib's SWIG interface enables R integration via generated glue code.  
  > The SWIG tool will generate the glue code between C++ and the target languages.
- Rcpp simplifies C++ code integration in R with STL-like data exchange.  
  > Data exchange between R and C++ is simple, flexible and supports STL-like idioms.
- RQuantLib package exposes QuantLib functionality to R using Rcpp.  
  > RQuantLib is the easiest way to start with QuantLib in R.
- Brownian Bridges improve Quasi-Monte-Carlo efficiency for high-dimensional problems.  
  > Brownian Bridges are a useful tool to use Quasi-Monte-Carlo methods for high dimensional problems.

## Applications
- option pricing
- risk management
- model calibration

## References cited
- Accelerating Exotic Option Pricing and Model Calibration Using GPUs, Bernemann et al (WHPCF 2010)
- More Mathematical Finance, Mark Joshi

## See also
- [`years/2013.md`](../years/2013.md)
- [`speakers/klaus_spanderen.md`](../speakers/klaus_spanderen.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (4/4), source=ocr(paddle)*

