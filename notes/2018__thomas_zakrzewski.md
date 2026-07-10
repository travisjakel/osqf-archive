---
type: Talk
title: Q-Gaussian Probability of Defaults Model
description: "Application of Q-Gaussian distributions to model corporate default probabilities, improving upon traditional Merton models"
timestamp: "2026-07-08T00:00:00Z"
year: 2018
date: ~
speaker: Thomas Zakrzewski
speaker_slug: thomas_zakrzewski
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/ThomasZakrzewski.pdf"
file_local: "./_cache/files/2018/2018__thomas_zakrzewski.pdf"
slug: 2018__thomas_zakrzewski
status: archived
tags: [osqf, 2018, thomas_zakrzewski, credit_risk_modeling]
---

# Q-Gaussian Probability of Defaults Model

_2018 · Thomas Zakrzewski (S&P Global Market Intelligence)_

**Headline:** Application of Q-Gaussian distributions to model corporate default probabilities, improving upon traditional Merton models

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/ThomasZakrzewski.pdf>
- Local: `./_cache/files/2018/2018__thomas_zakrzewski.pdf`
- Talk type: Lightning

## Topics
- credit risk modeling
- Q-Gaussian distribution
- Merton model
- empirical validation of PD models
- financial risk analytics

## Methods
- Merton model
- Q-Gaussian distribution
- ROC curve analysis
- direct proxy method for asset estimation

## Datasets used
- 650 North American industrial entities (2006-2012)
- UPS daily market data (2006-2012)
- UTX daily market data (2006-2012)

## Code & tools
- R package

## Key findings
- Q-Gaussian model provides stronger prediction signals for corporate defaults  
  > q-PD trend arise sharply before the downgrade happen, and is much higher than m-PD
- Merton model's Gaussian assumption is inadequate for real-world data  
  > empirical analysis point to fat tail distributions like q-Gaussian
- Q-Gaussian PD shows 0.97 AUC in 1-year default prediction  
  > AUC = 0.97
- Q-Gaussian better captures tail risks in log-asset-returns  
  > Q-Gaussian distribution is applied in finance... due to its heavy tails

## Applications
- credit risk assessment
- capital adequacy calculations
- risk management

## References cited
- http://www.acrn-journals.eu/resources/jofrp201404g.pdf
- https://www.sciencedirect.com/science/article/pii/S0378437114002313
- https://www.sciencedirect.com/science/article/pii/S0378437113005505

## See also
- [`years/2018.md`](../years/2018.md)
- [`speakers/thomas_zakrzewski.md`](../speakers/thomas_zakrzewski.md)
- [`topics/credit_risk_modeling.md`](../topics/credit_risk_modeling.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=50% (2/4)*

