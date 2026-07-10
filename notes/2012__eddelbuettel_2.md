---
type: Talk
title: Wittier Webapps with RInside
description: This talk presents RInside and Wt toolkit for deploying R/C++ applications as web apps with minimal effort.
timestamp: "2026-07-08T00:00:00Z"
year: 2012
date: ~
speaker: Eddelbuettel
speaker_slug: eddelbuettel
talk_type: Lightning
time_slot: "09:05 - 09:30"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2012/talk/DirkEddelbuettel.pdf"
file_local: "./_cache/files/2012/2012__eddelbuettel_2.pdf"
slug: 2012__eddelbuettel_2
status: archived
tags: [osqf, 2012, eddelbuettel]
---

# Wittier Webapps with RInside

_2012 · Eddelbuettel_

**Headline:** This talk presents RInside and Wt toolkit for deploying R/C++ applications as web apps with minimal effort.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2012/talk/DirkEddelbuettel.pdf>
- Local: `./_cache/files/2012/2012__eddelbuettel_2.pdf`
- Talk type: Lightning
- Time slot: 09:05 - 09:30

## Topics
- web application frameworks
- RInside integration
- Wt toolkit
- R/C++ web apps
- deployment challenges

## Methods
- Wt toolkit features (comet programming, unified rendering API, WebSockets)
- RInside integration with Rcpp
- Qt-to-Wt conversion

## Datasets used
*(none extracted)*

## Code & tools
- `Wt`
- `RInside`
- `Rcpp`
- Debian/Ubuntu

## Key findings
- Web app development has historically required juggling numerous disparate technologies  
  > Start with R and add ... a veritable alphabet soup: html, xml, css, ... cgi, Ajax, Javascript, websockets, ...
- Wt enables painless conversion of Qt apps to web apps  
  > ... to this Wt app is really painless
- RInside requires improvements for production use  
  > Single instance of R via RInside-so in the example, all 'session-specific data' goes back and forth to clients.

## Applications
- web deployment of R/C++ applications

## References cited
- http://en.wikipedia.org/wiki/Wt_(web_toolkit)
- http://dirk.eddelbuettel.com/code/rinside.html
- http://dirk.eddelbuettel.com/code/rcpp.html

## See also
- [`years/2012.md`](../years/2012.md)
- [`speakers/eddelbuettel.md`](../speakers/eddelbuettel.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3), source=ocr(paddle)*

