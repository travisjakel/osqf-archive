---
type: Talk
title: A Nonparametric Estimate of the Risk-Neutral Density and Its Applications
description: The talk presents a nonparametric method for estimating risk-neutral density and applies it to pricing variance swaps and identifying investment opportunities.
timestamp: "2026-07-08T00:00:00Z"
year: 2017
date: ~
speaker: Shuang Zhou
speaker_slug: shuang_zhou
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/ShaungZhou.pdf"
file_local: "./_cache/files/2017/2017__shuang_zhou.pdf"
slug: 2017__shuang_zhou
status: archived
tags: [osqf, 2017, shuang_zhou]
---

# A Nonparametric Estimate of the Risk-Neutral Density and Its Applications

_2017 · Shuang Zhou (University of Illinois at Chicago)_

**Headline:** The talk presents a nonparametric method for estimating risk-neutral density and applies it to pricing variance swaps and identifying investment opportunities.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2017/talk/ShaungZhou.pdf>
- Local: `./_cache/files/2017/2017__shuang_zhou.pdf`
- Talk type: Lightning

## Topics
- risk-neutral density estimation
- nonparametric methods
- variance swap pricing
- investment opportunities

## Methods
- piece-wise constant nonparametric approach
- weighted least squares (WLS) using all options
- cubic spline methods

## Datasets used
*(none extracted)*

## Code & tools
- `allop.RND`
- `bootCI.function`
- `allfit.pred.oneK`

## Key findings
- The nonparametric approach produces risk-neutral densities consistent with common market assumptions.  
  > Very consistent with the common guess of the risk-neutral density shape
- The method outperforms cubic spline approaches in pricing variance swaps for most time-to-expiration ranges.  
  > Our approach shows lower prediction errors compared to cubic spline methods across multiple days to expiration
- The technique enables identifying mispriced options through confidence interval analysis.  
  > Able to recognize some options on the markets that are under or above estimated

## Applications
- variance swap pricing
- option mispricing detection
- derivative fair price estimation

## References cited
- Ait-Sahalia, Y. and Lo, A. W.: Nonparametric estimation of state-price densities implicit in financial asset prices. Journal of Finance, 53(2):499-547, April 1998.
- Bakshi, G., Kapadia, N., and Madan, D.: Stock return characteristics, skew laws, and the differential pricing of individual equity options. The Review of Financial Studies, 16:101-143, 2003.
- Carr, P., Lee, R., and Wu, L.: Variance swaps on time-changed lévy processes. Finance Stoch, 16:335-355, 2012.
- Ghysels, E. and Wang, F.: Moment-implied densities: Properties and applications. Journal of Business & Economic Statistics, 32(1):88-111, January 2014.

## See also
- [`years/2017.md`](../years/2017.md)
- [`speakers/shuang_zhou.md`](../speakers/shuang_zhou.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

