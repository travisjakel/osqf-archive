---
type: Talk
title: Deep learning in R using MxNet
description: "Demonstrates how to use MXNet for deep learning in R, including installation, MNIST examples, and Shiny app integration."
timestamp: "2026-07-08T00:00:00Z"
year: 2016
date: ~
speaker: Qiang Kou
speaker_slug: qiang_kou
talk_type: Talk
time_slot: "16:17 - 16:37"
file_format: pdf
file_url: "https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/QiangKou.pdf"
file_local: "./_cache/files/2016/2016__qiang_kou.pdf"
slug: 2016__qiang_kou
status: archived
tags: [osqf, 2016, qiang_kou, deep_learning]
---

# Deep learning in R using MxNet

_2016 · Qiang Kou (Indiana University)_

**Headline:** Demonstrates how to use MXNet for deep learning in R, including installation, MNIST examples, and Shiny app integration.

## Source
- File format: `pdf`
- URL: <https://rinfinance.s3.amazonaws.com/past.rinfinance.com/agenda/2016/talk/QiangKou.pdf>
- Local: `./_cache/files/2016/2016__qiang_kou.pdf`
- Talk type: Talk
- Time slot: 16:17 - 16:37

## Topics
- deep learning
- MXNet
- R programming
- neural networks
- Shiny apps

## Methods
- convolutional neural networks (CNN)
- long short-term memory (LSTM) networks

## Datasets used
- MNIST dataset (https://www.kaggle.com/c/digit-recognizer/data)

## Code & tools
- `mxnet`
- `data.table`
- `Shiny`
- DRAT repo
- R

## Key findings
- MXNet is a flexible and efficient machine learning library for distributed systems.  
  > MXNet: A Flexible and Efficient Machine Learning Library for Heterogeneous Distributed Systems
- Installation instructions for Windows and Mac use the DRAT repository.  
  > install.packages("drat", repos="https://cran.rstudio.com") drat:::addRepo("dmlc") install.packages("mxnet")
- MNIST demo includes data preprocessing and model training code in R.  
  > library(mxnet) train <- read.csv("train.csv", header=TRUE) test <- read.csv("test.csv", header=TRUE)

## Applications
- image recognition
- deep learning model deployment

## References cited
*(none extracted)*

## See also
- [`years/2016.md`](../years/2016.md)
- [`speakers/qiang_kou.md`](../speakers/qiang_kou.md)
- [`topics/deep_learning.md`](../topics/deep_learning.md)

---
*Extraction: model=qwen3:14b, evidence_quote pass rate=100% (3/3)*

