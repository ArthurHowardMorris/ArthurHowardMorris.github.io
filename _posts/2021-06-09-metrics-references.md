---
published: true
---
## useful metrics refs

nothing fancy, just a list of resources about how to do simple things right.

# count data

- [Cohn, Liu, & Wardlaw (2021 SSRN), Count data in finance](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3794859)
- [`ppmlhdfe`: Poisson pseudo-likelihood regression with multiple levels of fixed effects](http://scorreia.com/software/ppmlhdfe/)
- [Correia, Guimarães, Zylkin (2019a)](http://scorreia.com/research/ppmlhdfe.pdf)
- [Correia, Guimarães, Zylkin (2019b)](http://scorreia.com/research/separation.pdf)
- also [@jmwooldridge](https://twitter.com/jmwooldridge/status/1402044602895503363)

# staggared diff-in-diff

- [Sun & Abraham (2020 JE), Estimating dynamic treatment effects in event studies with heterogeneous treatment effects](https://www.sciencedirect.com/science/article/pii/S030440762030378X), [code on github](https://github.com/lsun20/EventStudyInteract)
- [Athey & Imbens (2021 JE), Design-based analysis in Difference-In-Differences settings with staggered adoption](https://www.sciencedirect.com/science/article/pii/S0304407621000488)
- [Goodman- Bacon (2018 NBER)](https://www.nber.org/papers/w25018), stata code `ssc install bacondecomp`.
- [Barrios (2021 SSRN) Staggeringly Problematic: A Primer on Staggered DiD for Accounting Researchers](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3794859), also provides example code for many of the methods.

# robust standard errors

[Cameron & Trivedi](http://cameron.econ.ucdavis.edu/mmabook/mma.html)

> "In microeconometrics applications the model errors are often conditionally heteroskedastic. ... Microeconometric analysis uses robust standard errors [[(White 1980)]](https://www.jstor.org/stable/1912934) wherever possible." p. 74-75

  1. "Robust standard errors" colloquially refer to standard errors calculated using the heteroskedasticity-consistent covariance matrix estimator presented in [White (1980)](https://www.jstor.org/stable/1912934). Sometimes called the "sandwich estimator", because it looks exactly like a sandwich:

![Obviously a sandwich, from Adabie et al. (2017 NBER)](/assets/img/EHW.png)

  2. These standard errors are available in most statistical packages as "robust" standard errors. For example, the following from the Stata documentation of the `regress` command.

```
sysuse auto, clear
generate gpmw = ((1/mpg)/weight)*100*1000
regress gpmw foreign
regress gpmw foreign, vce(robust)
```

# clustered standard errors

[__Cameron & Trivedi (2005)__](http://cameron.econ.ucdavis.edu/mmabook/mma.html) p. 75, 705-707, 829-845 (esp. 834)

> "Guarding against other misspecifications may also be warranted. In particular, when data are clustered standard errors should be robust to clustering." p. 74-75

> "In many microeconometrics applications it is reasonable to assume independence over _i_. However, the errors are potentially (1) __serially correlated__ (i.e. correlated over _t_ for a given _i_) and/or __heteroskedastic__. Valid statistical inference requires controlling for both of these factors. The White heteroskedastic consistent estimator ... is easily extended to short panels since for the _i_th observartion the error variance matrix is of finite dimension _T x T_ while _N_ [goes to infinity]." p. 705 NB: the _i_ here are individuals, while the _i_ in the notation of Adabie et al. are observations.

When you have many small clusters, say thousands of firms observed repeatedly over three to five years, then the meat of the sandwich estimator can be replaced with these clusters, as follows:

![A modified sandwich, from Adabie et al. (2017 NBER)](/assets/img/LZ.png)

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


[__Abadie, Athey, Imbens & Wooldridge (2017 NBER), When should you adjust standard errors for clustering?__](https://www.nber.org/papers/w24003)

> "We develop a new perspective on clustering adjustments to standard errors. We argue that there are two potential motivations for such adjustments, one based on clustered sampling, and one based on clustered assignment. Although when researchers look for formal justification for clustering, they typically rely on clustered sampling justifications, __we argue that clustered assignment is more commonly the setting of interest.__ This leads to new conclusions about when to adjust standard errors for clustering, and at what level to do the adjustment."

__Reccomendations:__

1. _"The researcher should assess whether the sampling process is clustered or not, and whether the assignment mechanism is clustered."_
  - _"If the answer to both is no, one should not adjust the standard errors for clustering, irrespective of whether such an adjustment would change the standard errors."_
2. _"We show that the standard Liang-Zeger cluster adjustment is conservative, and further, we derive an estimator for the correct variance that can be used if there is variation in treatment assignment within clusters and the fraction of clusters that is observed is known."_
3. _"This analysis extends to the case where fixed effects are included in the regression at the level of a cluster, with the provision that if there is no heterogeneity in the treatment effects, one need not adjust standard errors for clustering once fixed effects are included."_

[__Petersen (2009 RFS), Estimating Standard Errors in Finance Panel Data Sets: Comparing Approaches__](https://academic.oup.com/rfs/article/22/1/435/1585940?login=true)

Petersen provides code on his website to estimate two-way clustered standar errors. His code estimates the variance-covariance matrix using the following steps:

1. estimate the variance-covariance matrix, clustering on the first dimension (lets call this the 'firm' dimension -- in his .ado this is `vcf`)
2. estimate the variance-covariance matrix, clustering on the second dimension (lets call this the 'time' dimension -- in his .ado this is `vct`)
3. estimate the variance-covariance matrix clustering on a firm X time interaction (lets call this `vci`).
4. calculate the two-way clustered variance-covariance matrix as `vc2way = vcf + vct - vci` 

`reghdfe` provides a relatively general implementation of high-dimensional clustering.



[__Gow, Ormazabal & Taylor (2010 TAR), Correcting for Cross‐Sectional and Time‐Series Dependence in Accounting Research__](https://meridian.allenpress.com/accounting-review/article-abstract/85/2/483/53814/Correcting-for-Cross-Sectional-and-Time-Series)

#### A few notes:

  1. When _T_ is not large clustering on time may not be conservative.
  2. When incorporating many dimensions of fixed effects and clusters singletons may result. `reghdfe` removes them, see [Correia (2015 WP), Singletons, Cluster-Robust Standard Errors and Fixed Effects: A Bad Mix](http://scorreia.com/research/singletons.pdf) for a discussion.


### fixed-effects

- [`reghdfe`](http://scorreia.com/software/reghdfe/)
- [de Haan (2021 SSRN), Using and interpreting fixed effects models](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3699777)
- [`sumhdfe`](https://github.com/ed-dehaan/sumhdfe)

### binary outcomes with fe
