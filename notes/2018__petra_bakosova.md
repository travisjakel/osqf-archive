---
type: Talk
title: "Seasonal Effect, Trends and Pre-Announcement DriftsFrom Anomalies to Trades"
description: "The talk revisits seasonal effects, announcement drifts, and momentum anomalies, proposing investment strategies that combine models like Sell-in-May (SIM), Turn of the Month (TOM), Federal Open Market Committee (FOMC), and State Dependent Momentum (SDM) using return-to-risk optimization."
timestamp: "2026-07-08T00:00:00Z"
year: 2018
date: ~
speaker: Petra Bakosova
speaker_slug: petra_bakosova
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/PetraBakosova.pdf"
file_local: "./_cache/files/2018/2018__petra_bakosova.pdf"
slug: 2018__petra_bakosova
status: archived
tags: [osqf, 2018, petra_bakosova]
---

# Seasonal Effect, Trends and Pre-Announcement DriftsFrom Anomalies to Trades

_2018 · Petra Bakosova_

**Headline:** The talk revisits seasonal effects, announcement drifts, and momentum anomalies, proposing investment strategies that combine models like Sell-in-May (SIM), Turn of the Month (TOM), Federal Open Market Committee (FOMC), and State Dependent Momentum (SDM) using return-to-risk optimization.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/PetraBakosova.pdf>
- Local: `./_cache/files/2018/2018__petra_bakosova.pdf`
- Talk type: Lightning

## Topics
- seasonal effects
- pre-announcement drifts
- trend models
- combining anomalies

## Methods
- Sell-in-May (SIM)
- Turn of the Month (TOM)
- Federal Open Market Committee (FOMC)
- State Dependent Momentum (SDM)
- walk-forward optimization
- Mean-Variance Optimization

## Datasets used
- total return S&P 500 dataset starting in 1975

## Code & tools
*(none extracted)*

## Key findings
- Combining multiple anomaly models (SIM, TOM, FOMC, SDM) via return-to-risk optimization improves performance compared to individual strategies.  
  > we proceed to form, in a walk forward manner, an optimized combination of the four models using a return to risk optimization procedure.
- FOMC pre-announcement drift shows statistically significant Sharpe ratio differences between announcement and non-announcement days.  
  > SR FOMC 5.60, SR non-FOMC 0.34, r FOMC - r other 0.36%.
- State Dependent Momentum (SDM) uses a 200-day moving average to predict market returns in good and bad states.  
  > 2-State Predictive regression [Huang et al., 2017]: r t+1 = α + β good · I good,t · Z t + β bad · (1 − I good,t) · Z t + ε t+1

## Applications
- investment strategies
- portfolio optimization

## References cited
- Huang et al., 2017
- Markowitz, 1952

## See also
- [`years/2018.md`](../years/2018.md)
- [`speakers/petra_bakosova.md`](../speakers/petra_bakosova.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3), source=ocr(paddle)*

