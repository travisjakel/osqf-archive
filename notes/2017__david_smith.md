---
type: Talk
title: Detecting Fraud at 1 Million Transactions per Second
description: Operationalizing predictive models for real-time fraud detection at 1 million transactions per second using Microsoft R Server
timestamp: "2026-07-08T00:00:00Z"
year: 2017
date: ~
speaker: David Smith
speaker_slug: david_smith
talk_type: Talk
time_slot: "15:07 - 15:27"
file_format: pptx
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/DavidSmith.pptx"
file_local: "./_cache/files/2017/2017__david_smith.pptx"
slug: 2017__david_smith
status: archived
tags: [osqf, 2017, david_smith]
---

# Detecting Fraud at 1 Million Transactions per Second

_2017 · David Smith (Microsoft)_

**Headline:** Operationalizing predictive models for real-time fraud detection at 1 million transactions per second using Microsoft R Server

## Source
- File format: `pptx`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/DavidSmith.pptx>
- Local: `./_cache/files/2017/2017__david_smith.pptx`
- Talk type: Talk
- Time slot: 15:07 - 15:27

## Topics
- real-time model deployment
- predictive analytics
- fraud detection
- Microsoft R Server

## Methods
- gradient-boosted tree models
- real-time deployment via REST API
- model operationalization with Microsoft R Server

## Datasets used
- Lending Club Loan Performance Data (www.lendingclub.com/info/download-data.action)

## Code & tools
- `mrsdeploy`
- `RevoScaleR`
- SQL Server
- R
- `Python`

## Key findings
- Real-time deployment via Microsoft R Server achieved 1M predictions/sec with sub-second latency  
  > 1M predictions/sec Same benchmark One-sixth the resources
- Flexible deployment supports any R script/function via REST API  
  > Publish any R script or function as Web Service
- Real-time deployment uses pre-trained models for improved latency  
  > Real-Time Deployment Models Linear Regression (rxLinMod, rxFastLinear)

## Applications
- fraud detection
- real-time credit card transaction analysis
- loan delinquency prediction

## References cited
- blog.revolutionanalytics.com/2016/09/fraud-detection.html

## See also
- [`years/2017.md`](../years/2017.md)
- [`speakers/david_smith.md`](../speakers/david_smith.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

