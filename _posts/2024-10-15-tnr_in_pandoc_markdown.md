---
published: true 
title: "2024-10-15"
category: "coding"
tags:
  - markdown 
  - pandoc
  - latex
---

Times New Roman in Latex and Markdown. Someone is making you do this. 

> "I wish I could see more Times New Roman" - No one. Ever.

This week I got back a grant application with the specific request that I use
Times New Roman. Turns out it's easy! 

... I don't stand by that exclamation mark. I'm not excited that I _am_ doing
this, I'm excited that it is so easy.

Turns out that all you have to do is invoke the `times` package at the end of your Latex preamble.

``` latex 
\usepackage{times}
\begin{document}
```

If you're like me and you do most of your writing in pandoc markdown, then you
can pop this into the yaml header like this:

``` yaml
---
title: "Unfortunately, this document is in Times New Roman"
header-includes:
  - \usepackage{times}
---

Other text subjected to TNR ignomany, without complaint.
```
