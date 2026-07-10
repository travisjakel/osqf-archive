---
type: Talk
title: Building Portfolios of Spreads
description: "This talk explains how to construct portfolios of spreads using returns-based analysis and risk parity techniques, addressing challenges with traditional return calculations and position sizing."
timestamp: "2026-07-08T00:00:00Z"
year: 2025
date: ~
speaker: Paul Teetor
speaker_slug: paul_teetor
talk_type: Lightning
time_slot: "14:59 - 15:06"
file_format: pdf
file_url: "https://www.osqf.org/archive/2025/PaulTeetor.pdf"
file_local: "./_cache/files/2025/2025__paul_teetor.pdf"
slug: 2025__paul_teetor
status: archived
tags: [osqf, 2025, paul_teetor, portfolio_construction, risk_parity]
---

# Building Portfolios of Spreads

_2025 · Paul Teetor_

**Headline:** This talk explains how to construct portfolios of spreads using returns-based analysis and risk parity techniques, addressing challenges with traditional return calculations and position sizing.

## Source
- File format: `pdf`
- URL: <https://www.osqf.org/archive/2025/PaulTeetor.pdf>
- Local: `./_cache/files/2025/2025__paul_teetor.pdf`
- Talk type: Lightning
- Time slot: 14:59 - 15:06

## Topics
- portfolio construction
- risk management
- spread trading
- returns-based analysis
- position sizing

## Methods
- risk parity
- CVaR
- equal exposure
- minimum volatility
- inverse volatility
- equal CVaR contribution

## Datasets used
*(none extracted)*

## Code & tools
- Shiny app

## Key findings
- Traditional simple returns (ΔS/Sₜ₋₁) are unsuitable for spread trades.  
  > Simple returns do not work: R t = ∆ S t / S t-1
- A modified return formula (ΔNet/Grossₜ₋₁) enables returns-based analysis for spreads.  
  > This is unintuitive, but it works: R t = ∆Net t / Gross t-1
- Exposure-based position sizing avoids over-collateralization in spread portfolios.  
  > Would not work for futures and spreads: Result: Very over-collateralized positions with tiny little P&L
- The Shiny app implements exposure calculation and risk targeting for portfolio construction.  
  > Shiny app does construction and sizing
- Net dollar volatility (with covariance) improves risk management consistency.  
  > Net dollar volatility (use covariance) ○ CVaR ○ Net gross notional value

## Applications
- portfolio construction
- risk management
- position sizing
- spread trading

## References cited
- Vorobets, Anton (2022) - 'Portfolio Management Framework for Derivative Instruments'

## See also
- [`years/2025.md`](../years/2025.md)
- [`speakers/paul_teetor.md`](../speakers/paul_teetor.md)
- [`topics/portfolio_construction.md`](../topics/portfolio_construction.md)
- [`methods/risk_parity.md`](../methods/risk_parity.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=80% (4/5), source=ocr(paddle)*

