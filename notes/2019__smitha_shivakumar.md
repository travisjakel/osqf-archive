---
type: Talk
title: R-view on Prepayment and Interest rate risk in MBS
description: "Analysis of interest rate and prepayment risks in MBS using R, focusing on modeling techniques and loan default prediction."
timestamp: "2026-07-08T00:00:00Z"
year: 2019
date: ~
speaker: Smitha Shivakumar
speaker_slug: smitha_shivakumar
talk_type: Lightning
time_slot: "09:17 - 09:23"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/SmithaShivakumar.pdf"
file_local: "./_cache/files/2019/2019__smitha_shivakumar.pdf"
slug: 2019__smitha_shivakumar
status: archived
tags: [osqf, 2019, smitha_shivakumar]
---

# R-view on Prepayment and Interest rate risk in MBS

_2019 · Smitha Shivakumar_

**Headline:** Analysis of interest rate and prepayment risks in MBS using R, focusing on modeling techniques and loan default prediction.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2019/SmithaShivakumar.pdf>
- Local: `./_cache/files/2019/2019__smitha_shivakumar.pdf`
- Talk type: Lightning
- Time slot: 09:17 - 09:23

## Topics
- interest rate risk
- prepayment risk
- MBS modeling
- logistic regression
- credit risk analysis

## Methods
- Black-Derman-Toy model
- PSA prepayment model
- logistic regression

## Datasets used
- loan data 2007-2015 (890k observations, 75 variables)
- Federal Reserve mortgage rates (H15_MORTG_NA.txt)
- Treasury yields (USTreas.gov)

## Code & tools
- `m4fe`
- `BondLab`
- `pROC`
- R glm() function

## Key findings
- Higher loan amounts and worse credit grades correlate with increased default probability.  
  > The coefficients of the following features are positive: · Loan Amount · Interest Rate · Grade
- Annual income and home ownership (OWN/RENT) reduce default likelihood.  
  > The coefficients of the following features are negative: · Annual Income · Home Ownership - Own · Home Ownership - Rent
- Logistic regression achieved 76.06% accuracy at 30% default probability threshold.  
  > Cut off of 30% gave a good accuracy of 76.06%.
- PSA model better captures realistic prepayment patterns than simple assumptions.  
  > PSA will be the model used... because the model fits the reality better.

## Applications
- MBS risk management
- credit scoring
- loan pricing

## References cited
- Black-Derman-Toy model (Financial Analysts Journal 1990)

## See also
- [`years/2019.md`](../years/2019.md)
- [`speakers/smitha_shivakumar.md`](../speakers/smitha_shivakumar.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=75% (3/4), source=ocr(paddle)*

