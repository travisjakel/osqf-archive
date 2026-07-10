---
type: Talk
title: Advanced Tutorial on data.table
description: "Advanced tutorial on R's data.table package, focusing on advanced features and best practices"
timestamp: "2026-07-08T00:00:00Z"
year: 2013
date: ~
speaker: Matthew Dowle
speaker_slug: matthew_dowle
talk_type: Tutorial
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/workshop/MatthewDowle.pdf"
file_local: "./_cache/files/2013/2013__matthew_dowle.pdf"
slug: 2013__matthew_dowle
status: archived
tags: [osqf, 2013, matthew_dowle]
---

# Advanced Tutorial on data.table

_2013 · Matthew Dowle_

**Headline:** Advanced tutorial on R's data.table package, focusing on advanced features and best practices

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/workshop/MatthewDowle.pdf>
- Local: `./_cache/files/2013/2013__matthew_dowle.pdf`
- Talk type: Tutorial

## Topics
- data.table package
- R programming
- data manipulation
- efficient coding
- tutorial methodology

## Methods
- .SD
- : =
- set* functions
- joins
- rolling joins
- SQL analogies

## Datasets used
*(none extracted)*

## Code & tools
- `data.table`
- R

## Key findings
- data.table's .I can identify rows with price discrepancies in allocations  
  > if (length(err <- allocation[,
                  if(length(unique(Price))>1) .I,
- .SD enables flexible column subsetting in aggregations  
  > stocks [, lapply(.SD, sum), by=sector, .SDcols=c(
- set* functions provide efficient in-place modifications  
  > set(), setattr(), setnames(), setkey()

## Applications
- data manipulation
- financial data analysis
- R package development

## References cited
- http://datatable.r-forge.r-project.org/

## See also
- [`years/2013.md`](../years/2013.md)
- [`speakers/matthew_dowle.md`](../speakers/matthew_dowle.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

