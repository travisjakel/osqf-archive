---
type: Talk
title: An Application in Machine Learning - This Time Will Never Be Different
description: "Analysis of serial defaults and debt structures using machine learning to challenge the 'this time is different' syndrome in financial crises"
timestamp: "2026-07-08T00:00:00Z"
year: 2019
date: ~
speaker: Joan Zhang
speaker_slug: joan_zhang
talk_type: Talk
time_slot: "16:45 - 17:05"
file_format: pptx
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/JoanZhang.pptx"
file_local: "./_cache/files/2019/2019__joan_zhang.pptx"
slug: 2019__joan_zhang
status: archived
tags: [osqf, 2019, joan_zhang]
---

# An Application in Machine Learning - This Time Will Never Be Different

_2019 · Joan Zhang (WBA)_

**Headline:** Analysis of serial defaults and debt structures using machine learning to challenge the 'this time is different' syndrome in financial crises

## Source
- File format: `pptx`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/JoanZhang.pptx>
- Local: `./_cache/files/2019/2019__joan_zhang.pptx`
- Talk type: Talk
- Time slot: 16:45 - 17:05

## Topics
- financial crises analysis
- debt structure modeling
- machine learning applications in economics

## Methods
- clustering analysis (Hopkins Statistic, Mclust)
- correlation analysis (Pearson/Spearman)
- data preprocessing (log transformation, outlier handling)

## Datasets used
- External Debt Ratio (89 obs, mean=2.47)
- Total Debt Ratio (89 obs, mean=4.37)
- Domestic Debt Ratio (89 obs, mean=1.90)

## Code & tools
- Mclust (R package for clustering)

## Key findings
- Strong correlation between external debt ratio and total debt ratio (Pearson=0.839)  
  > External to Total Debt Ratio |   | 0.8393286 | 0.8362263
- Hopkins statistic (H=0.23) indicates non-uniform distribution of debt data  
  > Hopkins test return H value = 0.23
- Domestic debt ratio shows weak correlation with total debt ratio (Pearson=0.715)  
  > Domestic to Total Debt Ratio |   | 0.7147191 | 0.6574123

## Applications
- financial risk assessment
- crisis prediction modeling

## References cited
*(none extracted)*

## See also
- [`years/2019.md`](../years/2019.md)
- [`speakers/joan_zhang.md`](../speakers/joan_zhang.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

