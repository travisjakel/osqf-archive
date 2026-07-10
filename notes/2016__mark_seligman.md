---
type: Talk
title: Controlling for Monotonicity in Random Forest Regressors
description: "This talk presents a method to enforce monotonicity constraints in random forest regressors, ensuring predictions align with domain knowledge."
timestamp: "2026-07-08T00:00:00Z"
year: 2016
date: ~
speaker: Mark Seligman
speaker_slug: mark_seligman
talk_type: Talk
time_slot: "11:05 - 11:25"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/MarkSeligman.pdf"
file_local: "./_cache/files/2016/2016__mark_seligman.pdf"
slug: 2016__mark_seligman
status: archived
tags: [osqf, 2016, mark_seligman, random_forests]
---

# Controlling for Monotonicity in Random Forest Regressors

_2016 · Mark Seligman_

**Headline:** This talk presents a method to enforce monotonicity constraints in random forest regressors, ensuring predictions align with domain knowledge.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/MarkSeligman.pdf>
- Local: `./_cache/files/2016/2016__mark_seligman.pdf`
- Talk type: Talk
- Time slot: 11:05 - 11:25

## Topics
- random forests
- monotonicity constraints
- regression models
- machine learning

## Methods
- Arborist
- RegMono
- random forest splitting with constraints

## Datasets used
- Boston housing data
- simulated data

## Code & tools
- `Rborist`
- `CRAN`

## Key findings
- The regMono option allows per-predictor monotonicity constraints with probabilistic rejection.  
  > regMono option: Vector of probabilities, with sign. Length == # predictors.
- Constrained forests show comparable variance to unconstrained models in simulations.  
  > Variance vs. distance from response center: Unconstrained (blue) vs monotone (red) 10000 repeats

## Applications
- ensuring model predictions follow known monotonic relationships in domains like finance and economics

## References cited
- Wright and Ziegler [to appear]
- Lichman [2013]
- Harrison and Rubinfeld [1978]

## See also
- [`years/2016.md`](../years/2016.md)
- [`speakers/mark_seligman.md`](../speakers/mark_seligman.md)
- [`topics/random_forests.md`](../topics/random_forests.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=0% (0/2), source=ocr(paddle)*

