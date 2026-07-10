---
type: Talk
title: Measuring Risk with Continuous Time Generalized Autoregressive Conditional Heteroscedasticity Models
description: The talk presents COGARCH models for continuous-time risk measurement and portfolio optimization using high-frequency data.
timestamp: "2026-07-08T00:00:00Z"
year: 2017
date: ~
speaker: Francesco Bianchi
speaker_slug: francesco_bianchi
talk_type: Lightning
time_slot: "13:30 - 14:00"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/FrancescoBianchi.pdf"
file_local: "./_cache/files/2017/2017__francesco_bianchi.pdf"
slug: 2017__francesco_bianchi
status: archived
tags: [osqf, 2017, francesco_bianchi, risk_modeling]
---

# Measuring Risk with Continuous Time Generalized Autoregressive Conditional Heteroscedasticity Models

_2017 · Francesco Bianchi (Università Cattolica del Sacro Cuore, Milan; MDOTM, Milan)_

**Headline:** The talk presents COGARCH models for continuous-time risk measurement and portfolio optimization using high-frequency data.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/FrancescoBianchi.pdf>
- Local: `./_cache/files/2017/2017__francesco_bianchi.pdf`
- Talk type: Lightning
- Time slot: 13:30 - 14:00

## Topics
- risk modeling
- continuous-time GARCH models
- portfolio optimization
- high-frequency data analysis
- empirical finance

## Methods
- COGARCH(p, q) models
- ICA-COGARCH
- CARMA processes
- portfolio optimization with risk measures (VaR, ES)

## Datasets used
- FTSE 100 Index members (APR 2010 - DEC 2015)
- European hedge funds tracking FTSE 100 (UKX) (APR 2010 - DEC 2015)

## Code & tools
- COGARCH.rm R package
- `Yuima`
- `fastICA`
- `quantmod`
- `cluster`
- `rugarch`

## Key findings
- COGARCH models handle high-frequency/irregular data without missing value approximations  
  > High frequency and irregularly spaced data management · No missing values approximation
- ICA-COGARCH enables portfolio selection with factor-based asset modeling  
  > X t = A S t where A is a N × p matrix and S t = (S 1,t, . . . , S p,t ) T is a p-vector process
- Portfolio optimization uses VaR/ES risk measures with COGARCH-based weights  
  > max C1,…,C N E[G T] - λ ρ( - G t ) · ρ is an homogeneous risk measure (VaR, ES)

## Applications
- portfolio optimization
- risk management

## References cited
- Bianchi, Francesco and Mercuri, Lorenzo and Rroji, Edit. Measuring Risk with COGARCH(p,q) Models. SSRN. (2016).
- Brockwell, Peter and Chadraa, Erdenebaatar and Alexander Lindner. Continuous-time garch processes. Annals of Applied Probability. 2006.

## See also
- [`years/2017.md`](../years/2017.md)
- [`speakers/francesco_bianchi.md`](../speakers/francesco_bianchi.md)
- [`topics/risk_modeling.md`](../topics/risk_modeling.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

