---
type: Talk
title: Tactical Asset Allocation using Machine Learning
description: Application of machine learning in tactical asset allocation to improve risk-adjusted returns
timestamp: "2026-07-08T00:00:00Z"
year: 2019
date: ~
speaker: Majeed Simaan
speaker_slug: majeed_simaan
talk_type: Talk
time_slot: "16:50 - 17:10"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/MajeedSimaan.pdf"
file_local: "./_cache/files/2019/2019__majeed_simaan.pdf"
slug: 2019__majeed_simaan
status: archived
tags: [osqf, 2019, majeed_simaan, tactical_asset_allocation]
---

# Tactical Asset Allocation using Machine Learning

_2019 · Majeed Simaan (Stevens Institute of Technology)_

**Headline:** Application of machine learning in tactical asset allocation to improve risk-adjusted returns

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/MajeedSimaan.pdf>
- Local: `./_cache/files/2019/2019__majeed_simaan.pdf`
- Talk type: Talk
- Time slot: 16:50 - 17:10

## Topics
- tactical asset allocation
- machine learning in finance
- return predictability
- portfolio optimization
- risk management
- quantitative finance

## Methods
- elastic net regression
- cross-validation
- maximum likelihood estimation
- tactical allocation based on probability thresholds

## Datasets used
- SPY ETF (S&P 500 index)
- VIX index
- GLD gold ETF
- 7-10 years treasury bond ETF
- XLF financial sector ETF
- data dates: 2004-12-27 to 2019-05-10

## Code & tools
- `quantmod`
- `glmnet`
- `parallel`

## Key findings
- ML-based tactical allocation outperforms 60-40 benchmark with higher Sharpe/Sortino ratios  
  > Sortino 1.35 (a=95%) vs Benchmark 0.92; Sharpe 0.99 (a=95%) vs Benchmark 0.73
- Strategy achieves 0.07 annualized alpha over benchmark at 95% confidence level  
  > Annualized Alpha 0.07 (a=95%) compared to Benchmark
- Probability forecasts filtered via 25-day MA improve signal quality  
  > To filter noise from the signal, we use a 25-days MA

## Applications
- tactical asset allocation
- risk-adjusted return optimization
- portfolio management

## References cited
- Boudt, Cela, & Simaan, 2019
- Campbell & Shiller, 1988
- DeMiguel et al., 2009
- Ledoit & Wolf, 2017

## See also
- [`years/2019.md`](../years/2019.md)
- [`speakers/majeed_simaan.md`](../speakers/majeed_simaan.md)
- [`topics/tactical_asset_allocation.md`](../topics/tactical_asset_allocation.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3)*

