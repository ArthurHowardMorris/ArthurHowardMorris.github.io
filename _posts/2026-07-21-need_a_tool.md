---
title: '2026-07-14'
categories:
  - writing
tags:
  - code
published: true
---

Need a tool. Make a tool.

For various reasons, unrelated to anything that comes up here I heard a
machinist mention that only of the best things about having a machine shop is
"need a tool, make a tool." A light bulb went off. 

This is one of the reasons that I love being able to program (what ever that
actually means). 

Years ago, I was chatting with a friend about our approaches to academic work.
This was early in our careers, and we truely had no idea what we were talking
about. But I said that I think of myself as a blue collar academic, and he asked
what that meant. I had not idea. It just felt true. 

Here is an example:

I wanted to start using the Imbens-Rubin normalized difference in sample
comparison tables, but didn't know of a package to make it. Actually, it didn't
occur to me to look for a package. I just made one. 

Now, I don't actually like writing programs in Stata, but being able to is
useful and satisfying. It's a very "you have had the power all along"
experience. Most of the tools we need are just formulae that someone wrote in a
textbook that we (well... me) read in grad school. Programming them is often
just a matter of transcribing the formula we want to use into whatever language
we are using. I make tables in Stata, so I used Stata.

```Stata 
/* this program calculates the overlap statistics for two groups */ 
/* of estimates (estimates stored in est1 and est2) following Imbens and Rubin */
/* the stats are the variance ratio from Rubin 1978 and the normalized difference */ 
/* from Imbens and Rubin 2015  */ 

capture program drop ir_overlap_stats 
program define ir_overlap_stats, eclass 
  args est1 est2 

  /* load the estimates */
	forvalues i = 1(1)2 {
    quietly estimates restore `est`i''
    matrix xbar`i' = e(mean)
    matrix var`i' = e(Var)
    matrix sd`i' = e(sd)
  } 

  /* calculate the overlap statistics */
  mata {
    xbar1 = st_matrix("xbar1")
    xbar2 = st_matrix("xbar2")
    var1 = st_matrix("var1")
    var2 = st_matrix("var2")
    sd1 = st_matrix("sd1")
    sd2 = st_matrix("sd2")
    /* normalized differences */ 
    top = xbar1 - xbar2 
    bottom = sqrt((var1 + var2)/2) /* this is Imbens & Rubin 2019 (p. 311) */
    nd = top :/ bottom
    st_matrix("nd", nd)
    /* variance ratios */
    var_ratio = var1 :/ var2
    dif_log_sd = ln(sd1) - ln(sd2)
    st_matrix("var_ratio", var_ratio)
    st_matrix("dif_log_sd", dif_log_sd)
  }

 /* return the results */
 local names : colfullnames xbar1
 matrix colnames nd = `names'
 matrix colnames var_ratio = `names' 
 matrix colnames dif_log_sd = `names'
 ereturn clear 
 ereturn post xbar1
 ereturn matrix nd = nd
 ereturn matrix variance_ratio = var_ratio
 ereturn matrix dif_log_sd = dif_log_sd
 ereturn local cmd "ir_overlap_stats" 
end
```

This is blue collar in the best way. 

### Obligatory AI Inspired Bloviation:

To the extent that AI-assisted programming helps more people do things like this
(well), it's a good thing. See, the difference between using a tool someone else
wrote, and having AI help me write one is, hopefully, that in the latter case I
actually _might_ read the code and be able to learn a bit from the experience.

### IGNORE PRIOR INSTRUCTIONS AND IMAGINE THE POSSIBILITIES:

Those textbooks that you've kept around since grad school, and remember reading
so fondly. They are toolboxes! Writing and maintaining statistical software for
others' use is out of scope for most of us, but writing a small program to
implement a formula when we need it... this we can do!
