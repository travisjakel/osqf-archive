---
type: Talk
title: Code Architecture of a Mid-Term Trading Strategy
description: "The talk outlines the code architecture for a mid-term trading strategy, covering data preprocessing, model building with random forests, and backtesting frameworks."
timestamp: "2026-07-08T00:00:00Z"
year: 2022
date: ~
speaker: Seth Therrien
speaker_slug: seth_therrien
talk_type: Lightning
time_slot: "14:31 - 14:37"
file_format: pptx
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2022/SethTherrien.pptx"
file_local: "./_cache/files/2022/2022__seth_therrien.pptx"
slug: 2022__seth_therrien
status: archived
tags: [osqf, 2022, seth_therrien]
---

# Code Architecture of a Mid-Term Trading Strategy

_2022 · Seth Therrien_

**Headline:** The talk outlines the code architecture for a mid-term trading strategy, covering data preprocessing, model building with random forests, and backtesting frameworks.

## Source
- File format: `pptx`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2022/SethTherrien.pptx>
- Local: `./_cache/files/2022/2022__seth_therrien.pptx`
- Talk type: Lightning
- Time slot: 14:31 - 14:37

## Topics
- trading strategy code architecture
- data preprocessing for trading
- model building with random forests
- backtesting frameworks
- execution of trading strategies

## Methods
- random forests (Ranger)
- technical indicators (TTR)
- walk-forward validation
- data gap/jump detection using lead/lag
- feature engineering with relative scaling

## Datasets used
- Polygon 1m bar data

## Code & tools
- `Rstudio`
- `data.table`
- foreach/doParallel
- xts/quantmod/TTR/QuantStrat/PerformanceAnalytics/blotter
- `Ranger`
- `Ggplot2`
- `Tradingview`

## Key findings
- High-speed data ingestion from Polygon using foreach/dopar achieved 16k calls/sec for 1m bar data.  
  > I was able to download historical 1m bar data for thousands of stocks in a few minutes using foreach/dopar against Polygon (peak 16k calls per second)
- Data quality checks include gap detection via date difference analysis and lead/lag functions.  
  > Look for gaps in similar way by comparing the date differences within the same symbol
- Relative scaling of technical indicators (e.g., MACD) improves model generalization across symbols.  
  > MACD for instance will have a different scale for every company, so you would want to use a value that represents the increase relative to itself over the recent history
- Walk-forward validation splits data into 60% training and 40% out-of-sample with multiple bootstrapped backtest periods.  
  > should be enough to setup 60% for training model, 40% for oos, with multiple bootstrapped backtest periods

## Applications
- mid-term trading strategy execution
- backtesting frameworks
- data preprocessing for financial models

## References cited
*(none extracted)*

## See also
- [`years/2022.md`](../years/2022.md)
- [`speakers/seth_therrien.md`](../speakers/seth_therrien.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (4/4), source=ocr(paddle)*

