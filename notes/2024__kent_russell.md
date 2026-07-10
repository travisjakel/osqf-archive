---
type: Talk
title: R ∪ Finance ∪ Web
description: Integration of R and JavaScript for finance applications via WebR and WebAssembly
timestamp: "2026-07-08T00:00:00Z"
year: 2024
date: ~
speaker: Kent Russell
speaker_slug: kent_russell
talk_type: Talk
time_slot: "09:45 - 10:05"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2024/KentRussell.pdf"
file_local: "./_cache/files/2024/2024__kent_russell.pdf"
slug: 2024__kent_russell
status: archived
tags: [osqf, 2024, kent_russell]
---

# R ∪ Finance ∪ Web

_2024 · Kent Russell_

**Headline:** Integration of R and JavaScript for finance applications via WebR and WebAssembly

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2024/KentRussell.pdf>
- Local: `./_cache/files/2024/2024__kent_russell.pdf`
- Talk type: Talk
- Time slot: 09:45 - 10:05

## Topics
- R and JavaScript integration
- WebR for browser/Node.js
- Portfolio optimization in WebR
- Challenges in WebR

## Methods
- WebAssembly (WASM)
- quantmod
- PortfolioAnalytics
- ROI
- ROI.plugin.quadprog

## Datasets used
- JKP Factor Data (https://jkpfactors.com/data/[usa]_[all_themes]_[monthly]_[vw_cap].zip)

## Code & tools
- `webr`
- `quantmod`
- `PortfolioAnalytics`
- `ROI`
- `ROI.plugin.quadprog`
- `WebR`
- `Node.js`
- `Stackblitz`

## Key findings
- WebR enables R to run in browsers via WebAssembly  
  > WebR for Omnipresence R running inside of the browser or Node.js through WebAssembly (WASM)
- Portfolio optimization workflow demonstrated in WebR  
  > optimize.portfolio(R = factors_xts, portfolio = portfolio.spec(assets=colnames(factors_xts)) |>
- JKP Factor Data used for portfolio optimization  
  > use factor data from https://jkpfactors.com/

## Applications
- Portfolio workflow in WebR REPL
- Portfolio workflow in Node.js

## References cited
- Jensen, T., Kelly, B., and Pedersen, L. “Is There a Replication Crisis in Finance?” Journal of Finance (2023)

## See also
- [`years/2024.md`](../years/2024.md)
- [`speakers/kent_russell.md`](../speakers/kent_russell.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

