---
type: Talk
title: Alt. Data Sources for Measuring Market Sentiment and Events
description: Explores alternative data sources like danceability indices and social media sentiment to measure market sentiment and predict financial trends using R.
timestamp: "2026-07-08T00:00:00Z"
year: 2011
date: ~
speaker: Rothermich
speaker_slug: rothermich
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2011/JoeRothermich.pdf"
file_local: "./_cache/files/2011/2011__rothermich.pdf"
slug: 2011__rothermich
status: archived
tags: [osqf, 2011, rothermich, sentiment_analysis]
---

# Alt. Data Sources for Measuring Market Sentiment and Events

_2011 · Rothermich (Natural Selection Financial, Inc.)_

**Headline:** Explores alternative data sources like danceability indices and social media sentiment to measure market sentiment and predict financial trends using R.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2011/JoeRothermich.pdf>
- Local: `./_cache/files/2011/2011__rothermich.pdf`
- Talk type: Lightning

## Topics
- market sentiment analysis
- alternative data sources
- social media analytics
- R programming for finance
- predictive modeling

## Methods
- sentiment analysis
- Granger causality
- Self-Organizing Fuzzy Neural Networks
- time series analysis
- mood tracking tools (OpinionFinder, GPOMS)

## Datasets used
- Weekly Historical Top 5 Songs in New York City
- Google Trends: Anne Hathaway
- Danceability Score of Top Songs
- Twitter feeds (Stock Market mentions)

## Code & tools
- `twitterR`
- `RGoogleTrends`
- `quantmod`
- `XML`
- `RCurl`
- `tm`
- `Infochimps`
- `spline`
- `xts`
- `na.locf`
- `Delt`

## Key findings
- Danceability scores correlated with SPX returns (e.g., 0.63 danceability coincided with 1.90 SPX return in Mar 2011)  
  > Date | Echo Nest Danceability Score (5 week moving average)... Mar 06 2011 | 0.63
- Twitter mood analysis predicted DJIA changes with 87.6% accuracy using GPOMS and OpinionFinder  
  > Our results indicate that the accuracy of DJIA predictions... by more than 6%.
- Search volume for 'Anne Hathaway' correlated with Berkshire Hathaway (BRK.A) stock price movements  
  > Google Trends: Anne Hathaway... Berkshire Hathaway Share Price

## Applications
- sentiment-driven trading strategies
- market anomaly detection
- predictive analytics for financial events

## References cited
- Bollen et al. (2011) Twitter mood and DJIA prediction
- Hemline Index theory (Wikipedia)

## See also
- [`years/2011.md`](../years/2011.md)
- [`speakers/rothermich.md`](../speakers/rothermich.md)
- [`methods/sentiment_analysis.md`](../methods/sentiment_analysis.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=0% (0/3), source=ocr(paddle)*

