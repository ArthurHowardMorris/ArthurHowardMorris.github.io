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
Frequently, I find myself scraping EDGAR to see what language firms are using. It turns out that the nuts and bolts of most text analysis (at least as we implement it in Finance and Accounting) are relatively straightforward to implement in Python. 

If you're interested in doing something similar the first hurdle is to get an index of the files available on EDGAR. Extracting these files isn't too tricky once you know what to do ... but if you don't know what to do working with these index files can be a bit of a headache. [I've posted a simple python script that will help you do this](https://github.com/ArthurHowardMorris/buildEdgarIndex/blob/master/buildEdgarIndex.py). 

The script is lightly edited from what [Kai Chen has posted on his excellent website](http://kaichen.work/?p=59). 

This isn't anything revolutionary, but this simple approach to building and maintaining an EDGAR index is at least an approachable starting point, and potentially useful for those who aren't inclined to learn Python. For a more sophisticated approach to the whole exercise check out [Mac Gaulin's ```pyedgar``` library](https://github.com/gaulinmp/pyedgar) and his [short course on using python and EDGAR](https://github.com/gaulinmp/edgar_shortcourse).
