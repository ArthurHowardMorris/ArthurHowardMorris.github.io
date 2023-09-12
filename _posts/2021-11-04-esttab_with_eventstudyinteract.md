---
title: '2021-11-04'
categories:
  - coding
tags:
  - stata
  - esttab 
  - did
published: true
permalink: "/resources/esttab_with_eventstudyinteract.html"
---

Using the excellent [`eventstudyinteract`](https://github.com/lsun20/EventStudyInteract) this morning and needed to pipe the results to `esttab` rather than `coefplot`.
A quick Google lead to [this](https://twitter.com/MaraPadillaR/status/1450547203169263623) which seemed more hassle than it should be.

Here's a quick hack to tack on the end of the example from `help eventstudyinteract`.

After you estimate:

```
eventstudyinteract ln_wage g_* g0-g18, ///
  cohort(first_union) ///
  control_cohort(never_union) ///
  covariates(south) ///
  absorb(i.idcode i.year) ///
  vce(cluster idcode)
esttab
```
Here `esttab` doesn't give you are after, because the estimates of `g_* g0-g18` you're interested in are stored in `e(b_iw)` and `e(V_iw)` but `esttab` looks in `e(b)` and `e(V)`.
Ben Jann's `erepost` (`ssc install erepost`) makes it simple to put to put the results where `esttab` can find them:

```
matrix b_iw = e(b_iw)
matrix V_iw = e(V_iw)
erepost b = b_iw V = V_iw // ssc install erepost
esttab
```

Now `esttab` gives you what you're after.

Some things to keep in mind:
1. All the other `ereturn` output is left undisturbed so you can use it as you normally would.
2. `erepost` has overwritten the original estimates so it's probably worth setting them aside using `estimates store` in case you're interested in the controls etc.
3. Plots are often better than tables, especially for this sort of thing.
