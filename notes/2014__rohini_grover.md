---
type: Talk
title: The Imprecision of Volatility Indexes
description: Measuring imprecision in volatility indexes (VIX) using bootstrap methods and analyzing its implications for option pricing and risk management.
timestamp: "2026-07-08T00:00:00Z"
year: 2014
date: ~
speaker: Rohini Grover
speaker_slug: rohini_grover
talk_type: Talk
time_slot: "13:42 - 14:02"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/RohiniGrover.pdf"
file_local: "./_cache/files/2014/2014__rohini_grover.pdf"
slug: 2014__rohini_grover
status: archived
tags: [osqf, 2014, rohini_grover]
---

# The Imprecision of Volatility Indexes

_2014 · Rohini Grover_

**Headline:** Measuring imprecision in volatility indexes (VIX) using bootstrap methods and analyzing its implications for option pricing and risk management.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/RohiniGrover.pdf>
- Local: `./_cache/files/2014/2014__rohini_grover.pdf`
- Talk type: Talk
- Time slot: 13:42 - 14:02

## Topics
- volatility indexes
- imprecision measurement
- bootstrap inference
- model selection
- options pricing

## Methods
- bootstrapping
- Black-Scholes model
- Wilcoxon signed rank test

## Datasets used
- S&P 500 index (SPX) options end-of-day data (Sep-Nov 2010)
- Nifty options tick-by-tick data (Feb-Sep 2009-2010)

## Code & tools
- ifrogs R package

## Key findings
- VVIX has the lowest imprecision with a median confidence interval width of 2.9pp.  
  > the median confidence interval width of 2.9pp.
- VVIX outperforms other VIX variants (SVIX, TVVIX, EVIX) in precision metrics.  
  > VVIX has the highest precision with median CI width of 2.902 pp
- Imprecise VIX estimates lead to option price ranges differing by factors of 2x (e.g., Rs. 0.89-3.86 for a 6100 OTM call).  
  > the option's price may lie between Rs. 0.89 and Rs. 3.86.
- Non-parametric bootstrap methodology provides more accurate imprecision estimates than Hentschel's parametric approach.  
  > Our approach is non-parametric, agnostic about error distributions

## Applications
- option pricing
- risk management
- model selection for volatility indexes

## References cited
- Hentschel (2003)
- Jiang and Tian (2007)
- Andersen et al. (2011)
- Grover & Thomas (2012)

## See also
- [`years/2014.md`](../years/2014.md)
- [`speakers/rohini_grover.md`](../speakers/rohini_grover.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=50% (2/4), source=ocr(paddle)*

