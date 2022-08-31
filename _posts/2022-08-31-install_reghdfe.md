---
title: '2022-08-31'
categories:
  - code
  - reghdfe
  - stata
  - fixed effects
published: true
permalink: "/resources/install_reghdfe.html"
---

This post is the first in a series of posts based on answers to questions I get frequently via email.

[`reghdfe`](http://scorreia.com/software/reghdfe/) is a widely used package for Stata written by Sergio Correia. I've heard complaints that `reghdfe` makes it too easy to throw way too many fixed-effects into regressions, though I think that the careful treatment of singletons and degrees of freedom more than makes up for this. Maybe every download of `reghdfe` should come with ["A Brief Parable of Overdifferencing"](https://www.johnhcochrane.com/research-all/a-brief-parable-of-overdifferencingnbsp), and Ed deHaan's excellent ["Using and Interpreting Fixed Effects Models"](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3699777).

While Sergio's documentation is quite clear, installation seems to trip folks up because it has more dependancies (it should--the package does a lot) than other Stata packages. Additionally, folks have written packages that depend on different versions of `reghdfe`, so being able to change installations is useful.   

If you're getting hard-to-diagnose errors, you may be able to solve them be reinstalling.

To install the stable version distributed through SSC:

```Stata
// 5
* Install ftools
cap ado uninstall ftools
ssc install ftools
* Install reghdfe
cap ado uninstall reghdfe
ssc install reghdfe
cap ado uninstall ivreghdfe
cap ssc install ivreg2
ssc install ivreghdfe
```

This version supports most packages that depend on reghdfe, however [`sumhdfe`](https://github.com/ed-dehaan/sumhdfe) depends on the development version which Sergio maintains on github.

The following will install the latest version of `reghdfe`, replacing any other version if you have it.

```Stata
* Install ftools
cap ado uninstall ftools
net install ftools, from("https://raw.githubusercontent.com/sergiocorreia/ftools/master/src/")
* Install reghdfe 6.x
cap ado uninstall reghdfe
net install reghdfe, from("https://raw.githubusercontent.com/sergiocorreia/reghdfe/master/src/")
cap ado uninstall ivreghdfe
cap ssc install ivreg2 // Install ivreg2, the core package
net install ivreghdfe, from("https://raw.githubusercontent.com/sergiocorreia/ivreghdfe/master/src/")
```

Note also, that once you've installed the latest version you can access earlier versions back to V3 with the `version(#)` option. Adding this option throughout your code will prevent the code from breaking if syntax evolves in later versions. I keep the development version installed and use the `version(5)` option to point to the latest stable release (the one most folks have installed right now) so that my scripts run on other's machines. This has the advantage of being explicit about the version that I'm using.
