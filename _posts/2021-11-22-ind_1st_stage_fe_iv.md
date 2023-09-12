---
title: '2021-11-22'
categories:
  - coding
tags:
  - stata 
  - iv
published: true
permalink: "/resources/ind_1st_stage_fe_iv.html"
---

Indicating fixed effects with
[`reghdfe`](http://scorreia.com/software/reghdfe/faq.html) is relatively
straightforward if you use
[`estfe`](http://scorreia.com/software/reghdfe/faq.html#how-can-i-combine-reghdfe-with-esttab-or-estout).
However, when you try to report the first stage of estimates from
[`ivreghdfe`](https://github.com/sergiocorreia/ivreghdfe) with the `savefirst`
(or `savefprefix`) option you'll incorrectly indicate that you didn't use the
fixed effects that you passed to `absorb()`.

Here's an example using `saveprefix`:

```Stata
clear all
sysuse auto
ivreghdfe price weight (length=gear_ratio), ///
  absorb(turn trunk)  ///
  savefprefix(m1)
estimates store m1

estfe m1* , labels(turn "Turn FE" trunk "Trunk FE")

esttab m1* , drop(c1) indicate(`r(indicate_fe)')
```


This gives the following, incorrect, output:

```
--------------------------------------------
                      (1)             (2)   
                   length           price   
--------------------------------------------
gear_ratio          3.502                   
                   (0.90)                   

weight             0.0160***        6.578   
                   (4.73)          (1.11)   

length                             -106.4   
                                  (-0.26)   

Turn FE                No             Yes   

Trunk FE               No             Yes   
--------------------------------------------
N                      65              65   
--------------------------------------------
t statistics in parentheses
* p<0.05, ** p<0.01, *** p<0.001
```

This is because `savefprefix()` is part of `ivreg2` and so it doesn't actually
know about the contents of `absorb()` since they were differenced out of the
data before it was passed to `ivreg2`. So you have to use `estadd` to add them
in yourself.

```Stata
clear all
sysuse auto
ivreghdfe price weight (length=gear_ratio), absorb(turn trunk) savefprefix(m1)
* put the ereturn stuff that estfe is looking for into locals
local absvars = e(extended_absvars)
local nabsvars = e(N_hdfe_extended)

estimates store m1

estimates restore m1length // length is the suffix from savefirst
* use estadd to post these results
estadd local extended_absvars = "`absvars'"
estadd local N_hdfe_extended = "`nabsvars'"
estimates store m1length

estfe m1* , labels(turn "Turn FE" trunk "Trunk FE")

esttab m1* , indicate(`r(indicate_fe)')
```

Now `estfe` correctly indicates the use of FE in the first stage.

```
--------------------------------------------
                      (1)             (2)   
                   length           price   
--------------------------------------------
gear_ratio          3.502                   
                   (0.90)                   

weight             0.0160***        6.578   
                   (4.73)          (1.11)   

length                             -106.4   
                                  (-0.26)   

Turn FE               Yes             Yes   

Trunk FE              Yes             Yes   
--------------------------------------------
N                      65              65   
--------------------------------------------
t statistics in parentheses
* p<0.05, ** p<0.01, *** p<0.001

```
