---
title: Political information flow and management guidance
date: 2020-06-20T00:00:00.000Z
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

We did a couple of things here that others might be interested in using in their own work. 

First, we scrape EDGAR to see what language firms are using around the release of guidance. If you're interested in doing something simlar the first hurdle is to get an index of the files available on EDGAR. Extracting these files isn't too tricky once you know what to do ... but if you don't know what to do it can be a bit of a headache. I've posted a simple python script that will help you do this, along with the annual indexes for the history of EDGAR.

Second, we use some nice graphs to show that the timing of guidance around the final vote for important bills (check the paper for details on what's important here).
