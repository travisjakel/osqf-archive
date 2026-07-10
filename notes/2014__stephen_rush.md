---
type: Talk
title: Twenty Years of VPIN
description: "Analysis of VPIN (Volume Synchronized Probability of Informed Trading) over 20 years, covering models, econometrics, and applications to mergers/acquisitions."
timestamp: "2026-07-08T00:00:00Z"
year: 2014
date: ~
speaker: Stephen Rush
speaker_slug: stephen_rush
talk_type: Talk
time_slot: "10:54 - 11:14"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/StephenRush.pdf"
file_local: "./_cache/files/2014/2014__stephen_rush.pdf"
slug: 2014__stephen_rush
status: archived
tags: [osqf, 2014, stephen_rush, informed_trading]
---

# Twenty Years of VPIN

_2014 · Stephen Rush (The University of Connecticut School of Business)_

**Headline:** Analysis of VPIN (Volume Synchronized Probability of Informed Trading) over 20 years, covering models, econometrics, and applications to mergers/acquisitions.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/StephenRush.pdf>
- Local: `./_cache/files/2014/2014__stephen_rush.pdf`
- Talk type: Talk
- Time slot: 10:54 - 11:14

## Topics
- informed trading
- market microstructure
- econometric modeling
- liquidity analysis

## Methods
- single stock regressions
- panel regressions with fixed effects
- quantile regressions
- logit/multinomial logit models
- event study analysis

## Datasets used
- TAQ Data from 1993 through 2013

## Code & tools
- `data.table`
- `plyr`
- `reshape2`
- `plm`
- `quantreg`
- `ggplot2`
- BitTorrent Sync
- Amazon Glacier

## Key findings
- VPIN shows significant negative correlation with volume (-0.58) and positive correlation with excess returns.  
  > • Avg correlation between volume and PIN was -0.58 • Positive correlation between PIN and excess returns
- VPIN remains significant in quantile regressions across multiple percentiles.  
  > • Check 10%, 25%, 50%, 75%, 90% • Idiosyncratic CDF factor remains significant
- VPIN has limited predictive power for mergers/acquisitions within ±2 day event window.  
  > • Event Study - not significant within a T ± 2 day event period

## Applications
- predictive analytics for mergers and acquisitions

## References cited
- Lee-Reedy Algorithm (1991)
- Easley, O’Hara, and Paperman (1996)
- Easley, Hvidkjaer, and O’Hara (2002)
- Easley, Lopez de Prado, and O’Hara (2012)

## See also
- [`years/2014.md`](../years/2014.md)
- [`speakers/stephen_rush.md`](../speakers/stephen_rush.md)
- [`topics/informed_trading.md`](../topics/informed_trading.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3)*

