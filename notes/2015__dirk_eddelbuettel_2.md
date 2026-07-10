---
type: Talk
title: RblpapiConnecting R to the data service that shall not be named
description: "The Rblpapi package provides an R interface to a major financial data service, rewritten to use Rcpp instead of Java and hosted on GitHub."
timestamp: "2026-07-08T00:00:00Z"
year: 2015
date: ~
speaker: Dirk Eddelbuettel
speaker_slug: dirk_eddelbuettel
talk_type: Lightning
time_slot: ~
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/DirkEddelbuettel.pdf"
file_local: "./_cache/files/2015/2015__dirk_eddelbuettel_2.pdf"
slug: 2015__dirk_eddelbuettel_2
status: archived
tags: [osqf, 2015, dirk_eddelbuettel, r_package_development, rcpp]
---

# RblpapiConnecting R to the data service that shall not be named

_2015 · Dirk Eddelbuettel_

**Headline:** The Rblpapi package provides an R interface to a major financial data service, rewritten to use Rcpp instead of Java and hosted on GitHub.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2015/talk/DirkEddelbuettel.pdf>
- Local: `./_cache/files/2015/2015__dirk_eddelbuettel_2.pdf`
- Talk type: Lightning

## Topics
- R package development
- financial data access
- API integration
- open-source software

## Methods
- Rcpp
- shared library with rpath-encoded path
- Travis CI integration

## Datasets used
*(none extracted)*

## Code & tools
- `Rblpapi`
- `Rcpp`
- Travis CI
- `GitHub`
- ghrr repository

## Key findings
- The package was rewritten to be lighter and simpler using Rcpp.  
  > · Lighter - no longer uses or requires Java
· Simpler - leverages Rcpp
- The current version is robust, fast, and implements most widely-used features.  
  > · Robust and fast
· Implements most widely-used features
- Core functions include data retrieval for equities and indices.  
  > · bdp(c("ESA Index", "SPY US Equity"), c("PX_LAST", "VOLUME"))
- The package may not be on CRAN due to vendor API restrictions.  
  > · We prefer Open Source; package may not go on CRAN as is

## Applications
- financial data access from R

## References cited
*(none extracted)*

## See also
- [`years/2015.md`](../years/2015.md)
- [`speakers/dirk_eddelbuettel.md`](../speakers/dirk_eddelbuettel.md)
- [`topics/r_package_development.md`](../topics/r_package_development.md)
- [`methods/rcpp.md`](../methods/rcpp.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (4/4), source=ocr(paddle)*

