---
type: Talk
title: Robust Covariances And DistancesCommon Risk Factor Versus Idiosyncratic Outliers
description: "The talk discusses robust covariance estimation techniques for distinguishing between common risk factors and idiosyncratic outliers in financial data, with applications to portfolio optimization and risk management."
timestamp: "2026-07-08T00:00:00Z"
year: 2013
date: ~
speaker: Doug Martin
speaker_slug: doug_martin
talk_type: Talk
time_slot: "13:50 - 14:10"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/DougMartin.pdf"
file_local: "./_cache/files/2013/2013__doug_martin.pdf"
slug: 2013__doug_martin
status: archived
tags: [osqf, 2013, doug_martin, minimum_covariance_determinant_mcd]
---

# Robust Covariances And DistancesCommon Risk Factor Versus Idiosyncratic Outliers

_2013 · Doug Martin (University of Washington)_

**Headline:** The talk discusses robust covariance estimation techniques for distinguishing between common risk factors and idiosyncratic outliers in financial data, with applications to portfolio optimization and risk management.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2013/talk/DougMartin.pdf>
- Local: `./_cache/files/2013/2013__doug_martin.pdf`
- Talk type: Talk
- Time slot: 13:50 - 14:10

## Topics
- robust covariance estimation
- outlier detection
- portfolio optimization
- market risk factors
- diversification benefits
- statistical finance

## Methods
- Minimum Covariance Determinant (MCD)
- pairwise robust covariance estimates
- Mahalanobis Squared Distance (MSD)
- robust scale/location estimation
- affine equivariant estimators

## Datasets used
*(none extracted)*

## Code & tools
- R robust package
- `PerformanceAnalytics`
- `GmvPortfolios.r`
- `btShell.portopt.r`
- `xts`
- `lattice`

## Key findings
- Robust covariance estimates (e.g., MCD) provide more realistic diversification benefits compared to classical methods.  
  > CLASSIC CORR. = .30 ... ROBUST CORR. = .65 A more realistic view of a lower diversification benefit!
- Pairwise robust estimators may be necessary for specific risk outliers due to breakdown risks.  
  > N.B. Affine transformations increase the percent of rows with outliers, so no need to restrict attention to affine equivariant estimators.
- Outlier detection using robust scale estimates (e.g., 2.83σ thresholds) achieves ~0.5% false positive rate for normal returns.  
  > Outliers: returns outside of ( µˆ − sˆ ⋅ 2.83, µˆ + sˆ ⋅ 2.83) Probability of normal return being an outlier: 0.5%

## Applications
- portfolio optimization
- risk management
- outlier detection in hedge funds
- diversification analysis

## References cited
- Alqallaf, Konis, Martin and Zamar (2002)
- Scherer and Martin (2005)
- Maronna, Martin, and Yohai (2006)
- Boudt, Peterson & Croux (2008)
- Alqallaf, Van Aelst, Yohai and Zamar (2009)
- Martin, Clark, and Green (2010)
- Martin (2012)

## See also
- [`years/2013.md`](../years/2013.md)
- [`speakers/doug_martin.md`](../speakers/doug_martin.md)
- [`methods/minimum_covariance_determinant_mcd.md`](../methods/minimum_covariance_determinant_mcd.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

