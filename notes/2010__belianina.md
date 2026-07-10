---
type: Talk
title: Data Management Challenges for Quantitative Research
description: Data management challenges in quantitative research and solutions using OneTick and R for market data processing.
timestamp: "2026-07-08T00:00:00Z"
year: 2010
date: ~
speaker: Belianina
speaker_slug: belianina
talk_type: Talk
time_slot: "13:30 - 14:00"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2010/MariaBelianina.pdf"
file_local: "./_cache/files/2010/2010__belianina.pdf"
slug: 2010__belianina
status: archived
tags: [osqf, 2010, belianina]
---

# Data Management Challenges for Quantitative Research

_2010 · Belianina (Director, Pre-Sales Engineering Support)_

**Headline:** Data management challenges in quantitative research and solutions using OneTick and R for market data processing.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2010/MariaBelianina.pdf>
- Local: `./_cache/files/2010/2010__belianina.pdf`
- Talk type: Talk
- Time slot: 13:30 - 14:00

## Topics
- Data management
- Market data challenges
- R integration
- Quantitative research tools

## Methods
- Data preprocessing
- R analytics
- OneTick query integration
- Real-time event processing

## Datasets used
*(none extracted)*

## Code & tools
- R
- `OneTick`
- ODBC Driver
- `SQL`
- acf (R function)

## Key findings
- Increasing data granularity (nano/picoseconds) and volumes pose storage/processing challenges.  
  > Increasing data granularity
 Daily to intraday
 Milli → Micro → Nano → Picoseconds...
- OneTick provides in-memory databases and CEP engines for real-time analysis.  
  > In-memory database for intraday ticks
Complex Event Processing (CEP) engine for real time analysis
- Two integration methods enable R ↔ OneTick data flow: queries to R and R functions in OneTick.  
  > Integration Method 1: ONETICK QUERY RESULTS → BACK TO R
Integration Method 2: ONETICK QUERY R FUNCTIONS
- R functions like acf() can be embedded in OneTick queries for statistical analysis.  
  > R Function: acf, an autocorrelation function

## Applications
- Quantitative research
- Market data analytics
- Real-time trading signals

## References cited
*(none extracted)*

## See also
- [`years/2010.md`](../years/2010.md)
- [`speakers/belianina.md`](../speakers/belianina.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=75% (3/4), source=ocr(paddle)*

