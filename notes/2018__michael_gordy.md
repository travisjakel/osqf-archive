---
type: Talk
title: Spectral Backtests of Forecast Distributions with Application to Risk Management
description: "The talk introduces spectral backtests for evaluating forecast distributions in risk management, using PIT values and customizable kernel functions."
timestamp: "2026-07-08T00:00:00Z"
year: 2018
date: ~
speaker: Michael Gordy
speaker_slug: michael_gordy
talk_type: Talk
time_slot: "13:59 - 14:19"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/MichaelGordy.pdf"
file_local: "./_cache/files/2018/2018__michael_gordy.pdf"
slug: 2018__michael_gordy
status: archived
tags: [osqf, 2018, michael_gordy, risk_management]
---

# Spectral Backtests of Forecast Distributions with Application to Risk Management

_2018 · Michael Gordy (Federal Reserve Board)_

**Headline:** The talk introduces spectral backtests for evaluating forecast distributions in risk management, using PIT values and customizable kernel functions.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/MichaelGordy.pdf>
- Local: `./_cache/files/2018/2018__michael_gordy.pdf`
- Talk type: Talk
- Time slot: 13:59 - 14:19

## Topics
- risk management
- backtesting
- probability integral transform
- statistical testing
- forecast distribution evaluation

## Methods
- spectral transformations of PIT exceedances
- Z-tests for unconditional coverage
- likelihood ratio tests
- customizable kernel functions

## Datasets used
*(none extracted)*

## Code & tools
- R package 'spectralBacktest'
- spectral_Ztest function
- spectral_MDtest function
- monokernel structure
- bikernel structure

## Key findings
- Spectral backtests generalize traditional VaR-based tests by utilizing PIT values for comprehensive distribution evaluation.  
  > Reported PIT values contain information about VaR exceedances at every level u.
- Kernel functions allow explicit prioritization of risk levels in backtesting.  
  > The choice of the kernel function makes explicit the priorities for model performance.
- The spectralBacktest R package enables extensible kernel customization and test execution.  
  > Our package is designed for extensibility. We pre-define many kernel functions ν, but want to facilitate user customization.
- Backtest results are highly sensitive to kernel function selection and parameterization.  
  > Backtest p-values may be very sensitive to choice of kernel function and kernel window.

## Applications
- risk management
- regulatory compliance
- model validation

## References cited
- Gordy and McNeil (FRB/York)
- Diebold, Gunther, and Tay (1998)

## See also
- [`years/2018.md`](../years/2018.md)
- [`speakers/michael_gordy.md`](../speakers/michael_gordy.md)
- [`topics/risk_management.md`](../topics/risk_management.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (4/4), source=ocr(paddle)*

