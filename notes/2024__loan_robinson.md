---
type: Talk
title: The Impact of R and R Shiny in Finance
description: Demonstration of R Shiny applications for financial market dashboards with real-time data visualization and interactive components.
timestamp: "2026-07-08T00:00:00Z"
year: 2024
date: ~
speaker: Loan Robinson
speaker_slug: loan_robinson
talk_type: Talk
time_slot: "10:05 - 10:25"
file_format: pptx
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2024/LoanRobinson.pptx"
file_local: "./_cache/files/2024/2024__loan_robinson.pptx"
slug: 2024__loan_robinson
status: archived
tags: [osqf, 2024, loan_robinson]
---

# The Impact of R and R Shiny in Finance

_2024 · Loan Robinson_

**Headline:** Demonstration of R Shiny applications for financial market dashboards with real-time data visualization and interactive components.

## Source
- File format: `pptx`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2024/LoanRobinson.pptx>
- Local: `./_cache/files/2024/2024__loan_robinson.pptx`
- Talk type: Talk
- Time slot: 10:05 - 10:25

## Topics
- financial dashboards
- R Shiny applications
- data visualization in finance

## Methods
- Plotly package for treemap visualization
- web scraping with Quantmod package
- R Shiny module architecture

## Datasets used
*(none extracted)*

## Code & tools
- R Shiny
- plotly::plot_ly
- `Quantmod`
- GitHub (https://github.com/loankimrobinson/stock_market_conference)

## Key findings
- R Shiny enables real-time financial dashboard updates with interactive treemap visualizations.  
  > plotly::plot_ly(type = "treemap", data = sector(), labels = label), parents = parent, ids = -Sector, values = Weight
- The app integrates web scraping and Quantmod for dynamic stock data retrieval.  
  > Web Scraping and Quantmod package
- User interface includes pickerInput and dateInput for customizable data exploration.  
  > UI PickerInput(dateInput) Output Input()

## Applications
- market dashboard components
- financial data visualization
- interactive report generation

## References cited
*(none extracted)*

## See also
- [`years/2024.md`](../years/2024.md)
- [`speakers/loan_robinson.md`](../speakers/loan_robinson.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3), source=ocr(paddle)*

