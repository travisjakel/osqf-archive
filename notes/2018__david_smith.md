---
type: Talk
title: Speeding up R with Parallel Programming in the Cloud
description: This talk demonstrates how to accelerate R code using parallel programming frameworks and cloud computing resources like Azure Batch.
timestamp: "2026-07-08T00:00:00Z"
year: 2018
date: ~
speaker: David Smith
speaker_slug: david_smith
talk_type: Lightning
time_slot: ~
file_format: pptx
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/DavidSmith.pptx"
file_local: "./_cache/files/2018/2018__david_smith.pptx"
slug: 2018__david_smith
status: archived
tags: [osqf, 2018, david_smith]
---

# Speeding up R with Parallel Programming in the Cloud

_2018 · David Smith_

**Headline:** This talk demonstrates how to accelerate R code using parallel programming frameworks and cloud computing resources like Azure Batch.

## Source
- File format: `pptx`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/DavidSmith.pptx>
- Local: `./_cache/files/2018/2018__david_smith.pptx`
- Talk type: Lightning

## Topics
- parallel programming
- cloud computing
- R performance optimization
- high-performance computing

## Methods
- foreach package with doMC/doParallel/doFuture/doAzureParallel backends
- Azure Batch cluster integration
- cross-validation with caret package

## Datasets used
*(none extracted)*

## Code & tools
- `foreach`
- `doMC`
- `doParallel`
- `doFuture`
- `doAzureParallel`
- `caret`
- Azure Batch

## Key findings
- Using Azure Batch with doAzureParallel achieved ~5x speedup over local execution  
  > MY LAPTOP: 78 minutes THIS CLUSTER: 16 minutes (almost 5x faster)
- doAzureParallel enables seamless cloud integration without changing foreach syntax  
  > Whatever you use, call to foreach does not change
- Parallel processing with doMC achieved 11x speedup over sequential R  
  > About 11x times faster than sequential

## Applications
- speeding up R code execution
- parallel cross-validation for machine learning

## References cited
- CRAN.R-project.org/package=foreach
- github.com/Azure/doAzureParallel

## See also
- [`years/2018.md`](../years/2018.md)
- [`speakers/david_smith.md`](../speakers/david_smith.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

