---
published: True
title: basic nlp resources
tags:
  - code
  - nlp
  - python
categories:
  - reference
---
## the basics of nlp for accounting and finance with python

resources for researchers, like me, who have never done nlp work for food

1. basic understanding of the concepts of natural language processing
	- recommended reading: [speech and language processing, by jurafsky & martin](https://home.cs.colorado.edu/~martin/slp.html)
    - chapters 1-4 at least, skip the stuff on speech recognition
1. some basic introduction to python and programming
	- doesn't matter what it is you just need to be able to set up a development environment and function in python
    - when i taught this i based my introduction on the indroduction section from [quant-econ](https://quantecon.org) they've since reorganized
	- github is probably worth your time
2. learn the basics of interacting with edgar, and using regular expressions in python
	- [anand et al. (2020)](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3576098) is a reasonable overview
	- [Regex 101](https://regex101.com/) is an excellent resource for testing and reference
	- [sometimes visualizing a complex expression is helpful](https://www.debuggex.com)

3. find examples similar to what you are trying to do
	- something like [gow et al. (2021)](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3310360) gives a good description of the development process
	- gow's [`ling_features`](https://github.com/iangow/ling_features) package provides excellent examples of how to conduct a number of useful tasks

4. set up your own system for interacting with edgar
	- this depends on your hardware and internet resources
