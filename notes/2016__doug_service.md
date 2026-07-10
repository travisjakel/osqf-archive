---
type: Talk
title: Leveraging Azure Compute from R
description: Using R to leverage Azure compute clusters for solving finance problems via Spark and MPI.
timestamp: "2026-07-08T00:00:00Z"
year: 2016
date: ~
speaker: Doug Service
speaker_slug: doug_service
talk_type: Tutorial
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/workshop/DougService.pdf"
file_local: "./_cache/files/2016/2016__doug_service.pdf"
slug: 2016__doug_service
status: archived
tags: [osqf, 2016, doug_service, cloud_computing]
---

# Leveraging Azure Compute from R

_2016 · Doug Service (Microsoft)_

**Headline:** Using R to leverage Azure compute clusters for solving finance problems via Spark and MPI.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/workshop/DougService.pdf>
- Local: `./_cache/files/2016/2016__doug_service.pdf`
- Talk type: Tutorial

## Topics
- cloud computing
- R programming
- parallel computing
- portfolio optimization

## Methods
- MPI clusters
- NFS
- Azure
- foreach
- doMPI
- Rmpi

## Datasets used
- S&P 500

## Code & tools
- `foreach`
- `doMPI`
- `Rmpi`
- `Azure`
- `MPI`
- `NFS`
- `PortfolioMPI.R`
- `PortfolioMPIResults.R`

## Key findings
- Azure reduces data center costs by eliminating the need for physical infrastructure.  
  > Eliminates the expense of buying, maintaining, and continually upgrading a data center.
- MPI clusters achieve 3x speedup over single-threaded R for portfolio optimization.  
  > Time (mins) Script None 1 1 4.3162 ... MPI 4 1 1.4296
- R packages like foreach and doMPI enable parallel processing on Azure.  
  > R Packages · foreach · doMPI · Rmpi

## Applications
- portfolio optimization

## References cited
*(none extracted)*

## See also
- [`years/2016.md`](../years/2016.md)
- [`speakers/doug_service.md`](../speakers/doug_service.md)
- [`topics/cloud_computing.md`](../topics/cloud_computing.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

