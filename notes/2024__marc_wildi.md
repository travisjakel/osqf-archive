---
type: Talk
title: "Forecasting vs. Looking-Ahead: Instilling Effective Leads into Classic Forecast Designs"
description: "The talk critiques classic forecasting's reliance on MSE, introducing novel 'Look Ahead' criteria (MSE-LA) to decouple forecasts from present data and improve lead times in business-cycle analysis."
timestamp: "2026-07-08T00:00:00Z"
year: 2024
date: ~
speaker: Marc Wildi
speaker_slug: marc_wildi
talk_type: Talk
time_slot: "11:42 - 12:02"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2024/MarcWildi.pdf"
file_local: "./_cache/files/2024/2024__marc_wildi.pdf"
slug: 2024__marc_wildi
status: archived
tags: [osqf, 2024, marc_wildi, forecasting]
---

# Forecasting vs. Looking-Ahead: Instilling Effective Leads into Classic Forecast Designs

_2024 · Marc Wildi (Institute of data analysis and process design (ZHAW))_

**Headline:** The talk critiques classic forecasting's reliance on MSE, introducing novel 'Look Ahead' criteria (MSE-LA) to decouple forecasts from present data and improve lead times in business-cycle analysis.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2024/MarcWildi.pdf>
- Local: `./_cache/files/2024/2024__marc_wildi.pdf`
- Talk type: Talk
- Time slot: 11:42 - 12:02

## Topics
- forecasting
- business-cycle analysis
- statistical signal processing
- time-series modeling
- mean-square error optimization

## Methods
- cross-correlation analysis
- Hodrick-Prescott filtering
- MSE-LA criteria (decoupling from present)
- phase-lag function analysis
- filter coefficient scaling

## Datasets used
- US-INDPRO (monthly)
- US-GDP

## Code & tools
*(none extracted)*

## Key findings
- Classic MSE forecasts peak at lag zero (no lead), while MSE-LA achieves ~1-month lead in business-cycle analysis.  
  > CC of MSE (green) peaks at lag zero: bonded to present time (no lead)... leads by ≈ one month at zero-crossings
- MSE-LA with weak decoupling (α0=0.44) achieves 2.5-month mean lead vs. MSE's 0-month lead.  
  > Mean Lead 0.00 2.50 5.00... for MSE, MSE-LA weak, MSE-LA complete
- Stronger decoupling (α0=0) shifts forecasts left by 5 months but reduces CC at the target horizon.  
  > Stronger decoupling: Increasing Left-Shift... Jan 2020 Jan 2024

## Applications
- real-time business-cycle analysis (nowcasting)

## References cited
- Trilemma, MDFA: new book by McElroy and Wildi near completion

## See also
- [`years/2024.md`](../years/2024.md)
- [`speakers/marc_wildi.md`](../speakers/marc_wildi.md)
- [`topics/forecasting.md`](../topics/forecasting.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3), source=ocr(paddle)*

