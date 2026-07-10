---
type: Talk
title: Divide and Recombine for the Analysis of Large Complex Data with R
description: "Divide & Recombine (D&R) framework for analyzing large complex data using R front-end with Hadoop back-end, enabling parallel computation and statistical analysis at data granularity level."
timestamp: "2026-07-08T00:00:00Z"
year: 2014
date: ~
speaker: Bill Cleveland
speaker_slug: bill_cleveland
talk_type: Keynote
time_slot: "14:52 - 15:42"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/BillCleveland.pdf"
file_local: "./_cache/files/2014/2014__bill_cleveland.pdf"
slug: 2014__bill_cleveland
status: archived
tags: [osqf, 2014, bill_cleveland, big_data_analysis, logistic_regression]
---

# Divide and Recombine for the Analysis of Large Complex Data with R

_2014 · Bill Cleveland (Purdue University, Pacific Northwest National Laboratory (PNNL), Mozilla)_

**Headline:** Divide & Recombine (D&R) framework for analyzing large complex data using R front-end with Hadoop back-end, enabling parallel computation and statistical analysis at data granularity level.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2014/talk/BillCleveland.pdf>
- Local: `./_cache/files/2014/2014__bill_cleveland.pdf`
- Talk type: Keynote
- Time slot: 14:52 - 15:42

## Topics
- big data analysis
- distributed computing
- statistical methods
- R-Hadoop integration
- visualization techniques

## Methods
- logistic regression
- hierarchical modeling
- conditioning-variable division
- replicate division
- MapReduce

## Datasets used
*(none extracted)*

## Code & tools
- R
- `Hadoop`
- `HDFS`
- `MapReduce`
- `RHIPE`
- `datadr`
- `Trelliscope`
- protocol buffers

## Key findings
- D&R framework simplifies computation through embarrassingly parallel processing  
  > Framework is designed to make computation very simple, mostly embarrassingly parallel
- Conditioning-variable division enables natural data partitioning by subject matter  
  > division by bank ● bank is a conditioning variable
- Statistical accuracy of D&R results is slightly lower than full-data analysis  
  > statistical accuracy of the D&R result is typically less that that of the direct all-data result
- Hadoop scheduler enables fair cluster resource sharing among analysts  
  > Hadoop begins scheduling cores to the micro-computations of analyst 2 as those for analyst 1 end until usage is fair
- Trelliscope extends lattice graphics for large data visualization  
  > Extends trellis display to large complex data

## Applications
- big data analysis
- government organizations (DHS)
- statistical research
- cloud service appliances (AWS/GCP)

## References cited
*(none extracted)*

## See also
- [`years/2014.md`](../years/2014.md)
- [`speakers/bill_cleveland.md`](../speakers/bill_cleveland.md)
- [`topics/big_data_analysis.md`](../topics/big_data_analysis.md)
- [`methods/logistic_regression.md`](../methods/logistic_regression.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (5/5), source=ocr(paddle)*

