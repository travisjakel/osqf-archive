---
type: Talk
title: "Rusquant: another way of trading with R"
description: "Introduces the Rusquant R package for accessing and analyzing financial data from Russian and global markets (equity, forex, crypto)."
timestamp: "2026-07-08T00:00:00Z"
year: 2019
date: ~
speaker: Vyacheslav Arbuzov
speaker_slug: vyacheslav_arbuzov
talk_type: Lightning
time_slot: "10:49 - 10:55"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/VyacheslavArbuzov.pdf"
file_local: "./_cache/files/2019/2019__vyacheslav_arbuzov.pdf"
slug: 2019__vyacheslav_arbuzov
status: archived
tags: [osqf, 2019, vyacheslav_arbuzov, financial_data_retrieval]
---

# Rusquant: another way of trading with R

_2019 · Vyacheslav Arbuzov (Quantitative Associate, Olympia Capital, Moscow, Russia; Assistant professor, Department of Economics, Perm State University; Chief Scientist, Criptoeconomics & Blockchain Systems Lab, Perm State University)_

**Headline:** Introduces the Rusquant R package for accessing and analyzing financial data from Russian and global markets (equity, forex, crypto).

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/VyacheslavArbuzov.pdf>
- Local: `./_cache/files/2019/2019__vyacheslav_arbuzov.pdf`
- Talk type: Lightning
- Time slot: 10:49 - 10:55

## Topics
- financial data retrieval
- R package development
- crypto trading data
- market data integration
- quantitative finance tools

## Methods
- getSymbols for OHLCV data retrieval
- getOrderbook for orderbook data
- getTradelog for trade history
- getDividends, getEarnings, getSplits, getIPO, getEconomicEvents for corporate actions and events

## Datasets used
- Poloniex, Kraken, Binance, investing.com, Finam, Yahoo
- OHLCV data (ticks to monthly)
- orderbook information
- corporate actions (dividends, splits)
- economic events

## Code & tools
- `data.table`
- `xts`
- `httr`
- `rvest`
- `quantmod`
- `lubridate`
- `jsonlite`
- `Rusquant`
- `devtools`

## Key findings
- Rusquant has evolved since 2011 with integrations to Russian market data sources (mfd.ru, alor, moex) and crypto exchanges (Poloniex, Binance, etc).  
  > ✓ 2011 Rusquant as extension of Quantmod package for Russian market (by Sergey Edunov)
✓ 2013-2015 new datasources for Russian market (mfd.ru, alor, moex)
✓ 2016 get crypto data
- The package provides functions for OHLCV data, orderbooks, tradelogs, dividends, earnings, splits, IPOs, and economic events.  
  > getSymbols(Symbols = NULL, src="Poloniex",period='1min')
getOrderbook(Symbols = NULL, depth=2, src="Poloniex")
getTradelog(Symbols = NULL, from=Sys.Date() -1, to = Sys.Date(), last=200, src="Poloniex")
- Rusquant depends on core R packages like data.table, xts, and quantmod for data manipulation and analysis.  
  > Package depends on
✓ data.table
✓ xts
✓ httr
✓ rvest
✓ quantmod
✓ lubridate
✓ jsonlite

## Applications
- quantitative analysis
- algorithmic trading
- financial research

## References cited
*(none extracted)*

## See also
- [`years/2019.md`](../years/2019.md)
- [`speakers/vyacheslav_arbuzov.md`](../speakers/vyacheslav_arbuzov.md)
- [`topics/financial_data_retrieval.md`](../topics/financial_data_retrieval.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

