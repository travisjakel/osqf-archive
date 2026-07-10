---
type: Talk
title: Efficient Multivariate Analysis of Change Points
description: The talk presents a method for detecting change points in multivariate time series using energy distance and the e-cp3o procedure.
timestamp: "2026-07-08T00:00:00Z"
year: 2015
date: ~
speaker: Nicholas James
speaker_slug: nicholas_james
talk_type: Talk
time_slot: "14:03 - 14:23"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/NicholasJames.pdf"
file_local: "./_cache/files/2015/2015__nicholas_james.pdf"
slug: 2015__nicholas_james
status: archived
tags: [osqf, 2015, nicholas_james, change_point_analysis]
---

# Efficient Multivariate Analysis of Change Points

_2015 · Nicholas James (Cornell University)_

**Headline:** The talk presents a method for detecting change points in multivariate time series using energy distance and the e-cp3o procedure.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/NicholasJames.pdf>
- Local: `./_cache/files/2015/2015__nicholas_james.pdf`
- Talk type: Talk
- Time slot: 14:03 - 14:23

## Topics
- change point analysis
- multivariate time series
- energy distance
- statistical methods for time series

## Methods
- e-cp3o procedure
- energy distance calculation

## Datasets used
*(none extracted)*

## Code & tools
- R

## Key findings
- Change point analysis partitions time series into homogeneous segments, also called break points, breakouts, or regime changes.  
  > • Partition time series into homogeneous segments.
• Also refereed to by other names.
◦ Break points
◦ Breakouts
◦ Regime changes
- The energy distance between distributions is defined as 2E|X1−Y1|α −E|X1−X2|α −E|Y1−Y2|α.  
  > E(X1 , Y1 |α) = 2E|X1 − Y1 |α − E|X1 − X2 |α − E|Y1 − Y2 |α
- The best partitioning with k change points is found by maximizing the sum of divergence measures across segments.  
  > βk (T ) = max R(Cb 0 , C1 |α)+R(Cb 1 , C2 |α)+· · ·+R(Cb k−1 , Ck |α).
- The algorithm has O(kT³) time complexity but is too slow for practical use in R.  
  > Can find τ̂1 , . . . , τ̂k in O(kT 3 ) time.

Finding change points using R
b is too slow.

## Applications
- financial time series analysis (Ebay price example)

## References cited
*(none extracted)*

## See also
- [`years/2015.md`](../years/2015.md)
- [`speakers/nicholas_james.md`](../speakers/nicholas_james.md)
- [`topics/change_point_analysis.md`](../topics/change_point_analysis.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=50% (2/4)*

