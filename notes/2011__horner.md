---
type: Talk
title: RackA Web Server Interface for R
description: "Rook is an R package enabling web application development with Rhttpd, reference classes, and server compatibility."
timestamp: "2026-07-08T00:00:00Z"
year: 2011
date: ~
speaker: Horner
speaker_slug: horner
talk_type: Lightning
time_slot: "16:30 - 17:00"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2011/JeffHorner.pdf"
file_local: "./_cache/files/2011/2011__horner.pdf"
slug: 2011__horner
status: archived
tags: [osqf, 2011, horner]
---

# RackA Web Server Interface for R

_2011 · Horner (Vanderbilt University)_

**Headline:** Rook is an R package enabling web application development with Rhttpd, reference classes, and server compatibility.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2011/JeffHorner.pdf>
- Local: `./_cache/files/2011/2011__horner.pdf`
- Talk type: Lightning
- Time slot: 16:30 - 17:00

## Topics
- R web application development
- web server interfaces
- R package development
- Rhttpd server
- rApache integration

## Methods
- reference classes (Builder, Static, Brewery)
- Rhttpd internal server
- Rook specification for server compatibility

## Datasets used
*(none extracted)*

## Code & tools
- `Rhttpd`
- `brew`
- `tools`
- `mod_R`
- `Rook`

## Key findings
- Rook provides three core functionalities: desktop web apps via Rhttpd, reference classes for app development, and server compatibility specs.  
  > Rook is a new package that does three things:...specification. Currently, only Rhttpd implements it, but rApache is close behind.
- Rhttpd allows starting a local web server with custom URLs for R applications.  
  > > s <- Rhttpd$new()
> s$start()
done
Server started on host 127.0.0.1 and port 17650.
- Rook's reference classes include Static, Brewery, Builder, and App for web app construction.  
  > Static$new(urls='/plots',root=tempdir}},
Brewery$new(url='/brew',root='.'),
App$new(function(env) {
- Rook defines a standardized calling convention between Rhttpd and web applications.  
  > Rook defines the calling convention between Rhttpd and web applications.
- rApache can host Rook applications with mod_R and brew integration.  
  > rApache with added support for Rook applications
{Web Browser}
Apache
mod_R
R Application Space

## Applications
- web application development
- desktop server hosting
- Apache integration

## References cited
- https://github.com/jeffreyhorner/rRack
- http://groups.google.com/group/rrook
- http://twitter.com/#!/@jeffreyhorner
- http://jeffreyhorner.tumblr.com/

## See also
- [`years/2011.md`](../years/2011.md)
- [`speakers/horner.md`](../speakers/horner.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=60% (3/5), source=ocr(paddle)*

