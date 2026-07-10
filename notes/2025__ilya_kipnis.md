---
type: Talk
title: Analyzing the Varadi Drawdown Adaptive Moving Average
description: "Exploration of Varadi's Drawdown Adaptive Moving Average, which adjusts EMA lookback periods based on trend direction using rolling drawdown percentiles."
timestamp: "2026-07-08T00:00:00Z"
year: 2025
date: ~
speaker: Ilya Kipnis
speaker_slug: ilya_kipnis
talk_type: Lightning
time_slot: "10:05 - 10:12"
file_format: pptx
file_url: "https://www.osqf.org/archive/2025/IlyaKipnis.pptx"
file_local: "./_cache/files/2025/2025__ilya_kipnis.pptx"
slug: 2025__ilya_kipnis
status: archived
tags: [osqf, 2025, ilya_kipnis]
---

# Analyzing the Varadi Drawdown Adaptive Moving Average

_2025 · Ilya Kipnis_

**Headline:** Exploration of Varadi's Drawdown Adaptive Moving Average, which adjusts EMA lookback periods based on trend direction using rolling drawdown percentiles.

## Source
- File format: `pptx`
- URL: <https://www.osqf.org/archive/2025/IlyaKipnis.pptx>
- Local: `./_cache/files/2025/2025__ilya_kipnis.pptx`
- Talk type: Lightning
- Time slot: 10:05 - 10:12

## Topics
- adaptive moving averages
- trend following

## Methods
- EMA calculation
- rolling drawdown percentile ranking

## Datasets used
*(none extracted)*

## Code & tools
*(none extracted)*

## Key findings
- The approach extends EMA lookback during uptrends and shortens it during downtrends to reduce losses and increase gains.  
  > Asset trends upward? Extend lookback of an EMA to stay in the trend. Asset trends down? Reduce lookback of an EMA to get out faster, get back in sooner.
- Dynamic EMA alpha is calculated as 1/((pct_rank * n_fast) + ((1-pct_rank) * n_slow))  
  > Dynamic EMA alpha = 1/((pct_rank * n_fast) + ((1-pct_rank) * n_slow))
- The method shows mixed results, with the author suggesting better trend following approaches may exist.  
  > Does it work? Not miraculously. There are probably better ways to trend follow than moving averages.

## Applications
- trend following

## References cited
- https://cssanalytics.wordpress.com/2020/12/23/how-should-trendfollowers-adjust-to-the-modern-environment-enter-adaptivemomentum/#:~:text=Notice%20that%20the%20adaptive%20moving,like%20vs%20typical%20static%20lookbacks:

## See also
- [`years/2025.md`](../years/2025.md)
- [`speakers/ilya_kipnis.md`](../speakers/ilya_kipnis.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

