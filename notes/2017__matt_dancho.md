---
type: Talk
title: "New Tools for Performing Financial Analysis Within the 'Tidy' Ecosystem"
description: "Introducing tidyquant: Integrating tidyverse with financial analysis tools like xts, quantmod, and PerformanceAnalytics for scalable financial data science"
timestamp: "2026-07-08T00:00:00Z"
year: 2017
date: ~
speaker: Matt Dancho
speaker_slug: matt_dancho
talk_type: Lightning
time_slot: "16:40 - 16:52"
file_format: pptx
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/MattDancho.pptx"
file_local: "./_cache/files/2017/2017__matt_dancho.pptx"
slug: 2017__matt_dancho
status: archived
tags: [osqf, 2017, matt_dancho, financial_data_analysis]
---

# New Tools for Performing Financial Analysis Within the 'Tidy' Ecosystem

_2017 · Matt Dancho (Business-Science.io)_

**Headline:** Introducing tidyquant: Integrating tidyverse with financial analysis tools like xts, quantmod, and PerformanceAnalytics for scalable financial data science

## Source
- File format: `pptx`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/MattDancho.pptx>
- Local: `./_cache/files/2017/2017__matt_dancho.pptx`
- Talk type: Lightning
- Time slot: 16:40 - 16:52

## Topics
- financial data analysis
- tidyverse integration
- scalable data science
- portfolio analysis

## Methods
- tq_get()
- tq_index()
- group_by(symbol)
- SDDLR calculation
- MDLR calculation

## Datasets used
*(none extracted)*

## Code & tools
- `tidyquant`
- `xts`
- `zoo`
- `quantmod`
- `TTR`
- `PerformanceAnalytics`
- `tidyverse`

## Key findings
- tidyquant combines matrix speed of xts with tidyverse flexibility  
  > tidyquant: Best of both worlds
Integrates tidyverse with:
xts & zoo
quantmod & TTR
PerformanceAnalytics
- Scalability handles 1 asset to 500 assets seamlessly  
  > What does scalability look like?
1 Asset
500 Assets
tq_get("AAPL")
tq_index("SP500")
%> %
tq_get()    %> %
group_by(symbol)
- Portfolio analysis demonstrates 5-year performance metrics  
  > Portfolio Number | 2013 | 2014 | 2015 | 2016 | 2017
1 | 15000 | 25000 | 30000 | 45000 | 50000

## Applications
- financial data science at scale
- portfolio performance analysis

## References cited
- R/FINANCE, 2017
- H. Wickham, 2017. URL https://www.rstudio.com/resources/videos/data-science-in-thetidyverse/

## See also
- [`years/2017.md`](../years/2017.md)
- [`speakers/matt_dancho.md`](../speakers/matt_dancho.md)
- [`topics/financial_data_analysis.md`](../topics/financial_data_analysis.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

