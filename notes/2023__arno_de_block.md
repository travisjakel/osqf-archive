---
type: Talk
title: A media news-based economic clock for state-based nowcasting of GDP growth
description: Using media news to create an economic clock for real-time GDP nowcasting
timestamp: "2026-07-08T00:00:00Z"
year: 2023
date: ~
speaker: Arno De Block
speaker_slug: arno_de_block
talk_type: Talk
time_slot: "16:50 - 17:10"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2023/ArnoDeBlock.pdf"
file_local: "./_cache/files/2023/2023__arno_de_block.pdf"
slug: 2023__arno_de_block
status: archived
tags: [osqf, 2023, arno_de_block]
---

# A media news-based economic clock for state-based nowcasting of GDP growth

_2023 · Arno De Block_

**Headline:** Using media news to create an economic clock for real-time GDP nowcasting

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2023/ArnoDeBlock.pdf>
- Local: `./_cache/files/2023/2023__arno_de_block.pdf`
- Talk type: Talk
- Time slot: 16:50 - 17:10

## Topics
- nowcasting
- economic clocks
- media news analysis
- state-based estimation
- GDP growth forecasting

## Methods
- state-based estimation
- MIDAS
- VAR
- bridge equations
- expanding/rolling/exponential weighting
- R-index
- AES (sentiment lexicon)
- VSTOXX
- CISS

## Datasets used
- 21 million Belgian newspaper articles (2000-2022)
- R-index (recession attention indicator)
- AES (elite/popular sentiment scores)
- VSTOXX (implied volatility)
- CISS (systemic stress indicator)
- business/consumer confidence surveys
- macroeconomic/financial variables (94 total)

## Code & tools
*(none extracted)*

## Key findings
- State-based models outperform traditional benchmarks during crises  
  > During crisis periods: Attention to recession (R-index) and implied volatility (VSTOXX)
- Economic clock requires careful state variable selection  
  > One needs to carefully select the state variable(s) It is NOT simply plug in and run the model
- News-based indicators improve nowcasting accuracy  
  > News is published every single day → timely

## Applications
- GDP nowcasting
- economic policy monitoring
- real-time macroeconomic analysis

## References cited
- Larsen et al., 2021
- The Economist, 2001
- Loughran & McDonald, 2011

## See also
- [`years/2023.md`](../years/2023.md)
- [`speakers/arno_de_block.md`](../speakers/arno_de_block.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

