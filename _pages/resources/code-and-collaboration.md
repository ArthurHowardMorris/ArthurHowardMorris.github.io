---
title: code and collaboration
sitemap: true
permalink: /resources/code-and-collaboration.html
published: true
---
# The caveat

I've never written software for a living. I'm reasonably adept at Stata and Python within the domains that are useful to me. R, Julia, SAS, and Matlab are in the back of my toolbox, if you will, but not part of my day-to-day work flow.

# Two simple goals

1. Manage versioning and collaboration in a lightweight but effective way so that allows authors to work both simultaneously on different tasks, asynchronously on the same tasks with minimal mistakes and coordination effort. The initial creation of the script for a data task should be a manageable block of time, and subsequent edits should be simple to make, incorporate and track.

2. The objective is to, at submission, have a sharable set of original data files, extraction scripts, processing scripts, analysis scripts, and a LaTeX (or markdown) which other users (co-authors, referees, etc.) can compile and evaluate with minimal guidance.

# The approach

- four integrated pipelines
  1. extract
  2. process
  3. analyze
  4. create draft
    - includes the writing step, which is it's own topic
- code for 1-3 is managed through github.
  - python, sas, and others for extraction of data
  - stata for processing and analysis
  - the stata project command is key to tracking changes here
- data is shared through dropbox or somesuch. data folders should have some structure, my default structure is:
	- `/raw/`: this holds everything created by the "extract" step
    - `/mediumraw/`: this holds intermediate datasets created by the process step. I often save an unlabeled version of the estimation data here
    - `/final/`: this folder holds the final data for estimation, this is the data that produces the tables in the paper
- the draft is maintained on overleaf
  - analysis step outputs to an overleaf synced file
  - e.g. the project's folder in `Dropbox/Apps/Overleaf/project`

## Details on the approach

- [Coding Style Guide](https://github.com/michaelstepner/healthinequality-code/blob/master/code/readme.md), Stepner
- [Code and Data for the Social Sciences: A Practitioner’s Guide](https://web.stanford.edu/~gentzkow/research/CodeAndData.pdf), Gentzkow and Shapiro
- [Best Practices for Scientific Computing](https://journals.plos.org/plosbiology/article?id=10.1371/journal.pbio.1001745)
- [Tidy Data](https://www.jstatsoft.org/article/view/v059i10), Wickham

# Other useful resources:
- [Microeconometrics using Stata](https://www.stata.com/bookstore/microeconometrics-stata/), Cameron and Trivedi
- [Statalist.org](http://statalist.org/)
- [Python for Data Analysis](https://www.oreilly.com/library/view/python-for-data/9781491957653/)
- [Stack Exchange](https://stackexchange.com), in particular, [Stack Overflow](https://stackoverflow.com/tour)
- [Regression and Other Stories](https://avehtari.github.io/ROS-Examples/)
