---
type: Talk
title: Portfolio Optimization Modeling
description: A simple and contemporary way to model and solve complex portfolio optimization problems with R.
timestamp: "2026-07-08T00:00:00Z"
year: 2016
date: ~
speaker: Laura Vana
speaker_slug: laura_vana
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/LauraVana.pdf"
file_local: "./_cache/files/2016/2016__laura_vana.pdf"
slug: 2016__laura_vana
status: archived
tags: [osqf, 2016, laura_vana, portfolio_optimization]
---

# Portfolio Optimization Modeling

_2016 · Laura Vana (WU Vienna University of Economics and Business)_

**Headline:** A simple and contemporary way to model and solve complex portfolio optimization problems with R.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/LauraVana.pdf>
- Local: `./_cache/files/2016/2016__laura_vana.pdf`
- Talk type: Lightning

## Topics
- portfolio optimization
- risk measures
- R programming
- optimization modeling
- financial modeling

## Methods
- Markowitz model
- CVaR (Conditional Value at Risk)
- cardinality constraints
- turnover constraints

## Datasets used
- djia2013

## Code & tools
- `ROML.portfolio`
- `ROI`
- `glpk`
- R Optimization Modeling Language (ROML)

## Key findings
- ROML.portfolio implements extensive risk/return measures including CVaR, omega, and minimax.  
  > Extensive set of complex and creative risk and return-risk measures implemented, e.g., markowitz reward mad downside_var ... cvar omega ...
- Portfolio constraints like cardinality and turnover are supported via ROML's syntax.  
  > Different constraints: cardinality, turnover, ... All standard functionalities of the generalized AML.
- The package allows specifying 95% CVaR as the risk measure in optimization models.  
  > m$minimize(cvar(portfolio, 0.95))
- The djia2013 dataset is used in example code for portfolio optimization.  
  > data(djia2013)

## Applications
- portfolio optimization

## References cited
- Kurt Hornik, David Meyer, Florian Schwendinger, and Stefan Theussl. ROI: R Optimization Infrastructure, 2016.

## See also
- [`years/2016.md`](../years/2016.md)
- [`speakers/laura_vana.md`](../speakers/laura_vana.md)
- [`topics/portfolio_optimization.md`](../topics/portfolio_optimization.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=75% (3/4), source=ocr(paddle)*

