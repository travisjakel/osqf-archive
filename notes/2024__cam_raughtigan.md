---
type: Talk
title: Vol Targeting is Trendy
description: "Volatility targeting's alpha in equities is largely explained by trend following due to the leverage effect"
timestamp: "2026-07-08T00:00:00Z"
year: 2024
date: ~
speaker: Cam Raughtigan
speaker_slug: cam_raughtigan
talk_type: Talk
time_slot: "14:30 - 14:50"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2024/CamRaughtigan.pdf"
file_local: "./_cache/files/2024/2024__cam_raughtigan.pdf"
slug: 2024__cam_raughtigan
status: archived
tags: [osqf, 2024, cam_raughtigan, regression_analysis]
---

# Vol Targeting is Trendy

_2024 · Cam Raughtigan (Parametric Portfolio Associates)_

**Headline:** Volatility targeting's alpha in equities is largely explained by trend following due to the leverage effect

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2024/CamRaughtigan.pdf>
- Local: `./_cache/files/2024/2024__cam_raughtigan.pdf`
- Talk type: Talk
- Time slot: 14:30 - 14:50

## Topics
- volatility targeting
- trend following
- leverage effect
- equity alpha

## Methods
- regression analysis
- replication of Moreira-Muir (2017)
- simple trend strategy (Hurst et al 2013)

## Datasets used
- Fama-French Mkt-Rf series (1927-2023)
- 50 liquid futures contracts (2001-2023)

## Code & tools
- simple trend position calculation: (sign(R1m) + sign(R3m) + sign(R12m))/3

## Key findings
- A simple trend factor explains 62% of the alpha in volatility-targeted portfolios  
  > We replicate that and show a simple trend factor explains 62% of the alpha
- Volatility targeting's alpha is equivalent to 30% trend allocation  
  > Volatility targeting acts like Buy and hold, and... A 30% allocation to trend
- Equity VT alpha disappears when controlling for trend  
  > Regression alpha falls by 62%... No longer significant

## Applications
- equity volatility management
- risk parity strategies

## References cited
- Moreira and Muir (2017)
- Hurst et al (2013)
- Bollerslev (1986)
- Engle (1982)

## See also
- [`years/2024.md`](../years/2024.md)
- [`speakers/cam_raughtigan.md`](../speakers/cam_raughtigan.md)
- [`methods/regression_analysis.md`](../methods/regression_analysis.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3), source=ocr(paddle)*

