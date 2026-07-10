---
type: Talk
title: "Signal Quantiling & Signal Combination in the Cross-Section"
description: Improving portfolio performance through signal quantiling and optimal combination of multiple signals using statistical techniques and Monte-Carlo simulations.
timestamp: "2026-07-08T00:00:00Z"
year: 2025
date: ~
speaker: Killian Tattan
speaker_slug: killian_tattan
talk_type: Talk
time_slot: "13:30 - 13:50"
file_format: pptx
file_url: "https://www.osqf.org/archive/2025/KillianTattan.pptx"
file_local: "./_cache/files/2025/2025__killian_tattan.pptx"
slug: 2025__killian_tattan
status: archived
tags: [osqf, 2025, killian_tattan]
---

# Signal Quantiling & Signal Combination in the Cross-Section

_2025 · Killian Tattan (Paratus Capital)_

**Headline:** Improving portfolio performance through signal quantiling and optimal combination of multiple signals using statistical techniques and Monte-Carlo simulations.

## Source
- File format: `pptx`
- URL: <https://www.osqf.org/archive/2025/KillianTattan.pptx>
- Local: `./_cache/files/2025/2025__killian_tattan.pptx`
- Talk type: Talk
- Time slot: 13:30 - 13:50

## Topics
- Signal Quantiling
- Signal Combination
- Portfolio Optimization
- Statistical Signal Processing
- Risk Management

## Methods
- LOWESS model fitting
- piecewise OLS models
- Monte-Carlo simulations with student-T distribution
- IC weighting optimization
- Sharpe ratio-based weighting

## Datasets used
*(none extracted)*

## Code & tools
- https://github.com/NervousEnergy1979/osqf

## Key findings
- Signal quantiling can transform weak signals into profitable strategies by reweighting deciles with positive expected returns.  
  > The lowest decile actually has positive expected returns! Assets previously shorted in the naive approach are now long positions.
- Quantiling improves Sharpe ratios compared to baseline approaches in Monte-Carlo tests.  
  > Quantiled | 0.0 | 0.8 | 1.0 | 1.2 | 1.5 Baseline | -0.5 | 0.5 | 0.8 | 1.0 | 1.2
- IC weighting outperforms equal weighting in portfolio simulations with statistically significant improvements.  
  > Difference in Type1 and Equal p=0.0

## Applications
- portfolio management
- risk management
- signal processing in finance

## References cited
- Arik Ben Dor, Stephan Florig; Integrating Multiple Signals in Systematic Corporate Bond Selection Strategies
- Edward E. Qian et. al.; Quantitative Equity Portfolio Management Modern Techniques and Applications

## See also
- [`years/2025.md`](../years/2025.md)
- [`speakers/killian_tattan.md`](../speakers/killian_tattan.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

