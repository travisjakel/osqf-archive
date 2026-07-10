---
type: Talk
title: Performance Estimation with the Sharpe Ratio
description: "The talk explores the Sharpe Ratio's role in performance estimation, statistical inference, and portfolio optimization, linking it to classical statistics and providing tools for analysis."
timestamp: "2026-07-08T00:00:00Z"
year: 2022
date: ~
speaker: Steven Pav
speaker_slug: steven_pav
talk_type: Talk
time_slot: "13:45 - 14:05"
file_format: html
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2022/StevenPav.html"
file_local: "./_cache/files/2022/2022__steven_pav.html"
slug: 2022__steven_pav
status: archived
tags: [osqf, 2022, steven_pav, sharpe_ratio, t_statistic]
---

# Performance Estimation with the Sharpe Ratio

_2022 · Steven Pav (Opendoor)_

**Headline:** The talk explores the Sharpe Ratio's role in performance estimation, statistical inference, and portfolio optimization, linking it to classical statistics and providing tools for analysis.

## Source
- File format: `html`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2022/StevenPav.html>
- Local: `./_cache/files/2022/2022__steven_pav.html`
- Talk type: Talk
- Time slot: 13:45 - 14:05

## Topics
- Sharpe Ratio
- Signal-Noise Ratio
- statistical inference
- portfolio optimization
- hedging
- quantitative investing

## Methods
- t-statistic
- Hotelling's T² statistic
- Markowitz portfolio optimization
- Sharpe Ratio Information Criterion (SRIC)
- conditional portfolios via flattening

## Datasets used
- Fama-French 4 factors (monthly mff4)
- Fama-French 4 factors (daily dff4)

## Code & tools
- SharpeR (R package)
- MarkowitzR (R package)
- `as.sr`
- `sr_test`
- `mp_vcov`
- The Sharpe Ratio: Statistics and Applications (book)

## Key findings
- Sharpe ratio connects to classical statistics via t-distribution and Hotelling's T²  
  > If returns were normal, the Sharpe ratio would follow a (non-central) t distribution...
- SRIC adjusts for estimation error in achieved Sharpe ratio  
  > SRIC = \hat{\zeta}_* - \frac{k-1}{n\hat{\zeta}_*} (Paulsen and Söhl (2020))
- Hedging reduces portfolio SNR while maintaining uncorrelatedness  
  > Hedge out Momentum (UMD)... SR/sqrt(yr) decreased from 1.07 to 0.95

## Applications
- portfolio optimization
- hedging
- performance estimation

## References cited
- Bao (2009)
- Brandt and Santa-Clara (2006)
- Britten-Jones (1999)
- Hall and Wang (2004)
- Johnson and Welch (1940)
- Kan and Zhou (2012)
- Mertens (2002)
- Michaud (1989)
- Paulsen and Söhl (2020)
- Pav (2013, 2020, 2021)
- Roy (1952)
- Sharpe (1965)

## See also
- [`years/2022.md`](../years/2022.md)
- [`speakers/steven_pav.md`](../speakers/steven_pav.md)
- [`topics/sharpe_ratio.md`](../topics/sharpe_ratio.md)
- [`methods/t_statistic.md`](../methods/t_statistic.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3)*

