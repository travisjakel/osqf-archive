---
type: Talk
title: "The R Package rbtcImplementation of the Core Bitcoin's API"
description: "The R package rbtc implements Bitcoin's API for blockchain analysis and data retrieval."
timestamp: "2026-07-08T00:00:00Z"
year: 2018
date: ~
speaker: Bernhard Pfaff
speaker_slug: bernhard_pfaff
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/BernhardPfaff.pdf"
file_local: "./_cache/files/2018/2018__bernhard_pfaff.pdf"
slug: 2018__bernhard_pfaff
status: archived
tags: [osqf, 2018, bernhard_pfaff]
---

# The R Package rbtcImplementation of the Core Bitcoin's API

_2018 · Bernhard Pfaff (Invesco Asset Management GmbH Frankfurt am Main)_

**Headline:** The R package rbtc implements Bitcoin's API for blockchain analysis and data retrieval.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/BernhardPfaff.pdf>
- Local: `./_cache/files/2018/2018__bernhard_pfaff.pdf`
- Talk type: Lightning

## Topics
- Bitcoin API implementation
- R package development
- blockchain analysis
- data retrieval from Bitcoin

## Methods
- S4-class implementation
- RPC-JSON API calls
- blockchain data parsing

## Datasets used
*(none extracted)*

## Code & tools
- `htr`
- `rjson`
- bitcoin-core/bitcoind
- GitHub (https://github.com/bpfaff/rbtc/)

## Key findings
- rbtc provides a partial implementation of Bitcoin's API using R's S4-classes.  
  > Purely written in R and utilizes S4-classes and methods.
- The package enables blockchain analysis through functions like getblockhash and getblock.  
  > bhash <- getblockhash(obj, 277316)... txlist <- lapply(txlist, function(x) x$vout)

## Applications
- blockchain analysis
- deriving descriptive statistics

## References cited
- Antonopoulos (2017)
- Gorecki (2014)
- AbdulMajedRaja (2018)
- Wickham (2017)
- Couture-Beil (2014)

## See also
- [`years/2018.md`](../years/2018.md)
- [`speakers/bernhard_pfaff.md`](../speakers/bernhard_pfaff.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=50% (1/2), source=ocr(paddle)*

