---
type: Talk
title: "Random Portfolios: Theory and Practice"
description: "Random portfolios are a method for performance measurement and constraint evaluation, using sampling from feasible portfolios under constraints."
timestamp: "2026-07-08T00:00:00Z"
year: 2009
date: ~
speaker: Patrick Burns
speaker_slug: patrick_burns
talk_type: ~
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2009/randport_practice_theory_annotated.pdf"
file_local: "./_cache/files/2009/2009__patrick_burns.pdf"
slug: 2009__patrick_burns
status: archived
tags: [osqf, 2009, patrick_burns, performance_measurement]
---

# Random Portfolios: Theory and Practice

_2009 · Patrick Burns_

**Headline:** Random portfolios are a method for performance measurement and constraint evaluation, using sampling from feasible portfolios under constraints.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2009/randport_practice_theory_annotated.pdf>
- Local: `./_cache/files/2009/2009__patrick_burns.pdf`

## Topics
- performance measurement
- constraint evaluation
- risk model validation
- portfolio optimization
- statistical hypothesis testing

## Methods
- random permutation tests
- statistical bootstrap
- random search optimization
- rejection sampling

## Datasets used
- FTSE 350 daily 2006-01-01 to 2006-06-01

## Code & tools
*(none extracted)*

## Key findings
- Random portfolio testing may incorrectly identify funds with zero skill as skilled.  
  > If population is 90% IR=0, 10% IR=1, almost half of selected will be zero skill
- Conditional analysis improves skill detection accuracy.  
  > Unconditionally we need to see a 40% return... Conditional on the starting portfolio, we only need to see a 33% return
- Constraining volatility can paradoxically increase downside risk.  
  > When we constrain more, we expect to be giving up some of the up-side to protect against the down-side. In this case we get just the opposite

## Applications
- performance measurement
- testing trading strategies
- evaluating constraints
- validating risk models

## References cited
- David Kane's presentation

## See also
- [`years/2009.md`](../years/2009.md)
- [`speakers/patrick_burns.md`](../speakers/patrick_burns.md)
- [`topics/performance_measurement.md`](../topics/performance_measurement.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3)*

