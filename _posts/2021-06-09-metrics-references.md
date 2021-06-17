---
published: true
---
## useful metrics refs

nothing fancy, just a list of resources about how to do simple things right

### count data

- [Cohn, Liu, & Wardlaw (2021 SSRN), Count data in finance](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3794859)
- [`ppmlhdfe`: Poisson pseudo-likelihood regression with multiple levels of fixed effects](http://scorreia.com/software/ppmlhdfe/)
- [Correia, Guimarães, Zylkin (2019a)](http://scorreia.com/research/ppmlhdfe.pdf)
- [Correia, Guimarães, Zylkin (2019a)](http://scorreia.com/research/separation.pdf)
- also [@jmwooldridge](https://twitter.com/jmwooldridge/status/1402044602895503363) 

### staggared diff-in-diff

- [Sun & Abraham (2020 JE), Estimating dynamic treatment effects in event studies with heterogeneous treatment effects](https://www.sciencedirect.com/science/article/pii/S030440762030378X), [code on github](https://github.com/lsun20/EventStudyInteract)
- [Athey & Imbens (2021 JE), Design-based analysis in Difference-In-Differences settings with staggered adoption](https://www.sciencedirect.com/science/article/pii/S0304407621000488)
- [Goodman- Bacon (2018 NBER)](https://www.nber.org/papers/w25018), stata code `ssc install bacondecomp`.
- [Barrios (2021 SSRN) Staggeringly Problematic: A Primer on Staggered DiD for Accounting Researchers](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3794859), also provides example code for many of the methods.

### clustered standard errors

- [Cameron & Trivedi](http://cameron.econ.ucdavis.edu/mmabook/mma.html) p. 75, 705-707, 829-845 (esp. 834).
- [Abadie, Athey, Imbens & Wooldridge (2017 NBER), When should you adjust standard errors for clustering?](https://www.nber.org/papers/w24003)
- [Petersen (2009 RFS), Estimating Standard Errors in Finance Panel Data Sets: Comparing Approaches](https://academic.oup.com/rfs/article/22/1/435/1585940?login=true)
- [Gow, Ormazabal & Taylor (2010 TAR), Correcting for Cross‐Sectional and Time‐Series Dependence in Accounting Research](https://meridian.allenpress.com/accounting-review/article-abstract/85/2/483/53814/Correcting-for-Cross-Sectional-and-Time-Series)
- [Correia (2015 WP), Singletons, Cluster-Robust Standard Errors and
Fixed Effects: A Bad Mix](http://scorreia.com/research/singletons.pdf)
- [`reghdfe`](http://scorreia.com/software/reghdfe/)

### fixed-effects

- [`reghdfe`](http://scorreia.com/software/reghdfe/)
- [de Haan (2021 SSRN), Using and interpreting fixed effects models](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3699777)
- [`sumhdfe`](https://github.com/ed-dehaan/sumhdfe)

### binary outcomes with fe
