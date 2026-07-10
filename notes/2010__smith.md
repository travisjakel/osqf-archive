---
type: Talk
title: Analysing Large-Scale Financial Data Sets in R
description: "The talk discusses challenges and solutions for handling large-scale financial data in R, focusing on memory and performance issues."
timestamp: "2026-07-08T00:00:00Z"
year: 2010
date: ~
speaker: Smith
speaker_slug: smith
talk_type: Talk
time_slot: "13:30 - 14:00"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2010/DavidSmith.pdf"
file_local: "./_cache/files/2010/2010__smith.pdf"
slug: 2010__smith
status: archived
tags: [osqf, 2010, smith]
---

# Analysing Large-Scale Financial Data Sets in R

_2010 · Smith_

**Headline:** The talk discusses challenges and solutions for handling large-scale financial data in R, focusing on memory and performance issues.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2010/DavidSmith.pdf>
- Local: `./_cache/files/2010/2010__smith.pdf`
- Talk type: Talk
- Time slot: 13:30 - 14:00

## Topics
- large-scale data analysis in R
- performance optimization
- distributed computing
- data storage formats
- statistical algorithms for big data

## Methods
- parallel external memory algorithms
- block updating
- XDF file format
- distributed computing

## Datasets used
- mortgage default data (2000-2009, 10M rows, 6 columns)

## Code & tools
- `revoAnalytics`
- `biglm`
- `glm`
- `rxLogit`
- `rxTextToXdf`
- `rxReadData`
- Hadoop DFS
- `XDF`

## Key findings
- revoAnalytics' rxLogit function outperforms in-memory alternatives by ~8x in runtime  
  > Elapsed Time (seconds) Scenario 1: revoAnalytics rxLogit function 79.98
- Standard R glm fails on large datasets due to memory constraints  
  > glm, on in-memory data frame N/A
- XDF format enables efficient block access to arbitrary data subsets  
  > Data stored in blocks of rows by column O(1): seek to specified data blocks

## Applications
- statistical modeling on large datasets
- distributed computing in R
- financial risk analysis

## References cited
- CRAN HighPerformanceComputing.html

## See also
- [`years/2010.md`](../years/2010.md)
- [`speakers/smith.md`](../speakers/smith.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=0% (0/3)*

