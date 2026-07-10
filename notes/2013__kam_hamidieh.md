---
type: Talk
title: Recovering Risk Neutral Density from Traded Options Using R
description: "The RND package extracts risk neutral density from traded options, revealing market participants' expectations (with VIX as a special case)."
timestamp: "2026-07-08T00:00:00Z"
year: 2013
date: ~
speaker: Kam Hamidieh
speaker_slug: kam_hamidieh
talk_type: Lightning
time_slot: "16:26 - 16:38"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/KamHamidieh.pdf"
file_local: "./_cache/files/2013/2013__kam_hamidieh.pdf"
slug: 2013__kam_hamidieh
status: archived
tags: [osqf, 2013, kam_hamidieh]
---

# Recovering Risk Neutral Density from Traded Options Using R

_2013 · Kam Hamidieh (Cal State Univ Fullerton & Zoolytics LLC)_

**Headline:** The RND package extracts risk neutral density from traded options, revealing market participants' expectations (with VIX as a special case).

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/KamHamidieh.pdf>
- Local: `./_cache/files/2013/2013__kam_hamidieh.pdf`
- Talk type: Lightning
- Time slot: 16:26 - 16:38

## Topics
- Risk Neutral Density (RND)
- options pricing
- non-parametric estimation
- R programming
- financial modeling

## Methods
- non-parametric estimator
- single lognormal (Black-Scholes-Merton)
- generalized beta
- mixture of lognormals
- MOE (Mother Of all Extractions)

## Datasets used
- calls-2013-04-19.txt
- puts-2013-04-19.txt

## Code & tools
- `RND`
- `read.table`
- `MOE`
- R

## Key findings
- The RND package extracts probability density implied by market options  
  > Extracts the probability density implied by market options
- MOE provides a practical implementation for density extraction  
  > MOE (Mother Of all Extractions) for practitioners
- Density analysis reveals kurtosis and skewness insights  
  > Kurtosis, skewness, etc can be computed

## Applications
- Research
- Trading

## References cited
- "Recovering an Asset’s Implied PDF from Option Prices: An Application to Crude Oil during the Gulf Crisis" by W. R. Melick and C. P. Thomas, Journal of Financial and Quantitative Analysis, Vol. 32, No. 1 (Mar., 1997), pp. 91-115

## See also
- [`years/2013.md`](../years/2013.md)
- [`speakers/kam_hamidieh.md`](../speakers/kam_hamidieh.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3)*

