---
type: Talk
title: "Stroll Through the Forest: Applying Random Forest to Predict Credit Risk"
description: "Applying Random Forest to predict credit risk using a Brazilian dataset with over 100,000 consumers."
timestamp: "2026-07-08T00:00:00Z"
year: 2019
date: ~
speaker: Maisa Aniceto
speaker_slug: maisa_aniceto
talk_type: Lightning
time_slot: "09:23 - 09:29"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/MaisaAniceto.pdf"
file_local: "./_cache/files/2019/2019__maisa_aniceto.pdf"
slug: 2019__maisa_aniceto
status: archived
tags: [osqf, 2019, maisa_aniceto, random_forest]
---

# Stroll Through the Forest: Applying Random Forest to Predict Credit Risk

_2019 · Maisa Aniceto (PUC-Rio)_

**Headline:** Applying Random Forest to predict credit risk using a Brazilian dataset with over 100,000 consumers.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/MaisaAniceto.pdf>
- Local: `./_cache/files/2019/2019__maisa_aniceto.pdf`
- Talk type: Lightning
- Time slot: 09:23 - 09:29

## Topics
- credit risk prediction
- machine learning
- financial risk management

## Methods
- Random Forest
- Decision Tree

## Datasets used
- Brazilian credit dataset (100,000+ consumers, 21 variables)

## Code & tools
- R
- `randomForest`

## Key findings
- Random Forest outperforms Decision Trees in credit scoring due to higher tolerance to noise and overfitting.  
  > Its performance is constantly better than other algorithms (Wall, 2018). Its has high prediction accuracy... less likely to have overfitting issues (Tang, 2018).
- Model accuracy plateaus at ~78.41% with 500+ trees but computation time increases sharply.  
  > Number of Trees 500: Accuracy 78.41%... Time (sec) 311.43; 1000: 87.12%... 809.50 sec.
- 100 trees provided optimal balance between accuracy (78.17%) and computational efficiency.  
  > Around 100 trees... posed as the best alternative, presented consistent results throughout the measures applied.

## Applications
- credit risk evaluation
- financial risk management

## References cited
- Xu, 2017
- Wall, 2018
- Wang, 2012
- Lantz, 2013
- Tang, 2018
- Wang, 2011
- Huang, 2018

## See also
- [`years/2019.md`](../years/2019.md)
- [`speakers/maisa_aniceto.md`](../speakers/maisa_aniceto.md)
- [`methods/random_forest.md`](../methods/random_forest.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=33% (1/3), source=ocr(paddle)*

