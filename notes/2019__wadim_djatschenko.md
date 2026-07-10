---
type: Talk
title: "BondValuation: An R Package for Fixed Coupon Bond Analysis"
description: "Presentation of the BondValuation R package for fixed coupon bond analysis, focusing on day count conventions, irregular coupon periods, and data quality."
timestamp: "2026-07-08T00:00:00Z"
year: 2019
date: ~
speaker: Wadim Djatschenko
speaker_slug: wadim_djatschenko
talk_type: Lightning
time_slot: "09:11 - 09:17"
file_format: pptx
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/Djatschenko.pptx"
file_local: "./_cache/files/2019/2019__wadim_djatschenko.pptx"
slug: 2019__wadim_djatschenko
status: archived
tags: [osqf, 2019, wadim_djatschenko]
---

# BondValuation: An R Package for Fixed Coupon Bond Analysis

_2019 · Wadim Djatschenko (European University Viadrina Frankfurt (Oder), Germany)_

**Headline:** Presentation of the BondValuation R package for fixed coupon bond analysis, focusing on day count conventions, irregular coupon periods, and data quality.

## Source
- File format: `pptx`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/Djatschenko.pptx>
- Local: `./_cache/files/2019/2019__wadim_djatschenko.pptx`
- Talk type: Lightning
- Time slot: 09:11 - 09:17

## Topics
- fixed coupon bond analysis
- day count conventions
- irregular coupon periods
- data quality in bond data
- R package development

## Methods
- classification of day count conventions
- AnnivDates() function for data sanity checks
- handling of irregular coupon periods

## Datasets used
- CRAN (package repository)

## Code & tools
- `BondValuation`
- AnnivDates()

## Key findings
- Day count conventions lack standardization, leading to potential calculation errors.  
  > No central authority defines/enforces day count conventions.
- Ignoring irregular coupon periods can result in significant cash flow errors (e.g., 16.210 Billion USD error).  
  > ignoring irreg. first and final periods: aggr. absolute cash flow calculation error... 16.210 Billion USD.
- The AnnivDates() function automatically corrects unambiguous data errors and identifies inconsistencies.  
  > performs sanity checks... identifies and reports inconsistencies.

## Applications
- fixed coupon bond valuation
- yield and price sensitivity calculations
- data quality assessment

## References cited
- Djatschenko Wadim (2018). BondValuation: Fixed Coupon Bond Valuation Allowing for Odd Coupon Periods and Various Day Count Conventions. R package version 0.1.0. https://CRAN.R-project.org/package=BondValuation.
- Djatschenko, Wadim (2018). BondValuation: An R Package for Fixed Coupon Bond Analysis. SSRN: https://ssrn.com/abstract=3292955.
- Djatschenko, Wadim (2019). The Nitty Gritty of Bond Valuation: A Generalized Methodology for Fixed Coupon Bond Analysis. SSRN: https://ssrn.com/abstract=3205167.

## See also
- [`years/2019.md`](../years/2019.md)
- [`speakers/wadim_djatschenko.md`](../speakers/wadim_djatschenko.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

