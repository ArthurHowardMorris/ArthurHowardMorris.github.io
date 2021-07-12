---
published: true
title: "Standard Errors"
---
# Standard approach:

When working with long panels ($T>50$) in Finance and Accounting, cluster by both individual ($i$) and time period ($t$), taking care to drop singletons.

[`reghdfe`]() handles two-way clustering and singletons efficiently. [`sumhdfe`]() provides a straight-forward way to analyze the impact of singletons on your sample.

__Notate bene:__ In short panels, clustering by time is unlikely to be appropriate.

[Cameron & Trivedi](http://cameron.econ.ucdavis.edu/mmabook/mma.html) provide and excellent overview of why and how to cluster. This discussion, like all discussions of clustered standard errors, starts with 'robust' standard errors:

### robust standard errors

> "In microeconometrics applications the model errors are often conditionally heteroskedastic. ... Microeconometric analysis uses robust standard errors [[(White 1980)]](https://www.jstor.org/stable/1912934) wherever possible." p. 74-75

  1. "Robust standard errors" colloquially refer to standard errors calculated using the heteroskedasticity-consistent covariance matrix estimator presented in [White (1980)](https://www.jstor.org/stable/1912934). Sometimes called the "sandwich estimator", because it looks exactly like a sandwich:

  <img src="https://arthurhowardmorris.github.io/assets/img/EHW.png" width="400">  

  2. These standard errors are available in most statistical packages as "robust" standard errors. For example, the following from the Stata documentation of the `regress` command.

```
sysuse auto, clear
generate gpmw = ((1/mpg)/weight)*100*1000
regress gpmw foreign
regress gpmw foreign, vce(robust)
```

### clustered standard errors

Cameron & Trivedi (2005) p. 75, 705-707, 829-845 (esp. 834)

> "Guarding against other misspecifications may also be warranted. In particular, when data are clustered standard errors should be robust to clustering." p. 74-75

> "In many microeconometrics applications it is reasonable to assume independence over _i_. However, the errors are potentially (1) __serially correlated__ (i.e. correlated over _t_ for a given _i_) and/or __heteroskedastic__. Valid statistical inference requires controlling for both of these factors. The White heteroskedastic consistent estimator ... is easily extended to short panels since for the _i_th observartion the error variance matrix is of finite dimension _T x T_ while _N_ [goes to infinity]." p. 705 NB: the _i_ here are individuals, while the _i_ in the notation of Adabie et al. are observations.

When you have many small clusters, say thousands of firms observed repeatedly over three to five years, then the meat of the sandwich estimator can be replaced with these clusters, as follows:

<img src="https://arthurhowardmorris.github.io/assets/img/LZ.png" width="400">  

1. It is important to note that this estimator _assumes_ that the number of observations within a cluster is small and that the number of clusters is large. Clustering aggregates the clustered observations treats the clusters as ['superobservations'](https://www.stata.com/statalist/archive/2003-05/msg00550.html), thus access to the asymptotic properties of the sandwich estimator relies no longer on the number of observations, but on the number of clusters. As C & T point out, some stats packages know this and correct the degrees of freedom, to my knowledge `reghdfe` is the most careful about this.

2. To continue the example from above, clustering by manufacturer:

```
split make // make1 is the manufacturer
regress gpmw foreign, vce(cluster make1)  
reghdfe gpmw foreign, cluster(make1) noabsorb
```
  - NB: this is not an example of clustering in a panel, just of the syntax.
  - While not formal in any way, this example points out that clustering is not always conservative, _especially_ when the number of clusters is low (more on this below).

4. Finally:

> "Once fixed or random individual-specific effects are included the serial correlation in errors can be greatly reduced, but it may not be completely eliminated."

Abadie, Athey, Imbens & Wooldridge (2017 NBER) put a finer point on this, they show that when there is "no heterogeneity in the treatment effects, one need not adjust standard errors for clustering once fixed effects are included".

[Abadie, Athey, Imbens & Wooldridge (2017 NBER), "When should you adjust standard errors for clustering?"](https://www.nber.org/papers/w24003) in brief:

> "We develop a new perspective on clustering adjustments to standard errors. We argue that there are two potential motivations for such adjustments, one based on clustered sampling, and one based on clustered assignment. Although when researchers look for formal justification for clustering, they typically rely on clustered sampling justifications, __we argue that clustered assignment is more commonly the setting of interest.__ This leads to new conclusions about when to adjust standard errors for clustering, and at what level to do the adjustment."

__Reccomendations:__

1. _"The researcher should assess whether the sampling process is clustered or not, and whether the assignment mechanism is clustered."_
  - _"If the answer to both is no, one should not adjust the standard errors for clustering, irrespective of whether such an adjustment would change the standard errors."_
2. _"We show that the standard Liang-Zeger cluster adjustment is conservative, and further, we derive an estimator for the correct variance that can be used if there is variation in treatment assignment within clusters and the fraction of clusters that is observed is known."_
3. _"This analysis extends to the case where fixed effects are included in the regression at the level of a cluster, with the provision that if there is no heterogeneity in the treatment effects, one need not adjust standard errors for clustering once fixed effects are included."_

### two-way clustered standard errors

[__Petersen (2009 RFS), Estimating Standard Errors in Finance Panel Data Sets: Comparing Approaches__](https://academic.oup.com/rfs/article/22/1/435/1585940?login=true)
[__Gow, Ormazabal & Taylor (2010 TAR), Correcting for Cross‐Sectional and Time‐Series Dependence in Accounting Research__](https://meridian.allenpress.com/accounting-review/article-abstract/85/2/483/53814/Correcting-for-Cross-Sectional-and-Time-Series)

Petersen(2009) and Gow et al. (2010) argue that clustering by time, in addition to individual, often seems to matter in finance and accounting.

Peterson also emphasizes the assumption that the number of clusters should be large in Figure 5, which suggests that clustering on panels shorter than 50 periods can introduce bias into estimation of standard errors.

Petersen provides code on his website to estimate two-way clustered standard errors. His code estimates the variance-covariance matrix using the following steps:

1. estimate the variance-covariance matrix, clustering on the first dimension (lets call this the 'firm' dimension -- in his .ado this is `vcf`). This requires a wide panel.
2. estimate the variance-covariance matrix, clustering on the second dimension (lets call this the 'time' dimension -- in his .ado this is `vct`). This requires a long panel.
3. estimate the variance-covariance matrix clustering on the interaction of these two dimensions (lets call this `vci`).
4. calculate the two-way clustered variance-covariance matrix as `vc2way = vcf + vct - vci`



#### A few final notes notes on clustering:

  1. When _T_ is not large clustering on time may not be conservative.
  2. When incorporating many dimensions of fixed effects and clusters singletons often result. `reghdfe` removes them, see [Correia (2015 WP), Singletons, Cluster-Robust Standard Errors and Fixed Effects: A Bad Mix](http://scorreia.com/research/singletons.pdf) for a discussion.
