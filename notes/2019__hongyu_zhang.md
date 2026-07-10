---
type: Talk
title: Improved Corwin-Schultz estimation
description: "Improved methods for estimating bid-ask spreads and volatility using daily price data, focusing on enhancing the Corwin-Schultz estimator."
timestamp: "2026-07-08T00:00:00Z"
year: 2019
date: ~
speaker: Hongyu Zhang
speaker_slug: hongyu_zhang
talk_type: Lightning
time_slot: "10:43 - 10:49"
file_format: pptx
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/HongyuZhang.pptx"
file_local: "./_cache/files/2019/2019__hongyu_zhang.pptx"
slug: 2019__hongyu_zhang
status: archived
tags: [osqf, 2019, hongyu_zhang]
---

# Improved Corwin-Schultz estimation

_2019 · Hongyu Zhang (University of Illinois at Urbana-Champaign)_

**Headline:** Improved methods for estimating bid-ask spreads and volatility using daily price data, focusing on enhancing the Corwin-Schultz estimator.

## Source
- File format: `pptx`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/HongyuZhang.pptx>
- Local: `./_cache/files/2019/2019__hongyu_zhang.pptx`
- Talk type: Lightning
- Time slot: 10:43 - 10:49

## Topics
- Bid-Ask Spread Estimation
- Volatility Estimation
- Improvements to Corwin-Schultz Method

## Methods
- Corwin-Schultz estimator (high-low ranges)
- Rosenthal ANOVA method (high, low, close prices)
- Estimate averaging
- Gamma smoothing

## Datasets used
*(none extracted)*

## Code & tools
*(none extracted)*

## Key findings
- Corwin-Schultz method uses one- and two-day high-low ranges to estimate spreads and volatility.  
  > Corwin-Schultz: uses one- and two-day high-low ranges.
- New Rosenthal ANOVA method leverages high, low, and close price series for volatility estimation.  
  > New Rosenthal ANOVA method: uses high, low, and close price series.
- Improved method averages estimates across days to smooth results and reduce negative spread estimates.  
  > Smooth results by averaging with previous day's estimate.
- Gamma smoothing of intermediate quantities further reduces negative spread estimates.  
  > Can also smooth intermediate quantity (gamma) used in estimation.
- Rosenthal ANOVA calculates volatility by differencing close, high, and low prices.  
  > $r_{cc,t} = \log(C_t) - \log(C_{t-1})$

## Applications
- Trading cost analysis

## References cited
- USZ14

## See also
- [`years/2019.md`](../years/2019.md)
- [`speakers/hongyu_zhang.md`](../speakers/hongyu_zhang.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=80% (4/5), source=ocr(paddle)*

