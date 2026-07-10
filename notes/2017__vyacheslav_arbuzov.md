---
type: Talk
title: Dividend strategytowards the efficient market
description: Analysis of dividend strategies and their relation to market efficiency using statistical models and ex-dividend day anomalies
timestamp: "2026-07-08T00:00:00Z"
year: 2017
date: ~
speaker: Vyacheslav Arbuzov
speaker_slug: vyacheslav_arbuzov
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/VyacheslavArbuzov.pdf"
file_local: "./_cache/files/2017/2017__vyacheslav_arbuzov.pdf"
slug: 2017__vyacheslav_arbuzov
status: archived
tags: [osqf, 2017, vyacheslav_arbuzov]
---

# Dividend strategytowards the efficient market

_2017 · Vyacheslav Arbuzov (Olympia Capital, Perm State University, Criptoeconomics & Blockchain Systems Lab)_

**Headline:** Analysis of dividend strategies and their relation to market efficiency using statistical models and ex-dividend day anomalies

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/VyacheslavArbuzov.pdf>
- Local: `./_cache/files/2017/2017__vyacheslav_arbuzov.pdf`
- Talk type: Lightning

## Topics
- dividend strategy
- market efficiency
- ex-dividend day anomaly
- tax effects
- statistical modeling

## Methods
- logistic regression (glm with binomial family)
- night gap return calculation

## Datasets used
- dividend_train_sample (custom dataset, variables: Target, discr_volume, discr_HLC_vol, discr_MDTV3, discr_Morning_runtest, discr_Evening_kurtosis, discr_Evening_skew, relative_dividend, day_return)

## Code & tools
- R (glm function)

## Key findings
- Negative correlation exists between night gap returns and dividend yields  
  > ✓ a negative correlation exists between gap and dividend yields
- Stock price drops less than the dividend payment amount  
  > ✓ stock price drops less than the dividend payment
- Tax exclusion reduces the size of the ex-dividend day price gap  
  > ✓ excluding tax from dividend, gives in median, the size of gap

## Applications
- dividend strategy optimization
- market efficiency analysis

## References cited
- Campbell, Beranek (1955)
- Elton, Gruber (1970)
- Frank, Jagannathan (1998)

## See also
- [`years/2017.md`](../years/2017.md)
- [`speakers/vyacheslav_arbuzov.md`](../speakers/vyacheslav_arbuzov.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

