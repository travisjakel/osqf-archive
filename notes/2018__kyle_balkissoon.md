---
type: Talk
title: Weather and Text Data for Investment Research
description: Leveraging weather and news data to enhance predictive models in investment research through feature engineering and machine learning
timestamp: "2026-07-08T00:00:00Z"
year: 2018
date: ~
speaker: Kyle Balkissoon
speaker_slug: kyle_balkissoon
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/KyleBalkissoon.pdf"
file_local: "./_cache/files/2018/2018__kyle_balkissoon.pdf"
slug: 2018__kyle_balkissoon
status: archived
tags: [osqf, 2018, kyle_balkissoon]
---

# Weather and Text Data for Investment Research

_2018 · Kyle Balkissoon (IBM)_

**Headline:** Leveraging weather and news data to enhance predictive models in investment research through feature engineering and machine learning

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/KyleBalkissoon.pdf>
- Local: `./_cache/files/2018/2018__kyle_balkissoon.pdf`
- Talk type: Lightning

## Topics
- weather data integration
- text analysis for finance
- predictive modeling in investment
- machine learning applications

## Methods
- synthetic weather station generation
- sentiment analysis
- word count indexing
- decay algorithm for news features
- data.table for geospatial aggregation

## Datasets used
- New York Times articles (2001-2018)
- Global Weather Observation Network surface stations
- METAR weather data

## Code & tools
- `data.table`
- `XML`
- tm (R package)

## Key findings
- Synthetic weather stations weighted by population improve predictive models  
  > Synthetic weather stations used to create weather factors around each company POI. Weighted by Population
- News sentiment and word count features show statistically significant predictive power  
  > News factors of average sentiment, word count and importance score are statistically significant
- Weather normalization using anchored z-scores enhances feature reliability  
  > Weather features normalized using anchored z-scores
- Decay algorithm maintains relevance of news features during information gaps  
  > Decay algorithm is used to carry previous observations forward when no new news articles are released

## Applications
- predictive modeling
- trading strategy development
- risk management

## References cited
*(none extracted)*

## See also
- [`years/2018.md`](../years/2018.md)
- [`speakers/kyle_balkissoon.md`](../speakers/kyle_balkissoon.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (4/4), source=ocr(paddle)*

