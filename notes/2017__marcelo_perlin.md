---
type: Talk
title: GetHFDataAn R package for downloading and aggregating high frequency trading data from Bovespa
description: The GetHFData R package facilitates downloading and aggregating high-frequency trading data from Bovespa.
timestamp: "2026-07-08T00:00:00Z"
year: 2017
date: ~
speaker: Marcelo Perlin
speaker_slug: marcelo_perlin
talk_type: Lightning
time_slot: "09:40 - 10:10"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/MarcoPerlin.pdf"
file_local: "./_cache/files/2017/2017__marcelo_perlin.pdf"
slug: 2017__marcelo_perlin
status: archived
tags: [osqf, 2017, marcelo_perlin, high_frequency_trading_data]
---

# GetHFDataAn R package for downloading and aggregating high frequency trading data from Bovespa

_2017 · Marcelo Perlin (Universidade Federal do Rio Grande do Sul (UFRGS))_

**Headline:** The GetHFData R package facilitates downloading and aggregating high-frequency trading data from Bovespa.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/MarcoPerlin.pdf>
- Local: `./_cache/files/2017/2017__marcelo_perlin.pdf`
- Talk type: Lightning
- Time slot: 09:40 - 10:10

## Topics
- high-frequency trading data
- R package development
- data aggregation
- financial data analysis

## Methods
- xts for time series analysis
- dplyr for data manipulation
- data.table for efficient data handling
- highfrequency for high-frequency data analysis

## Datasets used
- Bovespa equity trade data
- Bovespa derivatives trade data

## Code & tools
- `GetHFData`
- `quantmod`
- `BatchGetSymbols`
- `tidyquant`
- `data.table`
- `xts`
- `highfrequency`

## Key findings
- The package provides one-line code to download raw or aggregated trade data.  
  > Users can download raw or aggregated trade data in one line of code
- It supports filtering by tickers, dates, and market types (equity/derivatives).  
  > Choices of tickers and dates are possible
- The package interfaces directly with Bovespa's FTP site.  
  > The package works by creating an interface to Bovespa's ftp site

## Applications
- financial research
- high-frequency trading analysis
- data aggregation for academic studies

## References cited
- Boudt, Kris, Jonathan Cornelissen, and Scott Payseur. 2017. Highfrequency: Tools for Highfrequency Data Analysis.
- Dancho, Matt, and Davis Vaughan. 2017. Tidyquant: Tidy Quantitative Financial Analysis.
- Dowle, Matt, and Arun Srinivasan. 2017. Data.table: Extension of 'Data.frame'.
- Perlin, Marcelo. 2016. BatchGetSymbols: Downloads and Organizes Financial Data for Multiple Tickers.
- Perlin, Marcelo. 2017. GetHFData: Download and Aggregate High Frequency Trading Data from Bovespa.
- Ryan, Jeffrey A. 2017. Quantmod: Quantitative Financial Modelling Framework.

## See also
- [`years/2017.md`](../years/2017.md)
- [`speakers/marcelo_perlin.md`](../speakers/marcelo_perlin.md)
- [`topics/high_frequency_trading_data.md`](../topics/high_frequency_trading_data.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

