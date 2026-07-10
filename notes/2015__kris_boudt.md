---
type: Talk
title: High-frequency Price Data Analysis in R
description: "Tutorial on analyzing high-frequency price data in R, focusing on cleaning, aggregation, and volatility estimation using the highfrequency package."
timestamp: "2026-07-08T00:00:00Z"
year: 2015
date: ~
speaker: Kris Boudt
speaker_slug: kris_boudt
talk_type: Tutorial
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/workshop/KrisBoudt.pdf"
file_local: "./_cache/files/2015/2015__kris_boudt.pdf"
slug: 2015__kris_boudt
status: archived
tags: [osqf, 2015, kris_boudt]
---

# High-frequency Price Data Analysis in R

_2015 · Kris Boudt (Free University of Brussels and Amsterdam)_

**Headline:** Tutorial on analyzing high-frequency price data in R, focusing on cleaning, aggregation, and volatility estimation using the highfrequency package.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/workshop/KrisBoudt.pdf>
- Local: `./_cache/files/2015/2015__kris_boudt.pdf`
- Talk type: Tutorial

## Topics
- high-frequency data cleaning
- intraday return aggregation
- spot volatility estimation
- jump detection
- realized volatility
- volatility forecasting

## Methods
- calendar time sampling
- business time sampling
- refresh time synchronization
- spotvol non-parametric estimation
- realized variance
- HAR model

## Datasets used
*(none extracted)*

## Code & tools
- `highfrequency`
- `xts`
- `aggregatets`
- `refreshTime`
- `spotvol`
- `BNSjumptest`
- HAR model

## Key findings
- High-frequency data requires cleaning to remove errors like zero prices and bid-ask violations.  
  > Data cleaning to remove some obvious 'errors' from the data: Trades and quotes with position size of 0; Trades and quotes with time stamp outside the opening hours...
- Refresh time sampling synchronizes multivariate data by aligning observations across assets.  
  > Refresh-time sampling. Source: Barndorff-Nielsen et al., 2011. τ1 is the time it has taken until the three assets have traded...
- Realized variance converges to quadratic variation under the BSMFAJ model, including jump components.  
  > Realized variance converges to the quadratic variation, which under the BSMFAJ model equals the integrated variance + sum of squared intraday jumps:
- HAR models forecast daily volatility using averages of past realized volatilities (1-day, 5-day, 22-day).  
  > HAR model: RV is predicted based on averages of k past RV: Lagged RV (k=1), Average RV of the past week (k=5)...

## Applications
- volatility forecasting
- risk management

## References cited
- Barndorff-Nielsen et al., 2011

## See also
- [`years/2015.md`](../years/2015.md)
- [`speakers/kris_boudt.md`](../speakers/kris_boudt.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=75% (3/4), source=ocr(paddle)*

