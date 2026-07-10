---
type: Talk
title: Building and Testing Quantitative Strategy Models in R
description: "Talk demonstrates building and testing quantitative trading strategies in R using packages like quantmod, blotter, and quantstrat, with a focus on backtesting a trend-following strategy on S&P sector ETFs."
timestamp: "2026-07-08T00:00:00Z"
year: 2011
date: ~
speaker: Peterson
speaker_slug: peterson
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2011/BrianPeterson.pdf"
file_local: "./_cache/files/2011/2011__peterson.pdf"
slug: 2011__peterson
status: archived
tags: [osqf, 2011, peterson]
---

# Building and Testing Quantitative Strategy Models in R

_2011 · Peterson_

**Headline:** Talk demonstrates building and testing quantitative trading strategies in R using packages like quantmod, blotter, and quantstrat, with a focus on backtesting a trend-following strategy on S&P sector ETFs.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2011/BrianPeterson.pdf>
- Local: `./_cache/files/2011/2011__peterson.pdf`
- Talk type: Lightning

## Topics
- quantitative strategy development
- backtesting
- R programming
- algorithmic trading
- portfolio management

## Methods
- moving average crossover signals
- position sizing
- SMA indicator
- crossover signal functions
- rule-based trading logic

## Datasets used
- Yahoo Finance
- S&P Sector ETFs (XLF, XLP, XLE, XLY, XLV, XLI, XLB, XLK, XLU)

## Code & tools
- `quantmod`
- `blotter`
- `quantstrat`
- `TTR`
- `xts`
- `PerformanceAnalytics`
- `FinancialInstrument`
- `lspm`
- `PortfolioAnalytics`

## Key findings
- The Faber trend-following strategy was profitable over a decade for most S&P sector ETFs except XLK.  
  > ■ Strategy is profitable over a decade on all but one sector
- Performance could be improved with capital-aware position sizing and limit-based exits.  
  > ■ Performance could be improved by capital aware position sizing, and more sophisticated limit-based exits
- The strategy uses fixed position sizing without shorting, moving to cash on sell signals.  
  > No shorting, 'sell' goes to cash. Positions are fixed.
- The example code demonstrates adding SMA indicators and crossover signals to a quantstrat framework.  
  > s <- add.indicator(strategy = s, name = "SMA", arguments = list(x = quote(Cl(mktdata)), n=10), label="SMA10")

## Applications
- quantitative strategy development
- algorithmic trading backtesting

## References cited
- Faber, Mebane T., "A Quantitative Approach to Tactical Asset Allocation." Journal of Risk Management (Spring 2007)

## See also
- [`years/2011.md`](../years/2011.md)
- [`speakers/peterson.md`](../speakers/peterson.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (4/4), source=ocr(paddle)*

