---
type: Talk
title: "Global Minimum Variance Portfolio: a Horse Race of Volatilities"
description: "Analysis of global minimum variance portfolio performance using different volatility estimation methods (sample, RiskMetrics, GARCH) across 2003-2015"
timestamp: "2026-07-08T00:00:00Z"
year: 2015
date: ~
speaker: Majeed Simaan
speaker_slug: majeed_simaan
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/MajeedSimaan.pdf"
file_local: "./_cache/files/2015/2015__majeed_simaan.pdf"
slug: 2015__majeed_simaan
status: archived
tags: [osqf, 2015, majeed_simaan, portfolio_optimization]
---

# Global Minimum Variance Portfolio: a Horse Race of Volatilities

_2015 · Majeed Simaan (RPI)_

**Headline:** Analysis of global minimum variance portfolio performance using different volatility estimation methods (sample, RiskMetrics, GARCH) across 2003-2015

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/MajeedSimaan.pdf>
- Local: `./_cache/files/2015/2015__majeed_simaan.pdf`
- Talk type: Lightning

## Topics
- portfolio optimization
- estimation risk
- covariance matrix shrinkage
- volatility forecasting

## Methods
- global minimum variance portfolio formulation
- Ledoit-Wolf covariance shrinkage
- GARCH volatility models

## Datasets used
*(none extracted)*

## Code & tools
- R

## Key findings
- Sample estimates perform worse than shrinkage methods in out-of-sample tests  
  > Portfolios that rely on sample estimates typically perform poorly ex-post due to estimation risk
- Covariance matrix estimation risk is less severe than mean vector estimation risk  
  > The committed estimation risk in the mean vector is much worse than in the covariance matrix
- GARCH models show consistent improvement over naive approaches  
  > Year | Naive | Sample | RM | GARCH\n2003 | 1.2 | 1.1 | 1.0 | 1.0
- Performance improvements increase with more assets  
  > 10 Assets\n0.23 0.19 0.23 0.19\n0.87 0.90 1.11 0.97

## Applications
- portfolio management
- risk management

## References cited
- Ledoit and Wolf (2004)
- DeMiguel et al (2013)

## See also
- [`years/2015.md`](../years/2015.md)
- [`speakers/majeed_simaan.md`](../speakers/majeed_simaan.md)
- [`topics/portfolio_optimization.md`](../topics/portfolio_optimization.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=50% (2/4), source=ocr(paddle)*

