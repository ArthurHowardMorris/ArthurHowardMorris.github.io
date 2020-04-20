---
title: Working with EDGAR
categories:
  - code
tags:
  - EDGAR
  - python
  - scrape
published: true
---
I scrape EDGAR to see what language firms are talking about in lots of my work. It turns out that the nuts and bolts of most text analysis (at least as we implement it in Finance and Accounting) are relatively straightforward to implement in Python. 

If you're interested in doing something simlar the first hurdle is to get an index of the files available on EDGAR. Extracting these files isn't too tricky once you know what to do ... but if you don't know what to do working with these index files can be a bit of a headache. [I've posted a simple python script that will help you do this](https://github.com/ArthurHowardMorris/buildEdgarIndex/blob/master/buildEdgarIndex.py). 

The script is slightly edited from what [Kai Chen has posted on his excellent website](http://kaichen.work/?p=59). 

### Workflow:  

1. This script lives on a US-based server. Since I've been living outside the US for some time, and US government websites are _famously_ grumpy when they interact with non-US ip addresses, I just keep this code on a server in the US and run it every few months.

2. I use this index to keep a copy of *most* of the EDGAR files on that US-based server. This makes scraping *much* faster. I built this server on a Ph.D. student budget, so I didn't put enough storage in for _all_ of EDGAR, but as soon as I get the chance I'll upgrade the whole set up.

3. When I have a particular question in mind, I'll develop a script to conduct what ever analysis I'm interested in and run that script on the server where all the files are located. 

This isn't anything revoloutionary, but working locally substantially reduces the time required to scrape EDGAR, and this simple approach to building and maintaining an EDGAR index is at least an approachable starting point. For a more sophisticated approach to the whole exercise check out [Mac Gaulin's ```pyedgar``` library](https://github.com/gaulinmp/pyedgar)