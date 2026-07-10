---
type: Talk
title: Exploring Trading System Expectation
description: "A presentation on using R for trading system analysis, focusing on strategy evaluation, performance metrics, and visualization techniques."
timestamp: "2026-07-08T00:00:00Z"
year: 2014
date: ~
speaker: Kent Hoxsey
speaker_slug: kent_hoxsey
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/KentHoxsey.pdf"
file_local: "./_cache/files/2014/2014__kent_hoxsey.pdf"
slug: 2014__kent_hoxsey
status: archived
tags: [osqf, 2014, kent_hoxsey]
---

# Exploring Trading System Expectation

_2014 · Kent Hoxsey_

**Headline:** A presentation on using R for trading system analysis, focusing on strategy evaluation, performance metrics, and visualization techniques.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/KentHoxsey.pdf>
- Local: `./_cache/files/2014/2014__kent_hoxsey.pdf`
- Talk type: Lightning

## Topics
- trading system analysis
- R programming for finance
- performance metrics
- visualization techniques

## Methods
- MACD calculation
- signal thresholding
- log returns normalization
- boxplot analysis
- coplot visualization

## Datasets used
*(none extracted)*

## Code & tools
- `TTR`
- `getOrderBook`
- `tradeStats`
- `PortfReturns`
- `MACD`
- `sigThreshold`
- log returns
- `boxplot`
- `coplot`

## Key findings
- The talk demonstrates using MACD with signal thresholds to generate trading signals.  
  > signal.gt.zero <- sigThreshold('signal.gt.zero', macd, 'macd', relationship='gt', cross=TRUE)
- The presentation includes code for normalizing data as log returns and creating lag variables.  
  > new_col <- log(lag(x[,1],-i)) - log(x[,1])

## Applications
- strategy analysis
- performance evaluation

## References cited
*(none extracted)*

## See also
- [`years/2014.md`](../years/2014.md)
- [`speakers/kent_hoxsey.md`](../speakers/kent_hoxsey.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (2/2), source=ocr(paddle)*

