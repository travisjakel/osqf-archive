---
type: Talk
title: Options Trading with RAn Introduction to the greeks Package
description: "Introduction to the greeks R package for options trading, demonstrating Greek calculations and payoff visualization."
timestamp: "2026-07-08T00:00:00Z"
year: 2013
date: ~
speaker: Jeffrey Ryan
speaker_slug: jeffrey_ryan
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/JeffRyan.pdf"
file_local: "./_cache/files/2013/2013__jeffrey_ryan.pdf"
slug: 2013__jeffrey_ryan
status: archived
tags: [osqf, 2013, jeffrey_ryan, options_pricing, black_scholes_model]
---

# Options Trading with RAn Introduction to the greeks Package

_2013 · Jeffrey Ryan_

**Headline:** Introduction to the greeks R package for options trading, demonstrating Greek calculations and payoff visualization.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/JeffRyan.pdf>
- Local: `./_cache/files/2013/2013__jeffrey_ryan.pdf`
- Talk type: Lightning

## Topics
- options pricing
- R package development
- Greeks calculation

## Methods
- Black-Scholes model
- Jump Diffusion model
- payoff plotting

## Datasets used
- Full OCC Calendar 1990 to 2021

## Code & tools
- `greeks`
- R
- osi()
- plot(payoff())
- code.google.com/p/rgreeks/

## Key findings
- The greeks package calculates 15+ option sensitivities (delta, gamma, vega, etc.) for both calls and puts.  
  > greeks(42,40,0.1,0.1,0.5,0.2)
List of 2
$ call:List of 15...
- The package includes functions for retrieving option expiration dates and volatility surfaces.  
  > nextExp() # 2013-06-21
nextExp(n=5) # 2013-10-18
- Visualizes option payoffs with combined long/short positions.  
  > plot(payoff(as.osi("PPL 121020P00029000")+as.osi("PPL 121020C00029000"),premium=c(0.2,0.2)))

## Applications
- options pricing
- risk management

## References cited
*(none extracted)*

## See also
- [`years/2013.md`](../years/2013.md)
- [`speakers/jeffrey_ryan.md`](../speakers/jeffrey_ryan.md)
- [`topics/options_pricing.md`](../topics/options_pricing.md)
- [`methods/black_scholes_model.md`](../methods/black_scholes_model.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3), source=ocr(paddle)*

