---
title: notes on piping results from stata to latex
sitemap: true
permalink: /resources/statatolatex.html
---

`esttab` (`ssc install esttab`) and other commands make outputting standard results from Stata directly to LaTeX easy. I find that about once per project I want to tabulate something that isn't obvious in the documentation. While it's tempting to just copy and paste results from one place to another, in the interest of reproducible research, I try to find a minimally kludgy approach to automating the output.[^rep]

When I can't find good examples of how to do this on the forums, I usually put together a brief example and post it here. This is as much for my benefit as for yours. Please email if you have questions or thoughts about any of these topics.

- [Using `eventstudyinteract` with esttab](/resources/esttab_with_eventstudyinteract.html)


[^rep]: In all the important discussions about reproducible research, I think one _astounding_ regularity goes undiscussed. It is that in recent high-profile retractions, the party that ultimately fails to reproduce published results is the _actual authors of the study_. While honest and unnoticed mistakes in tabulation may not explain every such error, I believe that they are entirely preventable, thus my obsession with automating the tabulation step.  
