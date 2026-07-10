---
type: Talk
title: The betfair Package
description: The betfair R package implements the Betfair API for sports betting and market data access.
timestamp: "2026-07-08T00:00:00Z"
year: 2011
date: ~
speaker: Lewis
speaker_slug: lewis
talk_type: Talk
time_slot: "16:20 - 16:40"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2011/BryanLewis.pdf"
file_local: "./_cache/files/2011/2011__lewis.pdf"
slug: 2011__lewis
status: archived
tags: [osqf, 2011, lewis, r_package_development]
---

# The betfair Package

_2011 · Lewis_

**Headline:** The betfair R package implements the Betfair API for sports betting and market data access.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2011/BryanLewis.pdf>
- Local: `./_cache/files/2011/2011__lewis.pdf`
- Talk type: Talk
- Time slot: 16:20 - 16:40

## Topics
- R package development
- sports betting APIs
- quantitative finance
- real-time data processing

## Methods
- API integration
- market data retrieval
- bet placement/cancellation
- time series analysis

## Datasets used
- Cheltenham race historical back prices (example data)

## Code & tools
- `betfair`
- `Rcurl`
- `quantmod`
- `Redis`
- `Websockets`

## Key findings
- The package provides R functions for Betfair API operations like login, market data retrieval, and bet placement.  
  > The API defines R functions in two broad categories: • Market data. • User account (place/update/cancel/monitor bets).
- Betfair's API offers real-time market data for sports events and financial products.  
  > Exchanges operate across globally distributed data centers. The APIs are free to use! (higher-speed commercial versions are also available).
- Example code demonstrates retrieving market info and placing bets using the package.  
  > > getMarketInfo(102707815)$marketStatus [1] "ACTIVE"
- The package supports time series analysis of betting data using quantmod.  
  > library(quantmod); load(’chelt.rdata’); LocalHero = bp1[,"Local Hero"]
- Automated trading platforms can be built using Redis/Websockets for signal distribution.  
  > Signals published via new Redis Publish/Subscribe or Websockets.

## Applications
- automated trading
- sports betting analysis
- risk management

## References cited
*(none extracted)*

## See also
- [`years/2011.md`](../years/2011.md)
- [`speakers/lewis.md`](../speakers/lewis.md)
- [`topics/r_package_development.md`](../topics/r_package_development.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=60% (3/5)*

