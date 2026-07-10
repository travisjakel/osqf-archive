---
type: Talk
title: The rTrawl Package for Modeling High Frequency Financial Time Series
description: Introduction to the rTrawl R package for modeling high-frequency financial time series data.
timestamp: "2026-07-08T00:00:00Z"
year: 2018
date: ~
speaker: Dries Cornilly
speaker_slug: dries_cornilly
talk_type: Talk
time_slot: "14:00 - 14:20"
file_format: pptx
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/DriesCornilly.pptx"
file_local: "./_cache/files/2018/2018__dries_cornilly.pptx"
slug: 2018__dries_cornilly
status: archived
tags: [osqf, 2018, dries_cornilly]
---

# The rTrawl Package for Modeling High Frequency Financial Time Series

_2018 · Dries Cornilly (KU Leuven)_

**Headline:** Introduction to the rTrawl R package for modeling high-frequency financial time series data.

## Source
- File format: `pptx`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/DriesCornilly.pptx>
- Local: `./_cache/files/2018/2018__dries_cornilly.pptx`
- Talk type: Talk
- Time slot: 14:00 - 14:20

## Topics
- high-frequency financial time series modeling
- statistical packages in R
- autocorrelation analysis

## Methods
- autocorrelation analysis (ACF)
- realized variance calculation
- variance signature plotting

## Datasets used
*(none extracted)*

## Code & tools
- rTrawl package
- R programming language

## Key findings
- The variance signature plot uses realized variance calculated as RV(n) = ∑(P_kδn - P_{k-1}δn)^2 / δn.  
  > RV (n) = ∑ n (P kδn - P (k-1)δn ) 2 , δn = T
- Autocorrelation decays rapidly with shorter time intervals (e.g., 0.01 seconds vs. 1 second).  
  > ACF - 0.01 seconds lag Autocorrelation

## Applications
- financial time series analysis
- high-frequency trading
- volatility forecasting

## References cited
*(none extracted)*

## See also
- [`years/2018.md`](../years/2018.md)
- [`speakers/dries_cornilly.md`](../speakers/dries_cornilly.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (2/2), source=ocr(paddle)*

