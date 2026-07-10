---
type: Talk
title: Lock-In Avoidance and Quality Assurance
description: Paul Gilbert discusses strategies for avoiding lock-in to legacy systems and ensuring quality in R-based financial data workflows.
timestamp: "2026-07-08T00:00:00Z"
year: 2012
date: ~
speaker: Paul Gilbert
speaker_slug: paul_gilbert
talk_type: Keynote
time_slot: "10:30 - 11:20"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2012/talk/PaulGilbert.pdf"
file_local: "./_cache/files/2012/2012__paul_gilbert.pdf"
slug: 2012__paul_gilbert
status: archived
tags: [osqf, 2012, paul_gilbert]
---

# Lock-In Avoidance and Quality Assurance

_2012 · Paul Gilbert (No Fixed Affiliation)_

**Headline:** Paul Gilbert discusses strategies for avoiding lock-in to legacy systems and ensuring quality in R-based financial data workflows.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2012/talk/PaulGilbert.pdf>
- Local: `./_cache/files/2012/2012__paul_gilbert.pdf`
- Talk type: Keynote
- Time slot: 10:30 - 11:20

## Topics
- Lock-In Avoidance
- Quality Assurance
- Time Series Data Management
- R Package Development

## Methods
- tframe time series abstraction
- setRNG random number generation control
- PADI vendor API abstraction
- TSdbi standardized database interface

## Datasets used
*(none extracted)*

## Code & tools
- `setRNG`
- `tframe`
- `padi`
- `TSdbi`
- `TSfame`
- `TSpadi`
- `TSMySQL`
- `quantmod`
- `tseries`
- `gdata`
- `RCurl`
- `XML`
- `tfplot`
- `TSgetSymbol`
- `TShistQuote`
- `TScompare`

## Key findings
- tframe enables consistent time series handling across multiple R time series classes  
  > ts, mts, zoo, xts, its, tis, timeSeries
- PADI abstracts vendor-specific database APIs for easier replacement  
  > PADI server wraps vendor’s API, client uses only PADI API
- TSdbi provides standardized time series database interface  
  > led to standardized time series database interface (TSdbi)
- setRNG ensures reproducible random number generation  
  > utilities to record / set seed and other RNG information

## Applications
- Financial data management
- Economic data analysis
- Cross-vendor system integration

## References cited
*(none extracted)*

## See also
- [`years/2012.md`](../years/2012.md)
- [`speakers/paul_gilbert.md`](../speakers/paul_gilbert.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (4/4), source=ocr(paddle)*

