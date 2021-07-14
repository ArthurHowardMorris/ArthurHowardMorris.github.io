---
published: true
title: "Count Data"
---
# Modeling count and other non-negative outcomes.

When researchers are faced with modeling non-negative outcomes (_y_) several questions often arise.

## The data are skewed, can we use _log(y)_ or _log(1+y)_

tldr; __No, don't.__

Why are these approaches bad?

[Santos Silva and Tenreyro (2006)](https://direct.mit.edu/rest/article/88/4/641/57668/The-Log-of-Gravity)

1. _log(y)_ is __inconsistent__ in the presence of heteroskedasticity. (See Santos Silva and Tenreyro (2006) Section 3.)
2. Count variables are _intrinsically heteroskedastic_ (Camron and Trivedi, 2006 p. 666), because as the conditional expectation of _y_ goes to zero so does the conditional variance of _y_, and vice versa (Also SST Section 3).
3. Santos Silva and Tenreyro also point out that our ability to learn about the conditional expectation of _y_ by modeling _log(y)_ is limited by the fact that _log(E(y))_ does not equal _E(log(y))_ (Jensen's inequality).

Since _log(0)_ is infinitely negative _log(1+y)_ becomes inviting, but is twice problematic. First because of the _log(y)_ problem treated in [Santos Silva and Tenreyro (2006)](https://direct.mit.edu/rest/article/88/4/641/57668/The-Log-of-Gravity). Second because interpretation of the estimated parameters becomes impossible. This for the simple reason that the semi-elasticity of a variable and the semi-elasticity of a constant and a variable are not equivalent. Put another way, when we model _log(1+y)_, in addition to the problems of _log(y)_, we have the added problem that we are now modeling the effect of _x_ on a different distribution of _y_ than the one we are actually interested in, and there is no readily available transformation that we can apply post-estimation to recover the parameters for the actual distribution that we are interested in.

Also, if you follow [Wooldridge on Twitter](https://mobile.twitter.com/jmwooldridge/status/1401674932929679361) you'll see that he finds _log(1+y)_ __very__ distressing, and why would you want to cause distress to one of the kindest people on the planet.

## What should we use instead?

tldr; __Poisson psuedo-maximum likelihood.__ How? [`ppmlhdfe`](http://scorreia.com/help/ppmlhdfe.html)

We want something that is consistent, robust, and allows inclusion of fixed effects.

The ability to include fixed effects eliminates most everything but Poisson FE ([Hausman et al. 1984 Econometrica](https://www.proquest.com/docview/214652350?pq-origsite=gscholar&fromopenview=true)), which has the inconveniently restrictive assumption that _y~Poisson_, i.e. it's mean equals it's variance. When this assumption fails the estimator becomes inconsistent.

However, Wooldridge (2010 Textbook section 18.2, and several of his papers in the late 1990s) shows that the Poisson quasi-maximum likelihood (or psuedo) estimator relaxes all assumptions about the distribution of _y_, and only assume that the data are (1) free from perfect collinearity and (2) mean independent (both standard assumptions). While overdispersion makes the estimator less efficient there are (1) no better alternatives without restrictive distributional assumptions, and (2) straightforward adjustments to the variance-covariance matrix that can address this (Cameron and Trivedi 2005 present an adjustment similar to White's sandwiched standard errors, but `ppmlhdfe` provides a number of approaches to this problem).
