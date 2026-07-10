---
type: Talk
title: Portfolio Optimization with Conditional Value-at-Risk Budgets
description: Portfolio optimization using CVaR budgets to allocate risk between assets like bonds and equities.
timestamp: "2026-07-08T00:00:00Z"
year: 2010
date: ~
speaker: Boudt
speaker_slug: boudt
talk_type: Talk
time_slot: "16:00 - 16:30"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2010/KrisBoudt.pdf"
file_local: "./_cache/files/2010/2010__boudt.pdf"
slug: 2010__boudt
status: archived
tags: [osqf, 2010, boudt, portfolio_optimization]
---

# Portfolio Optimization with Conditional Value-at-Risk Budgets

_2010 · Boudt (K.U.Leuven)_

**Headline:** Portfolio optimization using CVaR budgets to allocate risk between assets like bonds and equities.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2010/KrisBoudt.pdf>
- Local: `./_cache/files/2010/2010__boudt.pdf`
- Talk type: Talk
- Time slot: 16:00 - 16:30

## Topics
- portfolio optimization
- risk management
- conditional value-at-risk (CVaR)
- dynamic portfolio allocation

## Methods
- CVaR as objective function
- CVaR as constraint
- DEoptim optimization
- risk budgeting

## Datasets used
- indexes (US Bonds, US Equities 1980-2009)

## Code & tools
- `PortfolioAnalytics`
- `PerformanceAnalytics`
- `DEoptim`

## Key findings
- 60/40 risk allocation portfolio achieved 40.5%/59.5% bond/equity risk allocation.  
  > print(w6040riskalloc)
US Bonds US Equities
0.8382035  0.1617965
- Min CVaR portfolio allocated 96.4%/3.6% to bonds/equities.  
  > print(wMinCVaR)
    US Bonds US Equities
0.96443348  0.03556652
- Equal-risk portfolio split risk 50%/50% between assets.  
  > $pct_contrib_MES
US Bonds US Equities
0.5000001     0.4999999

## Applications
- portfolio optimization
- risk diversification

## References cited
- Rockafellar and Uryasev (2000)
- Alexander and Baptista (2004)
- Boudt, Peterson and Croux (2008)

## See also
- [`years/2010.md`](../years/2010.md)
- [`speakers/boudt.md`](../speakers/boudt.md)
- [`topics/portfolio_optimization.md`](../topics/portfolio_optimization.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

