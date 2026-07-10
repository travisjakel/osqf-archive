---
type: Talk
title: "mvskPortfolios: portfolio tilting to harvest higher moment gains"
description: "The talk presents a framework for portfolio tilting that incorporates higher moments (skewness, kurtosis) to improve portfolio performance beyond traditional mean-variance optimization."
timestamp: "2026-07-08T00:00:00Z"
year: 2019
date: ~
speaker: Dries Cornilly
speaker_slug: dries_cornilly
talk_type: Talk
time_slot: "15:00 - 15:20"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/DriesCornilly.pdf"
file_local: "./_cache/files/2019/2019__dries_cornilly.pdf"
slug: 2019__dries_cornilly
status: archived
tags: [osqf, 2019, dries_cornilly, portfolio_optimization]
---

# mvskPortfolios: portfolio tilting to harvest higher moment gains

_2019 · Dries Cornilly_

**Headline:** The talk presents a framework for portfolio tilting that incorporates higher moments (skewness, kurtosis) to improve portfolio performance beyond traditional mean-variance optimization.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/DriesCornilly.pdf>
- Local: `./_cache/files/2019/2019__dries_cornilly.pdf`
- Talk type: Talk
- Time slot: 15:00 - 15:20

## Topics
- portfolio optimization
- higher moments
- risk management
- algorithmic trading

## Methods
- maximum diversification portfolio (DR)
- equally-weighted portfolio (EW)
- minimum tracking error volatility portfolio (TE)
- mean-variance-skewness-kurtosis tilting

## Datasets used
- MSCI Europe
- MSCI USA
- MSCI Japan
- MSCI Emerging Markets
- EPRA Eurozone
- JPM EMU
- iBoxx EUR Corporate
- Bloomberg Barclays Global Aggregate Treasuries
- JPM EMBI Global Diversified Composite
- Bloomberg Barclays Global High Yield
- Bloomberg Barclays US Corporates
- Bloomberg Barclays World Govt Inflation Linked

## Code & tools
*(none extracted)*

## Key findings
- Tilting maximum diversification portfolios to emphasize higher moments improves risk-adjusted returns.  
  > DR - tilted 5% ... -11.053 ... 0.761
- Higher moment tilting reduces maximum drawdowns compared to baseline portfolios.  
  > DR - tilted 5% ... -11.053 ... 0.761
- Equally-weighted portfolios with tilt achieve better skewness and kurtosis metrics.  
  > EW - tilted 5% ... -0.197 ... 0.211
- The tilting framework uses a constrained optimization to balance moment gains against tracking error.  
  > maximize δ ... subject to TEvol(w) ≤ τ

## Applications
- portfolio management
- risk management

## References cited
- Boudt, Cornilly, Van Holle and Willems (2019). “Algorithmic portfolio tilting to harvest higher moment gains.” https://ssrn.com/abstract=3378491

## See also
- [`years/2019.md`](../years/2019.md)
- [`speakers/dries_cornilly.md`](../speakers/dries_cornilly.md)
- [`topics/portfolio_optimization.md`](../topics/portfolio_optimization.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=0% (0/4)*

