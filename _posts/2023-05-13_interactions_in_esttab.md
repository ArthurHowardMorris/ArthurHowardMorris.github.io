---
title: "2023-05-13"
categories:
    - coding
tags:
    - stata
    - esttab
---
Booktabs and interactions in esttab.

If you're piping results from Stata to \LaTeX using `esttab` (`ssc install esttab`) you'll probably already be making use of the `booktabs` option for formatting your tables. 

Now if you're like me you also rely on Stata's `##` syntax for adding interactions to your models (rather than creating these as variables). This leads to output like `c.Treat#c.Post` when you'd like `Treat $\times$ Post` to get written to your .tex file. Fortunately, Benn Jann (esttab author) has thought of this and thus `esttab` has an `interactions` option which turns on by default:

> "`interaction(string)` specifies the string to be used as delimiter for interaction terms (only relevant in Stata 11 or newer). The default is `interaction(" # ")`. For `tex` and `booktabs` the default is `interaction(" $\times$ ")`." see `help esttab`

This is great! One thing is missing here though. The helpful `tex` and `booktabs` defaults, as well as the `interaction` option itself, all depend on the `label` option! 

So `esttab, interaction(" X ")` doesn't do anything, you need: `esttab, label interaction(" X ")`.

