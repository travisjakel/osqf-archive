---
type: Talk
title: The Complementarity of Trend Following and Relative Sentiment
description: "The talk investigates how trend following and relative sentiment strategies complement each other, showing that their combination improves performance during market drawdowns and uptrends."
timestamp: "2026-07-08T00:00:00Z"
year: 2023
date: ~
speaker: Raymond Micaletti
speaker_slug: raymond_micaletti
talk_type: Talk
time_slot: "13:05 - 13:25"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2023/RaymondMicaletti.pdf"
file_local: "./_cache/files/2023/2023__raymond_micaletti.pdf"
slug: 2023__raymond_micaletti
status: archived
tags: [osqf, 2023, raymond_micaletti, trend_following]
---

# The Complementarity of Trend Following and Relative Sentiment

_2023 · Raymond Micaletti (Relative Sentiment Technologies, LLC)_

**Headline:** The talk investigates how trend following and relative sentiment strategies complement each other, showing that their combination improves performance during market drawdowns and uptrends.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2023/RaymondMicaletti.pdf>
- Local: `./_cache/files/2023/2023__raymond_micaletti.pdf`
- Talk type: Talk
- Time slot: 13:05 - 13:25

## Topics
- trend following
- relative sentiment
- tactical asset allocation
- time-series momentum
- market timing
- wealth management

## Methods
- 50-50 combination of trend following and relative sentiment strategies
- analysis of drawdown periods (10%+ since 1994)
- composite relative sentiment indicator (COT reports, Sentix, cross-asset data)
- comparison to perfect-foresight switching strategy

## Datasets used
- CFTC Commitments of Traders (COT) data
- Sentix survey data
- Kenneth R. French Data Library
- Tiingo
- ICE
- Nasdaq

## Code & tools
- R packages: marketometry, backtest, runFuns
- functions: updateCOTData(), parseCOTData(), getCOTData(), writeCOTData()
- `data.table`
- `readxl`

## Key findings
- Relative sentiment compensates for trend following's weakness of staying in markets too long after peaks and staying out too long after troughs.  
  > relative sentiment tends to compensate for trend following's two major weaknesses (namely, staying in the market too long after the market has peaked and staying out of the market too long after the market has bottomed)
- A 50-50 combination of the strategies has thinner tails and lower tracking error compared to either strategy alone.  
  > a 50-50 combination... has a return distribution with thinner tails, and exhibits a lower tracking error to a hypothetical (perfect-foresight) strategy
- Relative sentiment outperforms during drawdowns while trend following outperforms during strong uptrends.  
  > RS outperformed TF on the way down and (so far) on the way back up

## Applications
- tactical asset allocation
- wealth management

## References cited
- Micaletti (2022) SSRN: https://ssrn.com/abstract=4235609
- Hsu and Kalesnik (2014) 'Finding Smart Beta in the Factor Zoo'

## See also
- [`years/2023.md`](../years/2023.md)
- [`speakers/raymond_micaletti.md`](../speakers/raymond_micaletti.md)
- [`topics/trend_following.md`](../topics/trend_following.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

