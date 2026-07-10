---
type: Talk
title: A Short Introduction to Real-Time Portfolio/Market Monitoring with R
description: "This talk introduces real-time portfolio and market monitoring techniques using R, focusing on signal detection and package development."
timestamp: "2026-07-08T00:00:00Z"
year: 2012
date: ~
speaker: Weylandt
speaker_slug: weylandt
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2012/talk/MichaelWeylandt.pdf"
file_local: "./_cache/files/2012/2012__weylandt.pdf"
slug: 2012__weylandt
status: archived
tags: [osqf, 2012, weylandt]
---

# A Short Introduction to Real-Time Portfolio/Market Monitoring with R

_2012 · Weylandt (Princeton University, GSOC 2012)_

**Headline:** This talk introduces real-time portfolio and market monitoring techniques using R, focusing on signal detection and package development.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2012/talk/MichaelWeylandt.pdf>
- Local: `./_cache/files/2012/2012__weylandt.pdf`
- Talk type: Lightning

## Topics
- real-time portfolio monitoring
- technical indicator identification
- R package development
- market signal detection

## Methods
- quantmod::getQuote and quantstrat::add.signal
- background processing using OS multitasking
- callback mechanisms for interactivity
- task callback functions for signal checking

## Datasets used
*(none extracted)*

## Code & tools
- `quantmod`
- `quantstrat`
- R-Forge (forthcoming package)
- `Rscript`
- `TaskCallback`

## Key findings
- A forthcoming R package aims to replicate Bloomberg terminal functionality for real-time monitoring.  
  > This functionality is at the core of a forthcoming package (alpha release soon on R-Forge) designed to replicate the Bloomberg terminal experience within R
- Background OS processes enable continuous signal checking without interrupting R sessions.  
  > Use the OS to keep R looking for signals in the background (&)
- Callback mechanisms require balancing interactivity with system reactivity.  
  > Tricky to get a good balance between interactivity and reactivity

## Applications
- real-time trading alerts
- portfolio monitoring tools
- interactive market analysis

## References cited
- Roger D. Peng, Douglas Bates, and Brian D. Ripley (2004)

## See also
- [`years/2012.md`](../years/2012.md)
- [`speakers/weylandt.md`](../speakers/weylandt.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

