---
type: Talk
title: "Banking on Sentiment: How Natural Language Processing Selected a Portfolio of Bank Stocks that Outperformed a Bank Stock Index by 15%"
description: "Using NLP on bank annual reports to construct a portfolio that outperformed a bank stock index by 15%."
timestamp: "2026-07-08T00:00:00Z"
year: 2019
date: ~
speaker: Sandra Rolnicki
speaker_slug: sandra_rolnicki
talk_type: Talk
time_slot: "10:55 - 11:15"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/SandraRolnicki.pdf"
file_local: "./_cache/files/2019/2019__sandra_rolnicki.pdf"
slug: 2019__sandra_rolnicki
status: archived
tags: [osqf, 2019, sandra_rolnicki]
---

# Banking on Sentiment: How Natural Language Processing Selected a Portfolio of Bank Stocks that Outperformed a Bank Stock Index by 15%

_2019 · Sandra Rolnicki (Northwestern University adjunct faculty and Federal Reserve Bank of Chicago employee)_

**Headline:** Using NLP on bank annual reports to construct a portfolio that outperformed a bank stock index by 15%.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/SandraRolnicki.pdf>
- Local: `./_cache/files/2019/2019__sandra_rolnicki.pdf`
- Talk type: Talk
- Time slot: 10:55 - 11:15

## Topics
- NLP in finance
- sentiment analysis
- portfolio construction
- event study analysis

## Methods
- NRC sentiment analysis (8 categories)
- portfolio optimization
- event study analysis

## Datasets used
- 11,000 bank annual reports (avg 41,000 words)

## Code & tools
- `googleCloudStorageR`
- `tm`
- `syuzhet`
- `portfolio`
- `EventStudy`

## Key findings
- NLP portfolio outperformed bank index by 15% annually  
  > $150K
$100K
$50K
$0K
2      Bank Index   S&P Index   NLP Portfolio
- Sentiment analysis used 8 emotional categories  
  > • Eight sentiment
categories*
• Sum for
emotional
valence (EV)
* Anger, Anticipation, Disgust, Fear, Joy, Sadness, Surprise, Trust
- High EV portfolios showed 3.3% abnormal returns  
  > 1.0%
S&P Index
0.0%
3.3%
difference
-1.0%
-2.0%
-3.0%
Low EV   High EV   * 90-day window event study

## Applications
- portfolio management
- sentiment-driven investing

## References cited
- Edmondson (2017) googleCloudStorageR
- Feinerer & Hornik (2018) tm
- Jockers (2017) syuzhet
- Mueller (2019) EventStudy

## See also
- [`years/2019.md`](../years/2019.md)
- [`speakers/sandra_rolnicki.md`](../speakers/sandra_rolnicki.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3)*

