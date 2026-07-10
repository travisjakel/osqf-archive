---
type: Talk
title: Statistical CinderellaParallel Computation for the Rest of Us
description: "This talk discusses the challenges and opportunities in making parallel computation accessible to non-experts in R, covering hardware, software tools, and practical barriers."
timestamp: "2026-07-08T00:00:00Z"
year: 2018
date: ~
speaker: Norm Matloff
speaker_slug: norm_matloff
talk_type: Keynote
time_slot: "11:05 - 11:55"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/NormMatloff.pdf"
file_local: "./_cache/files/2018/2018__norm_matloff.pdf"
slug: 2018__norm_matloff
status: archived
tags: [osqf, 2018, norm_matloff, parallel_computing]
---

# Statistical CinderellaParallel Computation for the Rest of Us

_2018 · Norm Matloff (University of California at Davis)_

**Headline:** This talk discusses the challenges and opportunities in making parallel computation accessible to non-experts in R, covering hardware, software tools, and practical barriers.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/NormMatloff.pdf>
- Local: `./_cache/files/2018/2018__norm_matloff.pdf`
- Talk type: Keynote
- Time slot: 11:05 - 11:55

## Topics
- parallel computing
- R programming
- hardware considerations
- big data challenges
- software tool abstraction levels
- time series analysis

## Methods
- OpenMP
- GPU acceleration
- Intel Xeon Phi
- distributed computing
- matrix parallelization

## Datasets used
*(none extracted)*

## Code & tools
- R
- `OpenMP`
- `xgboost`
- `recosystem`
- `gmatrix`
- parallel pkg
- `foreach`
- `partools`
- Spark/R
- `RcppPar`
- `Rdsm`

## Key findings
- Users often overestimate their ability to leverage parallel hardware and data for R computations.  
  > Users believe, 'I’ve got the hardware and I’ve got the data need — so I should be all set to do parallel computation in R on the data.' But this 'rule' is 'honored in the breach,'
- Embarrassingly parallel (EP) problems are rare in practice, with most algorithms facing overhead issues.  
  > Embarrassing is good — but not common enough. Overhead issues: Contention for memory/network.
- R's parallel tools require significant programming expertise despite their availability.  
  > However, all of those tools require a fair amount of programming sophistication to use.
- Transparent parallelism in specialty packages still requires hardware/systems expertise.  
  > Even though transparent to the user in principle, may still need expertise in hardware/systems to make it run well.

## Applications
- machine learning
- time series analysis
- big data processing

## References cited
- F. Belletti, arXiv, 2015

## See also
- [`years/2018.md`](../years/2018.md)
- [`speakers/norm_matloff.md`](../speakers/norm_matloff.md)
- [`topics/parallel_computing.md`](../topics/parallel_computing.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=50% (2/4)*

