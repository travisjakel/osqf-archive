---
type: Talk
title: DeathstarSeamless Distributed Computing for R
description: deathstar is a dead simple way to run lapply across EC2 nodes or local compute nodes using ZMQ for data/code transfer
timestamp: "2026-07-08T00:00:00Z"
year: 2012
date: ~
speaker: Armstrong
speaker_slug: armstrong
talk_type: Tutorial
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2012/workshop/WhitArmstrong.pdf"
file_local: "./_cache/files/2012/2012__armstrong.pdf"
slug: 2012__armstrong
status: archived
tags: [osqf, 2012, armstrong, distributed_computing]
---

# DeathstarSeamless Distributed Computing for R

_2012 · Armstrong (KLS Diversified Asset Management)_

**Headline:** deathstar is a dead simple way to run lapply across EC2 nodes or local compute nodes using ZMQ for data/code transfer

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2012/workshop/WhitArmstrong.pdf>
- Local: `./_cache/files/2012/2012__armstrong.pdf`
- Talk type: Tutorial

## Topics
- distributed computing
- cloud computing
- R programming
- parallel processing
- resource orchestration

## Methods
- ZMQ (via rzmq package) for inter-process communication
- daemon-based worker coordination
- dynamic job allocation via status port queries
- chunked data processing for regression

## Datasets used
- Airline on-time performance dataset (120M records, 1.6GB compressed)

## Code & tools
- `rzmq`
- `KLS`
- `AWS.tools`
- `EC2`
- `S3`
- R
- `zmq.cluster.lapply`

## Key findings
- deathstar simplifies distributed computing with API similar to lapply  
  > deathstar looks pretty much like lapply, or parLapply
- Achieves 3.142 Pi estimate with 10,000 workers in ~48 seconds locally  
  > print(pi.local.runtime) ## user system elapsed ## 7.828 1.024 48.378
- Cloud execution reduces regression computation time by 40% vs local  
  > print(coefs.ec2.runtime) ## user system elapsed ## 0.152 0.088 277.166
- Supports mixed-mode computing (local + cloud resources)  
  > nodes <- c(c("krypton", "xenon", "node1", "mongodb", "research"), cloud.nodes)

## Applications
- statistical computation
- regression analysis
- cloud resource orchestration
- distributed data processing

## References cited
- http://faculty.washington.edu/tlumley/tutorials/user-biglm.pdf
- http://stat-computing.org/dataexpo/2009/

## See also
- [`years/2012.md`](../years/2012.md)
- [`speakers/armstrong.md`](../speakers/armstrong.md)
- [`topics/distributed_computing.md`](../topics/distributed_computing.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (4/4), source=ocr(paddle)*

