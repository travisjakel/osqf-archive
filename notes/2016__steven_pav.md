---
type: Talk
title: Madnessa package for Multivariate Automatic Differentiation
description: "The 'madness' R package implements multivariate automatic differentiation for statistical computing with array-to-array operations."
timestamp: "2026-07-08T00:00:00Z"
year: 2016
date: ~
speaker: Steven Pav
speaker_slug: steven_pav
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/StevenPav.pdf"
file_local: "./_cache/files/2016/2016__steven_pav.pdf"
slug: 2016__steven_pav
status: archived
tags: [osqf, 2016, steven_pav]
---

# Madnessa package for Multivariate Automatic Differentiation

_2016 · Steven Pav (Gilgamath Consulting)_

**Headline:** The 'madness' R package implements multivariate automatic differentiation for statistical computing with array-to-array operations.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/StevenPav.pdf>
- Local: `./_cache/files/2016/2016__steven_pav.pdf`
- Talk type: Lightning

## Topics
- automatic differentiation
- R package development
- multivariate statistical methods
- numerical differentiation

## Methods
- forward accumulation
- chain rule
- matrix operations

## Datasets used
*(none extracted)*

## Code & tools
- `madness`
- `numDeriv`
- R

## Key findings
- The package supports array-to-array operations with derivative dimensions matching output/input sizes.  
  > If v <- f(x), then dim(dvdx(f)) == c(length(v),length(x)).
- Derivatives are computed via forward accumulation and chain rule without NSE tricks.  
  > Derivatives via forward accumulation and chain rule. No fancy tricks like NSE.
- Demonstrated Markowitz portfolio optimization using twomoments and solve()  
  > show(val(t(the_mp))) ## [,1] [,2] [,3] ## [1,] 0.013 0.013 0.022

## Applications
- statistical computing
- portfolio optimization
- delta method calculations

## References cited
*(none extracted)*

## See also
- [`years/2016.md`](../years/2016.md)
- [`speakers/steven_pav.md`](../speakers/steven_pav.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

