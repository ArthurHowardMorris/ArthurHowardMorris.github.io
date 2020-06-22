---
title: Political information flow and management guidance
date:
  2020/06/22: null
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
- under review at Management Science.

Here's the abstract:

> We examine whether politically active firms play a role in disseminating political information via their management guidance. We use multiple proxies based on campaign financing activity or the presence of a government affairs office to capture whether a firm is politically active. We find that politically active firms are more likely to issue management guidance overall, and especially when the government is a key customer of the firm. Further, relative to politically inactive firms, the guidance released by politically active firms is more likely to discuss government policies. In addition to using numerous econometric techniques to address self-selection concerns, we examine the timing of when guidance is issued. We find that politically active firms are more likely to issue guidance prior to the public revelation of government policy decisions. Collectively, these findings suggest that the privileged information firms obtain through their political activities is shared with investors through voluntary disclosures.

Among other more conventional analyses, we are able to show that firms with political collections appear to shift their guidance to just before the final vote on bills that matter to their industry. Here is figure 1 from our paper, where we plot timing of guidance relative to the final vote date. 


![Figure 1](/assets/img/CMWW_F1_MAIN.png)

To make this graph we use `kdens` and `twoway` in Stata.

```stata
use "./timeToBillData.dta", clear
lab var timeToBill "Days from Final Vote to Guidance"
* ESTIMATE THE CONFIDENCE INTS AND KERNELS
kdens timeToBill if Connected == 0 & GUIDE == 1 & !mi(lobbycount) & lobbycount>0 & mi(timeToEA) & month < 1 & month > - 2 , /// limits to month -1 and 0
		ll(-31.5) ul(30) /*kernel(epanechnikov)*/ reflection bw(n) /// bn(n) lets this data define the bins
		 gen(d1 x1) ci(ci1_1 ci1_2) // saves the vars
kdens timeToBill if Connected == 1 & GUIDE == 1 & !mi(lobbycount) & lobbycount>0 & mi(timeToEA) & month < 1 & month > - 2 , ///
		ll(-31.5) ul(30) /*kernel(epanechnikov)*/ reflection bw(5.2560433) /// here we apply the bin from Connected=0 group
		gen(d0 x0) ci(ci0_1 ci0_2) // 

// PLOT THE KERNELS AND CONF INTS
twoway rarea ci0_1 ci0_2 x0 , color(green*.2) || /// 
	rarea ci1_1 ci1_2 x1 , color(blue*.2) || ///
	line d1 x1, lc(blue) || line d0 x0, lc(green) lp(shortdash) /// 
	legend(order(3 "Not Connected" 4 "Connected") pos(7) ring(0) col(1)) ///
	xlabel(-30(10)30)  ytitle("Epanechnikov Kernel Density")
graph export "./Tabs/F1_MAIN.pdf" , replace

```
