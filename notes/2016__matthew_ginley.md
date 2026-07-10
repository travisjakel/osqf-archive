---
type: Talk
title: Simulation of Leveraged ETF Volatility Using Nonparametric Density Estimation
description: "This talk presents a method using nonparametric density estimation to simulate the volatility of leveraged ETFs, highlighting the impact of compounding and leverage."
timestamp: "2026-07-08T00:00:00Z"
year: 2016
date: ~
speaker: Matthew Ginley
speaker_slug: matthew_ginley
talk_type: Talk
time_slot: "11:40 - 12:00"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/MatthewGinley.pdf"
file_local: "./_cache/files/2016/2016__matthew_ginley.pdf"
slug: 2016__matthew_ginley
status: archived
tags: [osqf, 2016, matthew_ginley]
---

# Simulation of Leveraged ETF Volatility Using Nonparametric Density Estimation

_2016 · Matthew Ginley_

**Headline:** This talk presents a method using nonparametric density estimation to simulate the volatility of leveraged ETFs, highlighting the impact of compounding and leverage.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/MatthewGinley.pdf>
- Local: `./_cache/files/2016/2016__matthew_ginley.pdf`
- Talk type: Talk
- Time slot: 11:40 - 12:00

## Topics
- leveraged ETF volatility
- nonparametric density estimation
- simulation methods
- financial applications

## Methods
- kernel density estimation (KDE)
- constrained KDE
- simulation of LETF returns using KDE

## Datasets used
- Russell 2000 index data
- IWM (Russell 2000 1x ETF) returns
- TNA (Russell 2000 3x ETF) returns

## Code & tools
- R programming language
- R Studio
- `do_findatamatroll`
- `sim_index`

## Key findings
- Volatility drag causes LETF underperformance due to daily compounding.  
  > Π(1 + β * R Index) - 1 ≤ β * [Π(1 + R Index) - 1]
- Constrained KDE effectively models LETF return distributions with period return constraints.  
  > f(x | ∑x < c)
- Backtested LETF options strategy showed consistent losses despite positive expected value forecasts.  
  > Actual Profit ($) | Mean Forecast Profit ($) | Result\n...\n100 | 1800 | Loser

## Applications
- LETF options strategy design
- volatility risk modeling

## References cited
- 'Simulation of Leveraged ETF Volatility Using Nonparametric Density Estimation', Journal of Mathematical Finance, November 2015
- 'Shortfall from Maximum Convexity', arXiv.org, November 2015

## See also
- [`years/2016.md`](../years/2016.md)
- [`speakers/matthew_ginley.md`](../speakers/matthew_ginley.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3), source=ocr(paddle)*

