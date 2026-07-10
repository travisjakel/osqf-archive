---
type: Talk
title: Connecting QAI to R
description: "Creating an R database to organize vendor data for research and production use, addressing challenges in data preparation and reproducibility."
timestamp: "2026-07-08T00:00:00Z"
year: 2016
date: ~
speaker: Patrick Howerter
speaker_slug: patrick_howerter
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/PatrickHowerter.pdf"
file_local: "./_cache/files/2016/2016__patrick_howerter.pdf"
slug: 2016__patrick_howerter
status: archived
tags: [osqf, 2016, patrick_howerter]
---

# Connecting QAI to R

_2016 · Patrick Howerter (Schwab Equity Ratings Department)_

**Headline:** Creating an R database to organize vendor data for research and production use, addressing challenges in data preparation and reproducibility.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/PatrickHowerter.pdf>
- Local: `./_cache/files/2016/2016__patrick_howerter.pdf`
- Talk type: Lightning

## Topics
- data preparation challenges
- R database creation
- ETL processes
- large data handling in R

## Methods
- SQL stored procedures
- ODBC connections
- ff package
- ETLUtils package
- parallel processing

## Datasets used
*(none extracted)*

## Code & tools
- `ff`
- `ETLUtils`
- `read.odbc.ffdf`
- `as.ffdf`
- `save.ffdf`

## Key findings
- Analysts spend 60-90% of their time preparing data due to lack of database expertise.  
  > Analysts spend 60 to 90% of their time preparing their data
- Using ff and ETLUtils packages enables efficient large-scale data handling in R.  
  > Can run in parallel processing because you are writing to disk!!!!
- Organized 10 vendors' schemas into a unified R database with 30 GB of SQL data extracted.  
  > Organized over 10 vendors database schemas into one common r database

## Applications
- research data management
- production data handling
- multi-user database access

## References cited
- citation('ff') Daniel Adler... (2014)
- citation('ETLUtils') Jan Wijffels... (2015)

## See also
- [`years/2016.md`](../years/2016.md)
- [`speakers/patrick_howerter.md`](../speakers/patrick_howerter.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

