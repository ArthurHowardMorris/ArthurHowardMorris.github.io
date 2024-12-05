---
title: '2024-02-01'
categories:
  - writing
tags:
  - econometrics
  - clustered standard errors
published: false
---
Clustered standard errors when the number of clusters is small.

I found writing up what I learned from reading about the SUTVA to be very
useful, so I'm going to dive into another issue that keep coming up: should we
use clustered standard errors when there are only a few clusters? Examples:

1. Clustering by state when there are only 14 states in the dataset.
2. Clustering by year in a shortish panel where t=10.
3. Clustering by industry when only 20 industries are represented in the data.

The second of these is quite common; but to me they just don't seem like the right thing to do. Let me walk through why I think this.

## Sandwich Size Matters

My intuition starts with White-Huber standard errors:

> "In microeconometrics applications the model errors are often conditionally heteroskedastic. ... Microeconometric analysis uses robust standard errors [(White 1980)](https://www.jstor.org/stable/1912934) wherever possible." Cameron & Trivedi (2005) p. 74-75

"Robust standard errors"[^rob] colloquially refer to standard errors calculated using the heteroskedasticity-consistent covariance matrix estimator presented in [White (1980)](https://www.jstor.org/stable/1912934). Sometimes called the "sandwich estimator", because it looks exactly like a sandwich:

  <img src="https://arthurhowardmorris.github.io/assets/img/EHW.png" width="400">  

[^rob]: These standard errors are available in most statistical packages as "robust" standard errors. For example, the following from the Stata documentation of the `regress` command `regress gpmw foreign, vce(robust)`.



<!-- An aside, and maybe an expression of bias, I don't think that the choice of -->
<!-- clustering fits any of the definitions of conservative that I know. It's a -->
<!-- design choice, it's correct if the data are clustered and it's not if they -->
<!-- aren't. In fact, I've found that adding year clusters in short panels often -->
<!-- __shrinks__ standard errors.[^pete] -->

<!-- [^pete]: Rather than simulate this myself I'll point you to the graph in petersen -->

A colleague recently asked me to read a paper they had written, the paper was great. There was a table that caught my eye: several of the models used standard errors clustered at the industry level and there were only about 20 industries in the actual data set. I asked about this, and my interlocutor replied that a reviewer had asked for this. The reviewer had asked for specifications with fewer clusters. This was interesting. I've also heard something similar from time to time.

