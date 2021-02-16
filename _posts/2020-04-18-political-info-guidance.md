---
title: Political information flow and management guidance
categories:
  - articles
tags:
  - working paper
  - political economy
  - disclosure
  - lobbying
  - econometrics
published: true
---

[Political information flow and management guidance](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3403763)
with Dane Christensen, Beverly Walther, and Laura Wellman.

Here's the abstract:

> We examine whether politically active firms play a role in disseminating political information via their management guidance. We use multiple proxies based on campaign financing activity or the presence of a government affairs office to capture whether a firm is politically active. We find that politically active firms are more likely to issue management guidance overall, and especially when the government is a key customer of the firm. Further, relative to politically inactive firms, the guidance released by politically active firms is more likely to discuss government policies. In addition to using numerous econometric techniques to address self-selection concerns, we examine the timing of when guidance is issued. We find that politically active firms are more likely to issue guidance prior to the public revelation of government policy decisions. Collectively, these findings suggest that the privileged information firms obtain through their political activities is shared with investors through voluntary disclosures.

Among other more conventional analyses, we are able to show that firms with political collections appear to shift their guidance to just before the final vote on bills that matter to their industry. Here is figure 1 from our paper, where we plot timing of guidance relative to the final vote date.


![Figure 1](/assets/img/CMWW_F1_MAIN.png)

To make this graph we use `kdens` and `twoway rarea` in Stata.
The steps for this weren't obvious to me initially.

First load the data and label the variable of interest:
```stata
use "./timeToBillData.dta", clear
lab var timeToBill "Days from Final Vote to Guidance"
```
Second, estimate the density function for the non-connected group with a confidence interval
```stata
* not connected
kdens timeToBill if Connected == 0 & /// non-connected
		GUIDE == 1 & /// issue guidance
        !mi(lobbycount) & lobbycount>0 & /// peers lobby on this bill
		mi(timeToEA) & /// not bundled with an earnings announcement
        month < 1 & month > - 2 , /// limits to month -1 and 0
		ll(-31.5) ul(30) /// set the limits (+/- 30 days)
        /*kernel(epanechnikov)*/ /// epanechnikov kernel is the default
        reflection /// determines the shape at the bounds
        bw(n) /// bn(n) lets this data define the bins
		gen(d1 x1) /// saves the line
        ci(ci1_1 ci1_2) // saves the confidence interval
```

Third, estimate the density function for the connected group with a confidence interval

```stata
kdens timeToBill if Connected == 1 & /// non-connected
		GUIDE == 1 & /// issue guidance
        !mi(lobbycount) & lobbycount>0 & /// peers lobby on this bill
		mi(timeToEA) & /// not bundled with an earnings announcement
        month < 1 & month > - 2 , /// limits to month -1 and 0
		ll(-31.5) ul(30) /// set the limits (+/- 30 days)
        /*kernel(epanechnikov)*/ /// epanechnikov kernel is the default
        reflection bw(5.2560433) /// here we apply the bin from Connected=0 group
		gen(d0 x0) /// saves the line
        ci(ci0_1 ci0_2) // saves the confidence interval
```

Finally, plot the estimated density functions and their confidence intervals:

```stata
twoway rarea ci0_1 ci0_2 x0 , color(green*.2) || ///
	rarea ci1_1 ci1_2 x1 , color(blue*.2) || ///
	line d1 x1, lc(blue) || line d0 x0, lc(green) lp(shortdash) ///
	legend(order(3 "Not Connected" 4 "Connected") pos(7) ring(0) col(1)) ///
	xlabel(-30(10)30)  ytitle("Epanechnikov Kernel Density")
```
... and save the graph if you like:

```stata
graph export "./Tabs/F1_MAIN.png" , replace
```
