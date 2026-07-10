---
type: Talk
title: Zero-Revelation RegTechDetecting Risk through Linguistic Analysis of Corporate Emails and News
description: Analyzing corporate email sentiment and length to predict stock returns and detect financial risks.
timestamp: "2026-07-08T00:00:00Z"
year: 2017
date: ~
speaker: Seoyoung Kim
speaker_slug: seoyoung_kim
talk_type: Talk
time_slot: "11:10 - 11:30"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/SeoyoungKim.pdf"
file_local: "./_cache/files/2017/2017__seoyoung_kim.pdf"
slug: 2017__seoyoung_kim
status: archived
tags: [osqf, 2017, seoyoung_kim]
---

# Zero-Revelation RegTechDetecting Risk through Linguistic Analysis of Corporate Emails and News

_2017 · Seoyoung Kim (Santa Clara University (SCU))_

**Headline:** Analyzing corporate email sentiment and length to predict stock returns and detect financial risks.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/SeoyoungKim.pdf>
- Local: `./_cache/files/2017/2017__seoyoung_kim.pdf`
- Talk type: Talk
- Time slot: 11:10 - 11:30

## Topics
- Sentiment Analysis in Corporate Emails
- Email Length as a Financial Indicator
- Comparative Analysis with News Content
- Network Analysis of Email Communication

## Methods
- Moving Average Stock Return Analysis
- Regression Modeling (e.g., Table 2: Coefficient estimates for email sentiment/length vs. stock returns)
- Sentiment Analysis using Harvard Business Review (HBR) lexicons
- Network Visualization of Email Communication Patterns

## Datasets used
- Enron Email Corpus (filtered for sent emails, with redactions)
- Factiva News Content (headers and bodies)
- Enron Stock Returns Data

## Code & tools
*(none extracted)*

## Key findings
- Net email sentiment has a statistically significant positive correlation with stock returns (e.g., Table 2: MA Email Sentiment coefficient = 2.347***, t=3.27).
- Email length is a stronger predictor of stock price declines than sentiment: A 20-character decrease in moving average email length correlates with a 1.17% decline in stock returns (Table 2).
- Email content contains less predictive power than news body sentiment (Table 3: MA Body Sentiment coefficient = 1.410*** vs. MA Email Sentiment coefficient = -0.245).
- Network analysis reveals shifts in communication patterns preceding financial crises (Figure 11: Email networks in 2000 Q4 vs. 2001 Q4).

## Applications
- Early warning system for financial risks through non-intrusive email analysis
- Regulatory compliance monitoring without exposing sensitive email content
- Enhancing predictive models for corporate fraud detection

## References cited
- Harvard Business Review (HBR) lexicons for sentiment analysis
- Enron Email Corpus (used in prior studies, e.g., 'Enron Email Dataset' by K. D. et al.)

## See also
- [`years/2017.md`](../years/2017.md)
- [`speakers/seoyoung_kim.md`](../speakers/seoyoung_kim.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=0% (0/4), source=ocr(paddle)*

