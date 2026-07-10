---
type: Talk
title: "screen: Yahoo Finance Screener in R and Python"
description: "yfscreen is an R and Python package that provides simple access to Yahoo Finance's screener functionality for querying financial data."
timestamp: "2026-07-08T00:00:00Z"
year: 2025
date: ~
speaker: Jason Foster
speaker_slug: jason_foster
talk_type: Lightning
time_slot: "14:45 - 14:52"
file_format: pdf
file_url: "https://www.osqf.org/archive/2025/JasonFoster.pdf"
file_local: "./_cache/files/2025/2025__jason_foster.pdf"
slug: 2025__jason_foster
status: archived
tags: [osqf, 2025, jason_foster, financial_data_retrieval]
---

# screen: Yahoo Finance Screener in R and Python

_2025 · Jason Foster_

**Headline:** yfscreen is an R and Python package that provides simple access to Yahoo Finance's screener functionality for querying financial data.

## Source
- File format: `pdf`
- URL: <https://www.osqf.org/archive/2025/JasonFoster.pdf>
- Local: `./_cache/files/2025/2025__jason_foster.pdf`
- Talk type: Lightning
- Time slot: 14:45 - 14:52

## Topics
- financial data retrieval
- screening tools
- R/Python integration
- API abstraction

## Methods
- filter-based querying with comparison operators (gt/lt/btwn)
- JSON payload generation
- session management
- pagination handling

## Datasets used
*(none extracted)*

## Code & tools
- `yfscreen`
- R
- `Python`
- `yahooquery`
- `openbb`
- `yfinance`
- `CRAN`
- `devtools`
- `PyPI`
- `GitHub`

## Key findings
- The package abstracts API complexities like crumb handling and JSON payload generation  
  > Abstracts API complexities: Coverage across security types: ■ Session management ■ Crumb and cookie handling ■ Query construction ■ Pagination ■ JSON payload generation
- Supports equities, mutual funds, ETFs, indices, and futures  
  > Coverage across security types: ■ Equities ■ Mutual funds ■ ETFs ■ Indices ■ Futures
- Provides R and Python implementations with identical functionality  
  > Available in both R and Python!
- Includes predefined screeners for common financial queries  
  > Predefined screeners using yahooquery: from yahooquery import Screener s = Screener() s.get_screeners(["most_actives", "day_gainers"])
- Enables advanced filtering with field-specific operators  
  > Build a query using filters with a comparison operator ("gt", "lt", "eq", or "btwn")

## Applications
- equity screening
- fund analysis
- market research

## References cited
*(none extracted)*

## See also
- [`years/2025.md`](../years/2025.md)
- [`speakers/jason_foster.md`](../speakers/jason_foster.md)
- [`topics/financial_data_retrieval.md`](../topics/financial_data_retrieval.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=80% (4/5), source=ocr(paddle)*

