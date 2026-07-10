---
type: Talk
title: Risk Fast and Slow
description: "Explores dual approaches to risk management: real-time data analysis and long-term regime identification."
timestamp: "2026-07-08T00:00:00Z"
year: 2017
date: ~
speaker: Dave DeMers
speaker_slug: dave_demers
talk_type: Keynote
time_slot: "11:35 - 12:15"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/DaveDeMers.pdf"
file_local: "./_cache/files/2017/2017__dave_demers.pdf"
slug: 2017__dave_demers
status: archived
tags: [osqf, 2017, dave_demers, risk_management]
---

# Risk Fast and Slow

_2017 · Dave DeMers_

**Headline:** Explores dual approaches to risk management: real-time data analysis and long-term regime identification.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/DaveDeMers.pdf>
- Local: `./_cache/files/2017/2017__dave_demers.pdf`
- Talk type: Keynote
- Time slot: 11:35 - 12:15

## Topics
- risk management
- market regimes
- real-time detection
- systemic risk
- statistical methods

## Methods
- absorption ratio
- entropy measures
- principal component analysis (PCA)
- Granger-Causality
- systemic risk models (CoVar, Co-Risk)

## Datasets used
- ESRB Risk Dashboard
- VIX
- FRED
- IMF toolkit
- OFR macro indicators
- ECB risk dashboard

## Code & tools
- R packages (CRAN Task Views)
- Shiny app

## Key findings
- The 10Y3M spread reliably preceded recessions since 1982 with no false positives/negatives.  
  > All recessions preceded by negative value
All negative values precede a recession
No false positives nor negatives!
- Turbulence measures (degrees of freedom) correlate with market instability.  
  > Turbulence - compare current vector of returns to 'typical'
Degrees of freedom / number of independent drivers
- Real-time VPIN analysis on hedging instruments detects toxic trading patterns.  
  > VPIN on hedging instruments like ES, US, Gold…
Is current activity significantly different from 'typical'

## Applications
- risk mitigation strategies
- policy formulation
- real-time trading decisions

## References cited
- IMF working paper (wp11235)
- ECB risk dashboard
- Financial Research Report

## See also
- [`years/2017.md`](../years/2017.md)
- [`speakers/dave_demers.md`](../speakers/dave_demers.md)
- [`topics/risk_management.md`](../topics/risk_management.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3), source=ocr(paddle)*

