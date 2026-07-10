---
type: Talk
title: Solutions from OneTick and R
description: "Integration of OneTick and R for Portfolio & Risk Analytics with real-time and historical data processing"
timestamp: "2026-07-08T00:00:00Z"
year: 2011
date: ~
speaker: Belianina
speaker_slug: belianina
talk_type: Talk
time_slot: ~
file_format: pptx
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2011/MariaBelianina.pptx"
file_local: "./_cache/files/2011/2011__belianina.pptx"
slug: 2011__belianina
status: archived
tags: [osqf, 2011, belianina]
---

# Solutions from OneTick and R

_2011 · Belianina (Pre-Sales Engineering Support, OneTick)_

**Headline:** Integration of OneTick and R for Portfolio & Risk Analytics with real-time and historical data processing

## Source
- File format: `pptx`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2011/MariaBelianina.pptx>
- Local: `./_cache/files/2011/2011__belianina.pptx`
- Talk type: Talk

## Topics
- Portfolio & Risk Analytics
- Real-time and Historical Data Processing
- R Integration for Financial Analytics
- Option Pricing Models
- Risk Management Applications

## Methods
- RQuantLib for option pricing
- OneTick's in-memory tick database
- Aggregation and filtering of time series data
- Integration via R API and event processors

## Datasets used
- NYSE TAQ historical data
- CME historical data
- Reuters real-time feeds
- Bloomberg real-time feeds

## Code & tools
- R
- `RQuantLib`
- OneTick API
- Python (for integration)

## Key findings
- OneTick and R integration enables option pricing using RQuantLib functions  
  > Call RQuantLib function AmericanOption(...) on each Map selected results back to the output tick.
- OneTick supports corporate actions adjustment in pricing calculations  
  > Optional: Apply corporate actions to the underlyers' prices
- R is used for post-processing and visualization of OneTick analytics  
  > Bring back to R on demand for plotting and further processing

## Applications
- Backtesting and quantitative research
- Risk and portfolio analytics
- High-frequency trading signal generation

## References cited
*(none extracted)*

## See also
- [`years/2011.md`](../years/2011.md)
- [`speakers/belianina.md`](../speakers/belianina.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

