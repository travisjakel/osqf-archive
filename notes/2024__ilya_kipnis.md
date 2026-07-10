---
type: Talk
title: Constant Maturity Treasury Alpha with ETF Bond Rotation Strategy
description: A bond rotation strategy using ETF momentum and term structure analysis to generate alpha
timestamp: "2026-07-08T00:00:00Z"
year: 2024
date: ~
speaker: Ilya Kipnis
speaker_slug: ilya_kipnis
talk_type: Lightning
time_slot: "15:24 - 15:31"
file_format: pptx
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2024/IlyaKipnis.pptx"
file_local: "./_cache/files/2024/2024__ilya_kipnis.pptx"
slug: 2024__ilya_kipnis
status: archived
tags: [osqf, 2024, ilya_kipnis]
---

# Constant Maturity Treasury Alpha with ETF Bond Rotation Strategy

_2024 · Ilya Kipnis_

**Headline:** A bond rotation strategy using ETF momentum and term structure analysis to generate alpha

## Source
- File format: `pptx`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2024/IlyaKipnis.pptx>
- Local: `./_cache/files/2024/2024__ilya_kipnis.pptx`
- Talk type: Lightning
- Time slot: 15:24 - 15:31

## Topics
- ETF rotation strategies
- term structure analysis
- momentum trading
- risk management

## Methods
- 6-month momentum calculation
- term structure sign analysis
- leverage adjustment based on curve sign mean

## Datasets used
- FRED DGS3MO, DGS6MO, DGS1, DGS2, DGS3, DGS5, DGS10, DGS20, DGS30

## Code & tools
- R (c(), paste0())

## Key findings
- Strategy rebalances monthly into top 3 ETFs with positive momentum  
  > Every month, calculate 6 month momentum for following set of ETFs: c("SHY", "IEF", "TLT", "TIP", "LQD", "HYG", "EMB")
- Term structure analysis adds alpha through volatility patterns  
  > From personal vol trading experience, I know that vol term structure can add 'alpha'
- Leverage adjustments based on term structure sign mean  
  > if curve_sign_mean is 1, leverage up 25%, otherwise, max(0, curve_sign_mean - 25%)

## Applications
- portfolio management
- risk control

## References cited
- Paul Novell's Bond Rotation Strategy

## See also
- [`years/2024.md`](../years/2024.md)
- [`speakers/ilya_kipnis.md`](../speakers/ilya_kipnis.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

