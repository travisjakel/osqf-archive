---
type: Talk
title: Assessing the impact of extreme specific news events on forward returns
description: A framework for identifying and assessing the impact of extreme specific news events on forward returns
timestamp: "2026-07-08T00:00:00Z"
year: 2022
date: ~
speaker: Kyle Balkissoon
speaker_slug: kyle_balkissoon
talk_type: Talk
time_slot: "14:50 - 15:10"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2022/KyleBalkissoon.pdf"
file_local: "./_cache/files/2022/2022__kyle_balkissoon.pdf"
slug: 2022__kyle_balkissoon
status: archived
tags: [osqf, 2022, kyle_balkissoon]
---

# Assessing the impact of extreme specific news events on forward returns

_2022 · Kyle Balkissoon (Stance Capital)_

**Headline:** A framework for identifying and assessing the impact of extreme specific news events on forward returns

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2022/KyleBalkissoon.pdf>
- Local: `./_cache/files/2022/2022__kyle_balkissoon.pdf`
- Talk type: Talk
- Time slot: 14:50 - 15:10

## Topics
- extreme news events
- forward returns analysis
- factor models
- sentiment analysis
- machine learning in finance
- event-driven investing

## Methods
- factor model residuals
- random forest classification (ranger package)
- sentiment metrics (GI, LM, FEEL, HENRY)
- t-tests
- Wilcoxon tests
- Kolmogorov-Smirnov tests

## Datasets used
- FactSet StreetAccount (3,320,885 distinct events)
- Litigation data (14,894 US company events)

## Code & tools
- sentometrics package
- ranger package
- `t-test`
- Wilcoxon test
- Kolmogorov-Smirnov test

## Key findings
- Litigation events consistently lead to negative forward returns  
  > Litigation is predictably bad for forward returns.
- Composite sentiment scores can predict post-event return directions  
  > Composite sentiment scores built using machine learning models can help predict sign of forward returns post events
- Negative litigation events show statistically significant lower HENRY sentiment scores  
  > t = -4.8017, df = 27454, p-value = 1.582e-06
- Bottom quartile of sentiment predictions had 64.3% negative outcomes vs 52.4% overall  
  > 64.3% in the bottom quartile... vs 52.4% in the overall set

## Applications
- risk management
- alpha generation through event-driven strategies
- sentiment-based trading signals

## References cited
*(none extracted)*

## See also
- [`years/2022.md`](../years/2022.md)
- [`speakers/kyle_balkissoon.md`](../speakers/kyle_balkissoon.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=50% (2/4), source=ocr(paddle)*

