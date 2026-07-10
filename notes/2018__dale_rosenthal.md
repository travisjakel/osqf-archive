---
type: Talk
title: A Tour of Financial Modeling
description: "Explores financial modeling across markets using the brew spread, cointegration, and O-U processes to infer business insights."
timestamp: "2026-07-08T00:00:00Z"
year: 2018
date: ~
speaker: Dale Rosenthal
speaker_slug: dale_rosenthal
talk_type: Tutorial
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/DaleRosenthal.pdf"
file_local: "./_cache/files/2018/2018__dale_rosenthal.pdf"
slug: 2018__dale_rosenthal
status: archived
tags: [osqf, 2018, dale_rosenthal, financial_modeling]
---

# A Tour of Financial Modeling

_2018 · Dale Rosenthal (Q36)_

**Headline:** Explores financial modeling across markets using the brew spread, cointegration, and O-U processes to infer business insights.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/DaleRosenthal.pdf>
- Local: `./_cache/files/2018/2018__dale_rosenthal.pdf`
- Talk type: Tutorial

## Topics
- financial modeling
- spread analysis
- cointegration
- Ornstein-Uhlenbeck models
- industry profitability

## Methods
- Ornstein-Uhlenbeck model estimation
- cointegration analysis (urca package)
- linear regression for spread parameters

## Datasets used
- US daily futures end-of-day settlement prices (Quandl: CHRIS/CME_NG1, C1, CU1, EH1)

## Code & tools
- R
- `xts`
- `Quandl`
- `urca`
- lm()
- ca.jo()

## Key findings
- O-U model explains 96.5% of brew spread variation (R²=0.9651)  
  > R² = terrible metric, but good we explain 96.5% of variation.
- Cointegration test confirms 1 long-term relationship between ethanol, corn, and natgas  
  > Reject test for 0 relationships: 57.41 > 34.91, 41.07.
- Brew spread volatility decreased post-2014 with stable mean-reversion parameters  
  > More recently has largely stayed b/w 0 and $1/bu.

## Applications
*(none extracted)*

## References cited
- farmdocdaily.illinois.edu/2017/02/...

## See also
- [`years/2018.md`](../years/2018.md)
- [`speakers/dale_rosenthal.md`](../speakers/dale_rosenthal.md)
- [`topics/financial_modeling.md`](../topics/financial_modeling.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

