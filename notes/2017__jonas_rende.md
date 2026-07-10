---
type: Talk
title: partialCIAn R package for the analysis of partially cointegrated time series
description: "partialCI: An R Package for the Analysis of Partially Cointegrated Time Series"
timestamp: "2026-07-08T00:00:00Z"
year: 2017
date: ~
speaker: Jonas Rende
speaker_slug: jonas_rende
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/JonasRende.pdf"
file_local: "./_cache/files/2017/2017__jonas_rende.pdf"
slug: 2017__jonas_rende
status: archived
tags: [osqf, 2017, jonas_rende]
---

# partialCIAn R package for the analysis of partially cointegrated time series

_2017 · Jonas Rende (University of Erlangen-Nürnberg, Germany)_

**Headline:** partialCI: An R Package for the Analysis of Partially Cointegrated Time Series

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/JonasRende.pdf>
- Local: `./_cache/files/2017/2017__jonas_rende.pdf`
- Talk type: Lightning

## Topics
- partial cointegration
- time series analysis
- R package development
- pairs trading

## Methods
- partial cointegration framework with mean-reverting and random walk components
- likelihood ratio test for PCI vs random walk/AR(1)
- state space modeling (M_t = ρM_{t-1} + ε_{M,t}, R_t = R_{t-1} + ε_{R,t})
- penalized regression (λ parameter)

## Datasets used
- RDS-A and RDS-B (2006-01-01 - 2016-01-12, daily prices)

## Code & tools
- R package 'partialCI' (CRAN)
- fit.pci()
- test.pci()
- statehistory.pci()
- hedge.pci()
- GitHub repository (https://github.com/jonasrende/Rfinance2017)

## Key findings
- Partial cointegration allows both mean-reverting and permanent components in residuals  
  > Are allowed to be transient and permanent
- RDS-A and RDS-B show significant partial cointegration (p=0.010)  
  > Combined 0.010
- 54% of variance in RDS-A/RDS-B spread is mean-reverting  
  > R^2[MR] = 0.540

## Applications
- pairs trading hedge ratio estimation
- statistical arbitrage strategy validation

## References cited
- Clegg and Krauss (2016)
- Engle and Granger (1987)
- Poterba and Summers (1988)
- Clegg (2015)

## See also
- [`years/2017.md`](../years/2017.md)
- [`speakers/jonas_rende.md`](../speakers/jonas_rende.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3), source=ocr(paddle)*

