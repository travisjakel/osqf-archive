---
type: Talk
title: Modeling and analysis of financial crashes using empirical market microstructure with parallel computations in R
description: "Using R with parallel computing and empirical market microstructure to model financial crashes, focusing on bubble detection via the LPPL model."
timestamp: "2026-07-08T00:00:00Z"
year: 2013
date: ~
speaker: Vyacheslav Arbuzov
speaker_slug: vyacheslav_arbuzov
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/VyacheslavArbuzov.pdf"
file_local: "./_cache/files/2013/2013__vyacheslav_arbuzov.pdf"
slug: 2013__vyacheslav_arbuzov
status: archived
tags: [osqf, 2013, vyacheslav_arbuzov]
---

# Modeling and analysis of financial crashes using empirical market microstructure with parallel computations in R

_2013 · Vyacheslav Arbuzov (Perm State National Research University)_

**Headline:** Using R with parallel computing and empirical market microstructure to model financial crashes, focusing on bubble detection via the LPPL model.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/VyacheslavArbuzov.pdf>
- Local: `./_cache/files/2013/2013__vyacheslav_arbuzov.pdf`
- Talk type: Lightning

## Topics
- financial crashes
- market microstructure
- bubble detection
- order flow analysis
- parallel computing in R

## Methods
- Log Periodic Power Law (LPPL) model
- parallel computations in R
- analysis of order flow characteristics (frequency, width, volume)

## Datasets used
- Moscow exchange orderlog data

## Code & tools
- `rusquant`
- `RODBC`
- `t.test`
- `nls`
- `r-group.mifit.ru`

## Key findings
- The LPPL model effectively detects bubbles by analyzing accelerating oscillations in asset prices.  
  > Model has been developed as a flexible tool to detect bubbles. The LPPL model considers the faster-than-exponential increase in asset prices decorated by accelerating oscillations as the main diagnostic of bubbles…
- Parallel R computations were used to process market microstructure data from the Russian financial market (2010–2012).  
  > Results of modeling bubbles (Russian financial market, 2010 – 2012)
- Microstructure changes (e.g., order flow volume, duration) differ significantly between 'normal' and 'hot' market conditions.  
  > In each bubble, we calculated changes of characteristics from NORMAL to HOT situation…

## Applications
- financial crash analysis
- bubble detection
- market microstructure analysis

## References cited
- A.Johansen, O.Ledoit, D.Sornette (JLS)

## See also
- [`years/2013.md`](../years/2013.md)
- [`speakers/vyacheslav_arbuzov.md`](../speakers/vyacheslav_arbuzov.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3)*

