---
type: Talk
title: mlr3 Pipelines
description: "Presentation on mlr3 pipelines for machine learning in R, covering preprocessing, stacking, and hyperparameter tuning."
timestamp: "2026-07-08T00:00:00Z"
year: 2025
date: ~
speaker: Lars Kothoff
speaker_slug: lars_kothoff
talk_type: Talk
time_slot: "13:10 - 13:30"
file_format: pdf
file_url: "https://www.osqf.org/archive/2025/LarsKothoff.pdf"
file_local: "./_cache/files/2025/2025__lars_kothoff.pdf"
slug: 2025__lars_kothoff
status: archived
tags: [osqf, 2025, lars_kothoff]
---

# mlr3 Pipelines

_2025 · Lars Kothoff (University of Wyoming)_

**Headline:** Presentation on mlr3 pipelines for machine learning in R, covering preprocessing, stacking, and hyperparameter tuning.

## Source
- File format: `pdf`
- URL: <https://www.osqf.org/archive/2025/LarsKothoff.pdf>
- Local: `./_cache/files/2025/2025__lars_kothoff.pdf`
- Talk type: Talk
- Time slot: 13:10 - 13:30

## Topics
- machine learning pipelines
- preprocessing in R
- hyperparameter tuning
- stacking ensembles
- pipeline operators
- R programming for ML

## Methods
- stacking
- bagging
- hyperparameter tuning with MBO
- PCA
- imputation methods
- cross-validation

## Datasets used
- boston_housing
- sonar

## Code & tools
- `mlr3verse`
- `mlr3pipelines`
- R
- `classif.rpart`
- `classif.kknn`
- `classif.log_reg`
- `auto_tuner`
- `benchmark`
- po()

## Key findings
- Benchmark results show RF achieved 96.8% accuracy on breast_cancer data  
  > classif.acc 0.9677912
- PipeOps enable modular pipeline construction with po() function  
  > constructed with the po() function
- Robustify preprocessing includes 11 steps for data cleaning  
  > 1. po("removeconstants") ... 11. po("removeconstants")

## Applications
- model selection
- hyperparameter tuning
- data preprocessing

## References cited
- mlr3book.mlr-org.com
- mlr3pipelines.mlr-org.com

## See also
- [`years/2025.md`](../years/2025.md)
- [`speakers/lars_kothoff.md`](../speakers/lars_kothoff.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3)*

