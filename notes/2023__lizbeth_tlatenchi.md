---
type: Talk
title: "Emerging Markets: The Relationship Between Corruption and Governance Practices"
description: Examines relationships between corruption types and governance in emerging markets using WGI and V-Dem datasets
timestamp: "2026-07-08T00:00:00Z"
year: 2023
date: ~
speaker: Lizbeth Tlatenchi
speaker_slug: lizbeth_tlatenchi
talk_type: Talk
time_slot: "15:00 - 15:20"
file_format: pptx
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2023/LizbethTlatenchi.pptx"
file_local: "./_cache/files/2023/2023__lizbeth_tlatenchi.pptx"
slug: 2023__lizbeth_tlatenchi
status: archived
tags: [osqf, 2023, lizbeth_tlatenchi, lasso_regression]
---

# Emerging Markets: The Relationship Between Corruption and Governance Practices

_2023 · Lizbeth Tlatenchi_

**Headline:** Examines relationships between corruption types and governance in emerging markets using WGI and V-Dem datasets

## Source
- File format: `pptx`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2023/LizbethTlatenchi.pptx>
- Local: `./_cache/files/2023/2023__lizbeth_tlatenchi.pptx`
- Talk type: Talk
- Time slot: 15:00 - 15:20

## Topics
- corruption in emerging markets
- governance practices
- statistical modeling
- data merging techniques
- policy implications

## Methods
- Lasso Regression
- dataset merging (WGI-V-Dem)
- correlation analysis

## Datasets used
- Worldwide Governance Indicators (WGI) 2011-2022
- Varieties of Democracy (V-Dem) 1789-2021

## Code & tools
- `glmnet`
- `zoo`
- `devtools`
- `vdemdata`
- `stargazer`
- `readxl`
- `kableExtra`

## Key findings
- Judicial corruption decision, political corruption index, and public sector corruption index showed strongest correlation with control of corruption  
  > Top performing variables from lasso model: Judicial corruption decision, Political Corruption Index, Public Sector Corruption Index
- Lasso regression identified three key corruption variables explaining governance outcomes  
  > Lasso Regression on corresponding years & ISO3 codes between both datasets
- Media and regime corruption variables had weaker correlations with control of corruption  
  > Media Corruption, Public Sector Corruption, Political Corruption * Would be the variables that have a high impact on the Control of Corruption variable

## Applications
- policy design for corruption mitigation
- governance reform strategies

## References cited
- Goldsmith (1999)
- Peyton (2012)
- Maria (2008)
- Coppedge et al. (2020)
- Kaufmann et al. (2010)

## See also
- [`years/2023.md`](../years/2023.md)
- [`speakers/lizbeth_tlatenchi.md`](../speakers/lizbeth_tlatenchi.md)
- [`methods/lasso_regression.md`](../methods/lasso_regression.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

