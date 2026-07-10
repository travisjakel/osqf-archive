---
type: Talk
title: A Time Series Platform For The Tidyverse
description: "Introduces tibbletime, a time series platform for the tidyverse, and demonstrates its use in algorithmic trading with Quantopian's Zipline via flyingfox and furrr."
timestamp: "2026-07-08T00:00:00Z"
year: 2018
date: ~
speaker: Matt Dancho
speaker_slug: matt_dancho
talk_type: Lightning
time_slot: ~
file_format: pptx
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/MattDancho.pptx"
file_local: "./_cache/files/2018/2018__matt_dancho.pptx"
slug: 2018__matt_dancho
status: archived
tags: [osqf, 2018, matt_dancho, time_series_analysis]
---

# A Time Series Platform For The Tidyverse

_2018 · Matt Dancho (Business Science)_

**Headline:** Introduces tibbletime, a time series platform for the tidyverse, and demonstrates its use in algorithmic trading with Quantopian's Zipline via flyingfox and furrr.

## Source
- File format: `pptx`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2018/MattDancho.pptx>
- Local: `./_cache/files/2018/2018__matt_dancho.pptx`
- Talk type: Lightning

## Topics
- time series analysis
- tidyverse integration
- anomaly detection
- algorithmic trading

## Methods
- collapse_by()
- rollify()
- filter_time()
- as_period()
- grid search optimization
- parallel processing

## Datasets used
*(none extracted)*

## Code & tools
- `tibbletime`
- `furrr`
- `flyingfox`
- `reticulate`
- `Zipline`
- `H2O`
- `LIME`

## Key findings
- tibbletime enables time-aware tibbles with grouped analysis functions like collapse_by() and rollify().  
  > library(tibbletime)
library(dplyr)
# library(tidyquant)
# FANG <- tidyquant::tq_get(c("FB", "AMZN", "NFLX", "GOOG"))
data(FANG)
> FANG_time
- Backtest optimization using Zipline in R via flyingfox achieved $11,494 maximum profit for a JPM strategy.  
  > $10,697
$11,473
$11,494
$11,494
$11,494
$9,823
$11,444
$11,494
- furrr combines future parallel processing with purrr iteration for efficient computation.  
  > furrr = future + purrr
future
Parallel Processing
purrr
Iteration
furrr
Parallel Iteration

## Applications
- algorithmic trading
- anomaly detection
- financial data analysis

## References cited
- http://www.business-science.io/business-science-labs/2018/05/31/backtesting- quantopian-zipline-tibbletime-furrr-flyingfox.html

## See also
- [`years/2018.md`](../years/2018.md)
- [`speakers/matt_dancho.md`](../speakers/matt_dancho.md)
- [`topics/time_series_analysis.md`](../topics/time_series_analysis.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=67% (2/3), source=ocr(paddle)*

