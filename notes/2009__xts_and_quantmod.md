---
type: Talk
title: Jeffrey Ryan
description: Leveraging R with xts and quantmod for quantitative trading
timestamp: "2026-07-08T00:00:00Z"
year: 2009
date: ~
speaker: xts/quantmod
speaker_slug: xts_and_quantmod
talk_type: ~
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2009/xts_quantmod_workshop.pdf"
file_local: "./_cache/files/2009/2009__xts_and_quantmod.pdf"
slug: 2009__xts_and_quantmod
status: archived
tags: [osqf, 2009, xts_and_quantmod]
---

# Jeffrey Ryan

_2009 · xts/quantmod (Insight Algo)_

**Headline:** Leveraging R with xts and quantmod for quantitative trading

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2009/xts_quantmod_workshop.pdf>
- Local: `./_cache/files/2009/2009__xts_and_quantmod.pdf`

## Topics
- time series management
- quantitative trading tools

## Methods
- binary search algorithm for subsetting
- ISO 8601 time-based indexing
- C-level optimization for merge operations

## Datasets used
*(none extracted)*

## Code & tools
- `xts`
- `quantmod`
- `zoo`
- `data.table`
- `POSIXct`
- R

## Key findings
- xts uses binary search for fast subsetting (0.006 sec for 10M observations)  
  > > system.time(x10m['20090323'])
user  system elapsed
0.006   0.001   0.006
- xts stores indexes as POSIX time for consistent behavior  
  > Internally all index values are represented in POSIX time (seconds since the epoch)
- quantmod's getSymbols supports multiple data sources including Yahoo, Oanda, and FRED  
  > getSymbols("USD/EUR", src="oanda")

## Applications
- quantitative modeling
- financial data analysis
- trading strategy development

## References cited
*(none extracted)*

## See also
- [`years/2009.md`](../years/2009.md)
- [`speakers/xts_and_quantmod.md`](../speakers/xts_and_quantmod.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

