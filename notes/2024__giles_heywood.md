---
type: Talk
title: Factor Drivers of the UK Residential Property Cycle
description: "The talk explores systematic factors driving UK residential property price cycles, focusing on a propagating wave of unrewarded risk."
timestamp: "2026-07-08T00:00:00Z"
year: 2024
date: ~
speaker: Giles Heywood
speaker_slug: giles_heywood
talk_type: Talk
time_slot: "15:31 - 15:51"
file_format: pptx
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2024/GilesHeywood.pptx"
file_local: "./_cache/files/2024/2024__giles_heywood.pptx"
slug: 2024__giles_heywood
status: archived
tags: [osqf, 2024, giles_heywood]
---

# Factor Drivers of the UK Residential Property Cycle

_2024 · Giles Heywood_

**Headline:** The talk explores systematic factors driving UK residential property price cycles, focusing on a propagating wave of unrewarded risk.

## Source
- File format: `pptx`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2024/GilesHeywood.pptx>
- Local: `./_cache/files/2024/2024__giles_heywood.pptx`
- Talk type: Talk
- Time slot: 15:31 - 15:51

## Topics
- real estate price indices
- factor models in real estate
- cyclical risk in property markets
- statistical modeling of housing cycles
- investment strategies in property
- econometric analysis of housing markets

## Methods
- Repeat Sales Index
- Linear Factor Model (LFM)
- Principal Component Analysis (PCA)
- Vector Autoregression (VAR)
- Backtesting

## Datasets used
- Land Registry Price Paid Data
- Energy Performance Certificate (EPC) data
- Ordnance Survey Code-Point Open geolocation data
- Nationwide House Price Indices

## Code & tools
- `data.table`
- `snowfall`
- `magrittr`
- `ggplot2`
- `forecast`
- `urca`
- `vars`
- `zoo`
- Shiny Apps

## Key findings
- Backtesting showed strong correlation between forecasts and actual property price spreads.  
  > Across all 29 forecasts and actuals correlate 0.88
- Holding period returns are explained by repeat sales indices and 3 PCA factors.  
  > holding period returns are accurately explained by repeat sales indices and 3 PCA factors
- Cyclical factors dominate spread returns over typical holding periods.  
  > spread return is dominated by cyclical factors 2,3 over typical holding periods
- VAR diagnostics showed significant causal relationships in price dynamics.  
  > serial.test Root Arch p:Z2causes p:Z3causes Z2R2adj Z3R2adj period yrs PIT 2016 0.43 0.99 0.13 0.06 0.04 0.99 0.98 18.0
- Location has secondary role to price-band (P) in regional price dynamics.  
  > location has a secondary role to P

## Applications
- real estate investment strategy
- risk forecasting in property markets
- statistical attribution of housing returns

## References cited
- Bailey, M. J., Muth, R. F., & Nourse, H. O. (1963)
- Meen, G. (1999)
- Nagaraja, C. H., Brown, L. D., & Wachter, S. M. (2014)
- OECD et al. (2013)
- Chi, B., Dennett, A., Oléron-Evans, T., & Morphet, R. (2021)

## See also
- [`years/2024.md`](../years/2024.md)
- [`speakers/giles_heywood.md`](../speakers/giles_heywood.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (5/5), source=ocr(paddle)*

