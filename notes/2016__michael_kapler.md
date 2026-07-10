---
type: Talk
title: Tax Aware Backtest Framework
description: "A backtest framework that accounts for US tax rules including capital gains, wash-sale rules, and dividend taxation in taxable accounts."
timestamp: "2026-07-08T00:00:00Z"
year: 2016
date: ~
speaker: Michael Kapler
speaker_slug: michael_kapler
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/MichaelKapler.pdf"
file_local: "./_cache/files/2016/2016__michael_kapler.pdf"
slug: 2016__michael_kapler
status: archived
tags: [osqf, 2016, michael_kapler]
---

# Tax Aware Backtest Framework

_2016 · Michael Kapler (Systematic Investor Blog)_

**Headline:** A backtest framework that accounts for US tax rules including capital gains, wash-sale rules, and dividend taxation in taxable accounts.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/MichaelKapler.pdf>
- Local: `./_cache/files/2016/2016__michael_kapler.pdf`
- Talk type: Lightning

## Topics
- tax-aware backtesting
- capital gains taxation
- dividend taxation
- investment performance metrics

## Methods
- custom tax rule specification
- tax cash flow modeling

## Datasets used
*(none extracted)*

## Code & tools
- R
- `Rcpp`

## Key findings
- The framework adjusts for short/long-term capital gains, wash-sale rules, and qualified/nonqualified dividend taxes.  
  > Backtest Framework that properly accounts for US tax laws: Long/Short Term Capital Gain Taxes Wash-Sale Rule Qualified and Non-Qualified Dividend Taxes
- After-tax performance can differ significantly from before-tax metrics, with implied tax rates up to 29.8%.  
  > Implied Tax Rate 29.8% = 1 - 5.9/8.4
- The tool does not make tax decisions but helps evaluate strategies in taxable accounts.  
  > It does NOT suggest optimal tax decisions.
- Future work includes Rcpp parallelization for optimal tax decision suggestions.  
  > Rcpp Parallel version of the Tax Aware Backtest Framework to suggest optimal tax decisions

## Applications
- taxable account performance evaluation

## References cited
*(none extracted)*

## See also
- [`years/2016.md`](../years/2016.md)
- [`speakers/michael_kapler.md`](../speakers/michael_kapler.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=75% (3/4), source=ocr(paddle)*

