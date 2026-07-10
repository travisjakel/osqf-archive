---
type: Talk
title: Tests for Robust versus Least Squares Factor Model Fits
description: Presentation on statistical tests comparing robust and least squares factor model fits in finance.
timestamp: "2026-07-08T00:00:00Z"
year: 2014
date: ~
speaker: Doug Martin
speaker_slug: doug_martin
talk_type: Lightning
time_slot: ~
file_format: pptx
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/DouglasMartin.pptx"
file_local: "./_cache/files/2014/2014__doug_martin.pptx"
slug: 2014__doug_martin
status: archived
tags: [osqf, 2014, doug_martin, factor_model_comparison]
---

# Tests for Robust versus Least Squares Factor Model Fits

_2014 · Doug Martin (University of Washington)_

**Headline:** Presentation on statistical tests comparing robust and least squares factor model fits in finance.

## Source
- File format: `pptx`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/DouglasMartin.pptx>
- Local: `./_cache/files/2014/2014__doug_martin.pptx`
- Talk type: Lightning

## Topics
- factor model comparison
- robust regression
- statistical hypothesis testing
- financial econometrics

## Methods
- Hausman-type test (T1)
- Wald-type test (T2)
- robust regression techniques

## Datasets used
*(none extracted)*

## Code & tools
- R package 'robust'
- lsRobTest function

## Key findings
- T1 test (Hausman-type) showed p-value of 0.65, failing to reject normality assumption.  
  > T1  p-value = .65
- T2 test (Wald-type) showed p-values of 0.82, also failing to reject composite error distribution assumption.  
  > T2 p-values = .82
- lsRobTest function in 'robust' package implements both T1 and T2 tests for regression bias.  
  > New functions in package robust (Kjell Konis)... lsRobTest

## Applications
- financial risk modeling
- asset management
- regression diagnostics

## References cited
- Bailer, Maravina and Martin (2011)
- Maravina and Martin (2014) SSRN
- Hausman (1978)

## See also
- [`years/2014.md`](../years/2014.md)
- [`speakers/doug_martin.md`](../speakers/doug_martin.md)
- [`topics/factor_model_comparison.md`](../topics/factor_model_comparison.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=0% (0/3), source=ocr(paddle)*

