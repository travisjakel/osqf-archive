---
type: Talk
title: Analyzing Illiquid and Opaque Returns
description: "Analyzing illiquid and opaque investments using returns rather than holdings, with a focus on liquid factor models and partial least squares estimation."
timestamp: "2026-07-08T00:00:00Z"
year: 2025
date: ~
speaker: Dale Rosenthal
speaker_slug: dale_rosenthal
talk_type: Tutorial
time_slot: ~
file_format: pdf
file_url: "https://www.osqf.org/archive/2025/DaleRosenthal-seminar.pdf"
file_local: "./_cache/files/2025/2025__dale_rosenthal.pdf"
slug: 2025__dale_rosenthal
status: archived
tags: [osqf, 2025, dale_rosenthal]
---

# Analyzing Illiquid and Opaque Returns

_2025 · Dale Rosenthal (Parametric Portfolio Associates, LLC (affiliated with Morgan Stanley))_

**Headline:** Analyzing illiquid and opaque investments using returns rather than holdings, with a focus on liquid factor models and partial least squares estimation.

## Source
- File format: `pdf`
- URL: <https://www.osqf.org/archive/2025/DaleRosenthal-seminar.pdf>
- Local: `./_cache/files/2025/2025__dale_rosenthal.pdf`
- Talk type: Tutorial

## Topics
- liquid factor models
- illiquid asset analysis
- factor construction
- partial least squares (PLS)
- hedge fund returns
- market liquidity

## Methods
- Partial Least Squares (PLS)
- Creating less-correlated variables (e.g., R2KSPX, R1KVMG, YCLevel, YCSlope, YCBump, IG10, HY5IG10, InflSurp5Y)
- Feature engineering for correlation reduction

## Datasets used
- S&P 500 daily log returns (2015-2024)
- Russell 2000, Russell 1000 Value/Growth
- UST yields (3M, 2Y, 5Y, 10Y, 30Y), TIPS
- VIX, IVI, VSTOXX, Nikkei 225 VI
- iBoxx IG/HY indices
- Corporate bond fund returns (HY, $22bn AUM)

## Code & tools
*(none extracted)*

## Key findings
- Liquid factors (e.g., S&P 500, yield curve factors) explain returns as effectively as traditional models while being more stable.  
  > Found liquid factors did almost as well as accepted models. Suggested OOS betas more stable over time; for our data: yes!
- Feature engineering (e.g., R2KSPX = Russell 2000 - S&P 500) reduces correlations between variables by 70-90%.  
  > Almost all non-SP500, non-VIX variances came down. Good!
- Partial least squares (PLS) improves coefficient stability by biasing toward liquid hedging instruments.  
  > This is a form of biased estimation, like shrinkage. But bias is toward more liquid hedging instruments = OK.

## Applications
- Hedge fund performance analysis
- Private capital return evaluation
- Liquidity risk modeling

## References cited
- Connor 1995
- Cremers et al 2012
- Kan and Robotti 2008

## See also
- [`years/2025.md`](../years/2025.md)
- [`speakers/dale_rosenthal.md`](../speakers/dale_rosenthal.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

