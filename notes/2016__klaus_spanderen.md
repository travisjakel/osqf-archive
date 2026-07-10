---
type: Talk
title: Calibration of the Heston Local Stochastic Volatility Model
description: Combines Heston and Local Volatility models to improve option pricing calibration
timestamp: "2026-07-08T00:00:00Z"
year: 2016
date: ~
speaker: Klaus Spanderen
speaker_slug: klaus_spanderen
talk_type: Talk
time_slot: "12:00 - 12:20"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/KlauSpanderen.pdf"
file_local: "./_cache/files/2016/2016__klaus_spanderen.pdf"
slug: 2016__klaus_spanderen
status: archived
tags: [osqf, 2016, klaus_spanderen, options_pricing]
---

# Calibration of the Heston Local Stochastic Volatility Model

_2016 · Klaus Spanderen_

**Headline:** Combines Heston and Local Volatility models to improve option pricing calibration

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/KlauSpanderen.pdf>
- Local: `./_cache/files/2016/2016__klaus_spanderen.pdf`
- Talk type: Talk
- Time slot: 12:00 - 12:20

## Topics
- options pricing
- stochastic volatility models
- calibration of financial models
- Monte-Carlo simulations
- PDE methods

## Methods
- Heston Stochastic Local Volatility model
- Fokker-Planck equation
- Monte-Carlo simulation
- operator splitting schemes

## Datasets used
*(none extracted)*

## Code & tools
- `RHestonSLV`
- `QuantLib`
- `Rcpp`
- `GitHub`
- `Monte-Carlo`
- `PDE`

## Key findings
- Calibration uses Fokker-Planck PDE to compute leverage function  
  > Compute p(xt , ν, t) either by Monte-Carlo or PDE to get to the leverage function Lt (xt , t)
- Monte-Carlo calibration uses Quasi-Monte-Carlo with Brownian bridges  
  > Advice: Use Quasi-Monte-Carlo simulations with Brownian bridges.
- Fokker-Planck PDE achieves 0.05% round-trip error for vanillas  
  > Round-Trip Error for 1Y Maturity... 30.05

## Applications
- pricing vanillas and exotic options

## References cited
- http://hpc-quantlib.de/src/slv.pdf
- International Journal of Numerical Analysis and Modeling, 7(2):303–320, 2010
- http://ssrn.com/abstract=2182411
- http://papers.ssrn.com/abstract_id=2278122

## See also
- [`years/2016.md`](../years/2016.md)
- [`speakers/klaus_spanderen.md`](../speakers/klaus_spanderen.md)
- [`topics/options_pricing.md`](../topics/options_pricing.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3)*

