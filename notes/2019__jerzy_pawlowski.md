---
type: Talk
title: Efficient Portfolio Optimization Under Large Skewness and Fat Tails
description: The IBrokers2 package enables real-time trading strategies via Interactive Brokers API with customizable eWrapper objects and trade wrappers.
timestamp: "2026-07-08T00:00:00Z"
year: 2019
date: ~
speaker: Jerzy Pawlowski
speaker_slug: jerzy_pawlowski
talk_type: Lightning
time_slot: "15:20 - 15:26"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/JerzyPawlowski.pdf"
file_local: "./_cache/files/2019/2019__jerzy_pawlowski.pdf"
slug: 2019__jerzy_pawlowski
status: archived
tags: [osqf, 2019, jerzy_pawlowski]
---

# Efficient Portfolio Optimization Under Large Skewness and Fat Tails

_2019 · Jerzy Pawlowski (NYU Tandon School of Engineering)_

**Headline:** The IBrokers2 package enables real-time trading strategies via Interactive Brokers API with customizable eWrapper objects and trade wrappers.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/JerzyPawlowski.pdf>
- Local: `./_cache/files/2019/2019__jerzy_pawlowski.pdf`
- Talk type: Lightning
- Time slot: 15:20 - 15:26

## Topics
- real-time trading systems
- R package development
- Interactive Brokers API integration
- customizable data processing frameworks

## Methods
- real-time OHLC data streaming
- custom eWrapper object creation
- trade order execution via API
- callback loop processing

## Datasets used
*(none extracted)*

## Code & tools
- `IBrokers`
- `IBrokers2`
- R
- github.com/algoquant/iBrokers2

## Key findings
- IBrokers2 extends IBrokers with real-time trading capabilities via trade_wrapper objects  
  > The function IBrokers2::trade_wrapper() creates a trade_wrapper object... performing different tasks.
- Real-time data processing uses callback loops with eWrapper objects  
  > Streaming market events are processed in a callback loop which runs inside the function twsCALLBACK().
- IBrokers2 is a proof of concept requiring future Rcpp optimization  
  > The package IBrokers2 is currently an initial proof of concept... Rewrite critical functions using Rcpp...

## Applications
- Education and trading competitions
- Crowd-sourced hedge fund platforms

## References cited
- IBrokers
- github.com/algoquant/iBrokers2

## See also
- [`years/2019.md`](../years/2019.md)
- [`speakers/jerzy_pawlowski.md`](../speakers/jerzy_pawlowski.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

