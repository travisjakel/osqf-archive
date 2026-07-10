---
type: Talk
title: "dtts: Time-series functionality based on nanotime and data.table"
description: "dtts provides nanosecond-resolution time-series functionality using data.table and nanotime, with flexible alignment concepts for financial data analysis."
timestamp: "2026-07-08T00:00:00Z"
year: 2023
date: ~
speaker: Leonardo Silvestri
speaker_slug: leonardo_silvestri
talk_type: Talk
time_slot: "16:06 - 16:26"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2023/LeonardoSilvestri.pdf"
file_local: "./_cache/files/2023/2023__leonardo_silvestri.pdf"
slug: 2023__leonardo_silvestri
status: archived
tags: [osqf, 2023, leonardo_silvestri, time_series_data_handling]
---

# dtts: Time-series functionality based on nanotime and data.table

_2023 · Leonardo Silvestri_

**Headline:** dtts provides nanosecond-resolution time-series functionality using data.table and nanotime, with flexible alignment concepts for financial data analysis.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2023/LeonardoSilvestri.pdf>
- Local: `./_cache/files/2023/2023__leonardo_silvestri.pdf`
- Talk type: Talk
- Time slot: 16:06 - 16:26

## Topics
- time-series data handling
- nanosecond resolution
- alignment methods
- financial data adjustments

## Methods
- data.table integration
- nanotime-based timestamping
- grid_align function
- frequency calculation
- custom alignment functions

## Datasets used
*(none extracted)*

## Code & tools
- `data.table`
- `nanotime`
- `dtts`

## Key findings
- nanotime resolves issues with POSIXct's microsecond precision and rounding errors  
  > nanotime is implemented as 64-bit integer
- dtts enables alignment of time-series onto arbitrary time grids  
  > Alignment of a time-series (ts1) onto a vector of time (t2)
- Custom functions can be applied during alignment for statistical analysis  
  > invoke a function on the defined segment of ts1

## Applications
- financial time-series analysis
- dividend/split adjustments
- futures contract joins

## References cited
*(none extracted)*

## See also
- [`years/2023.md`](../years/2023.md)
- [`speakers/leonardo_silvestri.md`](../speakers/leonardo_silvestri.md)
- [`topics/time_series_data_handling.md`](../topics/time_series_data_handling.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

