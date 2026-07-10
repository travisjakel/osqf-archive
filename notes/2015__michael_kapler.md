---
type: Talk
title: "Follow the Leader - the application of time-lag series analysis to discover leaders in S&P 500"
description: "Using time-lag correlation analysis to identify leading stocks in the S&P 500 through graph-based PageRank scoring"
timestamp: "2026-07-08T00:00:00Z"
year: 2015
date: ~
speaker: Michael Kapler
speaker_slug: michael_kapler
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/MichaelKapler.pdf"
file_local: "./_cache/files/2015/2015__michael_kapler.pdf"
slug: 2015__michael_kapler
status: archived
tags: [osqf, 2015, michael_kapler]
---

# Follow the Leader - the application of time-lag series analysis to discover leaders in S&P 500

_2015 · Michael Kapler_

**Headline:** Using time-lag correlation analysis to identify leading stocks in the S&P 500 through graph-based PageRank scoring

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/MichaelKapler.pdf>
- Local: `./_cache/files/2015/2015__michael_kapler.pdf`
- Talk type: Lightning

## Topics
- time-lag series analysis
- leadership discovery
- S&P 500
- graph algorithms
- portfolio management

## Methods
- lagged correlation analysis
- PageRank algorithm
- weighted directed graph construction

## Datasets used
- S&P 500

## Code & tools
- Rcpp Parallel
- R

## Key findings
- Leadership discovery using PageRank on lagged correlation graphs outperformed equal-weighted timing strategies  
  > leader.pagerank 7.07 vs ew.timing 6.83 annualized return 2000-2015
- Consistent 100 leaders identified yearly using 120-day lagged correlations  
  > Year | Number of Leaders | Number of SMA 2000 | 100 | 100 ... 2015 | 100 | 100
- Computational complexity required 37.7 billion operations for full S&P 500 analysis  
  > 124,750 * 120 * 2,520 = 37,724,400,000

## Applications
- leadership index construction
- portfolio timing strategies

## References cited
- Detecting Leaders from Correlated Time Series by D. Wu et al.
- Time-lag Method for Detecting Following and Leadership Behavior... 2013

## See also
- [`years/2015.md`](../years/2015.md)
- [`speakers/michael_kapler.md`](../speakers/michael_kapler.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3), source=ocr(paddle)*

