---
type: Talk
title: Fast and Flexible Technical Analysis with TTR
description: "The TTR package provides extensive, flexible, and fast technical analysis tools for R, supporting various time-series classes and using compiled code for performance."
timestamp: "2026-07-08T00:00:00Z"
year: 2010
date: ~
speaker: Ulrich
speaker_slug: ulrich
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2010/JoshUlrich.pdf"
file_local: "./_cache/files/2010/2010__ulrich.pdf"
slug: 2010__ulrich
status: archived
tags: [osqf, 2010, ulrich]
---

# Fast and Flexible Technical Analysis with TTR

_2010 · Ulrich_

**Headline:** The TTR package provides extensive, flexible, and fast technical analysis tools for R, supporting various time-series classes and using compiled code for performance.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2010/JoshUlrich.pdf>
- Local: `./_cache/files/2010/2010__ulrich.pdf`
- Talk type: Lightning

## Topics
- technical analysis
- R package development
- time-series data handling
- performance optimization in R

## Methods
- compiled code (C)
- customizable moving average types (WMA, EMA)
- xts/zoo/timeSeries class handling

## Datasets used
*(none extracted)*

## Code & tools
- R
- `TTR`
- `xts`
- `zoo`
- `timeSeries`
- C

## Key findings
- TTR implements over 50 technical indicators with customizable parameters  
  > Over 50 technical analysis indicators
- Custom RSI calculations demonstrate flexible parameterization  
  > rsi <- RSI(price, n=14, maType="WMA", wts=volume)
- C-compiled functions achieve 300x speed improvements on large datasets  
  > user system elapsed 0.004   0.000   0.006

## Applications
- quantitative finance
- algorithmic trading
- financial data analysis

## References cited
*(none extracted)*

## See also
- [`years/2010.md`](../years/2010.md)
- [`speakers/ulrich.md`](../speakers/ulrich.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3)*

