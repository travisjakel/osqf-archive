---
type: Talk
title: Data ingest in R
description: "Hadley Wickham discusses methods for importing data into R from various sources including disk, databases, and the web."
timestamp: "2026-07-08T00:00:00Z"
year: 2015
date: ~
speaker: Hadley Wickham
speaker_slug: hadley_wickham
talk_type: Talk
time_slot: "10:55 - 11:15"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/HadleyWickham.pdf"
file_local: "./_cache/files/2015/2015__hadley_wickham.pdf"
slug: 2015__hadley_wickham
status: archived
tags: [osqf, 2015, hadley_wickham]
---

# Data ingest in R

_2015 · Hadley Wickham (RStudio)_

**Headline:** Hadley Wickham discusses methods for importing data into R from various sources including disk, databases, and the web.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/HadleyWickham.pdf>
- Local: `./_cache/files/2015/2015__hadley_wickham.pdf`
- Talk type: Talk
- Time slot: 10:55 - 11:15

## Topics
- data ingest
- R packages
- database connectivity
- web data handling

## Methods
- using readr for flat files
- DBI package for database connectivity
- parameterized queries to prevent SQL injection

## Datasets used
*(none extracted)*

## Code & tools
- `readr`
- `haven`
- `DBI`
- `RPostgres`
- `RMySQL`
- `RSQLite`
- `readxl`
- `devtools`

## Key findings
- Consistent function names and arguments are emphasized for R packages.  
  > Consistent function names and arguments.
- Avoiding row names and converting characters to factors is recommended.  
  > No row names. Never change column names.
- Parameterized queries prevent SQL injection vulnerabilities.  
  > dbGetQuery(db, sql, list(name))

## Applications
- data analysis
- data preparation

## References cited
- http://github.com/rstats-db/
- http://xkcd.com/327/

## See also
- [`years/2015.md`](../years/2015.md)
- [`speakers/hadley_wickham.md`](../speakers/hadley_wickham.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

