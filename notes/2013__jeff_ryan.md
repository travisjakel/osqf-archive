---
type: Talk
title: R Programming for Financial Data
description: "Tutorial on using R for financial data processing, focusing on data structures, abstraction layers, and tools like quantmod."
timestamp: "2026-07-08T00:00:00Z"
year: 2013
date: ~
speaker: Jeff Ryan
speaker_slug: jeff_ryan
talk_type: Tutorial
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/workshop/JeffRyan.pdf"
file_local: "./_cache/files/2013/2013__jeff_ryan.pdf"
slug: 2013__jeff_ryan
status: archived
tags: [osqf, 2013, jeff_ryan]
---

# R Programming for Financial Data

_2013 · Jeff Ryan (Lemnica)_

**Headline:** Tutorial on using R for financial data processing, focusing on data structures, abstraction layers, and tools like quantmod.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/workshop/JeffRyan.pdf>
- Local: `./_cache/files/2013/2013__jeff_ryan.pdf`
- Talk type: Tutorial

## Topics
- financial data handling
- R data structures
- abstraction layers
- quantmod package

## Methods
- creating abstraction layers
- using data.table/xts/mmap
- time-series data management

## Datasets used
*(none extracted)*

## Code & tools
- `data.table`
- `xts`
- `mmap`
- `quantmod`
- `getSymbols`

## Key findings
- Mapping raw data to research/production formats requires understanding both source data and R structures.  
  > The challenge is mapping from raw data sources into a format that is conducive to both research and production system.
- POSIXct is preferred for time handling due to its support for subseconds and time-zones.  
  > POSIXct objects in R allow for date and times. Supports subseconds and time-zones.
- Abstraction layers (e.g., quantmod) simplify data management by hiding source-specific implementation details.  
  > Make data management idiot-proof by providing a uniform interface to various data sources.

## Applications
- research data processing
- production system integration
- time-series analysis

## References cited
*(none extracted)*

## See also
- [`years/2013.md`](../years/2013.md)
- [`speakers/jeff_ryan.md`](../speakers/jeff_ryan.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3)*

