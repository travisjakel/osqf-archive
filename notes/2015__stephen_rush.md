---
type: Talk
title: Information Diffusion in Equity Markets
description: "The path of information transfer between securities influences equity returns, acting as a priced factor."
timestamp: "2026-07-08T00:00:00Z"
year: 2015
date: ~
speaker: Stephen Rush
speaker_slug: stephen_rush
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/StephenRush.pdf"
file_local: "./_cache/files/2015/2015__stephen_rush.pdf"
slug: 2015__stephen_rush
status: archived
tags: [osqf, 2015, stephen_rush, information_diffusion]
---

# Information Diffusion in Equity Markets

_2015 · Stephen Rush (The University of Connecticut School of Business)_

**Headline:** The path of information transfer between securities influences equity returns, acting as a priced factor.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/StephenRush.pdf>
- Local: `./_cache/files/2015/2015__stephen_rush.pdf`
- Talk type: Lightning

## Topics
- information diffusion
- network analysis in finance
- centrality measures
- portfolio formation
- market microstructure
- statistical arbitrage

## Methods
- bnlean package
- Hill climbing algorithm with random restarts
- rolling window analysis (100 trading days)
- igraph for centrality measures
- decile portfolio formation

## Datasets used
- NYSE TAQ (1996-2013), OptionMetrics, downsampled to hourly using time-weighted averages

## Code & tools
- `bnlean`
- `igraph`

## Key findings
- The path of information transfer between securities is a priced factor in equity returns.  
  > The path of information transfer from one security to the next is a priced factor in equity returns.
- Returns and VPIN show potential predictive power, while variance and skewness do not.  
  > Returns and VPIN work (maybe), Variance and Skewness do not work
- Overfitting risk arises from 300 statistical tests (10 deciles × 5 characteristics × 6 network measures).  
  > 10 deciles x 5 characteristics x 6 network measures = 300 tests

## Applications
*(none extracted)*

## References cited
*(none extracted)*

## See also
- [`years/2015.md`](../years/2015.md)
- [`speakers/stephen_rush.md`](../speakers/stephen_rush.md)
- [`topics/information_diffusion.md`](../topics/information_diffusion.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3)*

