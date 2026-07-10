---
type: Talk
title: VEC and GVAR Models using R
description: "The talk critiques the Basel Committee's separate treatment of market and credit risk, demonstrating how integrated risk analysis using VEC/GVAR models reveals significant underestimation of risk in foreign currency loan portfolios."
timestamp: "2026-07-08T00:00:00Z"
year: 2009
date: ~
speaker: Klaus Rheinberger
speaker_slug: klaus_rheinberger
talk_type: ~
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2009/rheinberger.pdf"
file_local: "./_cache/files/2009/2009__klaus_rheinberger.pdf"
slug: 2009__klaus_rheinberger
status: archived
tags: [osqf, 2009, klaus_rheinberger]
---

# VEC and GVAR Models using R

_2009 · Klaus Rheinberger (Oesterreichische Nationalbank, Austria / PPE Research Centre, FH Vorarlberg, Austria)_

**Headline:** The talk critiques the Basel Committee's separate treatment of market and credit risk, demonstrating how integrated risk analysis using VEC/GVAR models reveals significant underestimation of risk in foreign currency loan portfolios.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2009/rheinberger.pdf>
- Local: `./_cache/files/2009/2009__klaus_rheinberger.pdf`

## Topics
- market and credit risk interaction
- time series modeling
- risk capital calculation
- Basel regulation critique
- foreign currency portfolios

## Methods
- VEC (Vector Error Correction) models
- GVAR (Global VAR) models
- Expected Shortfall (ES) for risk capital
- scenario analysis

## Datasets used
- historic data from 1986 Q3 to 2005 Q4, quarterly
- real GDP, three month LIBOR interest rate, exchange rate to US dollar

## Code & tools
- R (for VEC/GVAR modeling)

## Key findings
- The traditional Basel approach of adding market and credit risk capital can significantly underestimate true integrated risk.  
  > In our paper 1 we argue that this approach is problematic and that it can lead to significant underestimation of risk.
- Integrated risk interactions can be both overestimating and underestimating total risk depending on scenarios.  
  > Approximation errors can go both ways... If d is non-negative in all scenarios, we have a benign interaction effect.
- Linear portfolio value functions allow exact separation of market and credit risk components.  
  > In particular linear portfolio value functions fulfil condition (1).

## Applications
- foreign currency loan portfolio risk management
- regulatory capital calculation

## References cited
- Breuer, Jandacka, Rheinberger, Summer: Does Adding Up of Economic Capital for Market- and Credit Risk amount to Conservative Risk Assessment?, Journal of Banking and Finance, in print, 2009

## See also
- [`years/2009.md`](../years/2009.md)
- [`speakers/klaus_rheinberger.md`](../speakers/klaus_rheinberger.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

