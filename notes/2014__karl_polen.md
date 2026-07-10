---
type: Talk
title: Private Equity Performance Analytics Implemented in R
description: "Private equity performance analysis using R, focusing on IRR calculation, PME benchmarks, and Direct Alpha method."
timestamp: "2026-07-08T00:00:00Z"
year: 2014
date: ~
speaker: Karl Polen
speaker_slug: karl_polen
talk_type: Lightning
time_slot: "10:30 - 11:00"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/KarlPolen.pdf"
file_local: "./_cache/files/2014/2014__karl_polen.pdf"
slug: 2014__karl_polen
status: archived
tags: [osqf, 2014, karl_polen]
---

# Private Equity Performance Analytics Implemented in R

_2014 · Karl Polen_

**Headline:** Private equity performance analysis using R, focusing on IRR calculation, PME benchmarks, and Direct Alpha method.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/KarlPolen.pdf>
- Local: `./_cache/files/2014/2014__karl_polen.pdf`
- Talk type: Lightning
- Time slot: 10:30 - 11:00

## Topics
- Private equity performance analysis
- IRR calculation challenges
- PME benchmarks
- Direct Alpha method

## Methods
- Kaplan Schoar PME (KSPME)
- Direct Alpha calculation
- IRR polynomial root solving

## Datasets used
*(none extracted)*

## Code & tools
- `uniroot`
- `polyroot`
- R
- github.com/karlpolen/pme-calcs

## Key findings
- Traditional IRR calculations for PE are not comparable to public market TWR due to cash flow timing differences.  
  > IRRs calculated on PE cash flows are not comparable to time weighted returns ('TWR') on public markets investments
- KSPME compares PE performance to public markets by adjusting cash flows to a dividend-adjusted index.  
  > the numerator is the wealth you have from the distributions you receive from a PE as if invested in the public market index
- Direct Alpha converts KSPME outperformance into an annualized return measure.  
  > Direct Alpha is calculated as the IRR of a time series constructed by combining the future value adjusted calls

## Applications
- Private equity performance benchmarking
- Public market equivalent analysis

## References cited
- Oleg Gredil et al. (SSRN 2014)
- Kaplan and Schoar (Journal of Finance 2005)

## See also
- [`years/2014.md`](../years/2014.md)
- [`speakers/karl_polen.md`](../speakers/karl_polen.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

