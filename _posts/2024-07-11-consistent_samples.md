---
title: '2024-07-11'
categories:
  - code
tags: 
  - stata
published: true
---

Simple approach to setting a consistent sample in Stata. 

New Ph.D. students (including me when I was) tend to hoard data, using all the
possible data for each model. This isn't wrong on it's face, but it's also
useful to establish a sample which the reader can follow through the paper with
minimal deviations. This also makes your job as a writer easier as you can
address the sample once and move on. I end up explaining this once to each
student that I work with, so I'm writing this up here. As always, feel free to
email with questions!

Consider a dataset of random numbers, some of them missing.
```Stata
. // inspect the data
. list in 1/5

     +--------------------------------------------------------------------------+
     | id   year   quarter           y   x1       x2   x3         x4         x5 |
     |--------------------------------------------------------------------------|
  1. |  1   2001         1    1.38e+11    1   668659    .   1.66e+10   56843.59 |
  2. |  1   2001         2   -5.01e+11    1   668659    .   1.66e+10   64507.01 |
  3. |  1   2001         3   -2.68e+11    1   668659    .   1.66e+10    50003.9 |
  4. |  1   2001         4    2.67e+12    1   668659    .   1.66e+10   57500.11 |
  5. |  1   2002         1    3.84e+12    1   668659    .   7.18e+10   52113.82 |
     +--------------------------------------------------------------------------+
```

If we summarize the data we'll see that there are 1,600 observations but three of the 
variables have missing data.

```Stata
. // summarize
. su y x*

    Variable |        Obs        Mean    Std. dev.       Min        Max
-------------+---------------------------------------------------------
           y |      1,600   -5.95e+10    2.48e+12  -1.79e+13   1.31e+13
          x1 |      1,200           2     .816837          1          3
          x2 |      1,600    432333.3    199654.9   118209.1     668659
          x3 |      1,120    9.535714    5.987668          1         20
          x4 |        816    3.69e+10    2.74e+10   2.22e+08   1.52e+11
-------------+---------------------------------------------------------
          x5 |      1,600    53703.42    5514.862   35966.54   71861.57
```

Now we can fit a series of models with different data requirements and we'll
see that this generates several samples.


```Stata
. // fit a series of models
. quietly:eststo:regress y x2 x4
. quietly:eststo:regress y x2 x4 i.x1
. quietly:eststo:regress y x2 x4 i.x1 x3

. // tabulate and note sample sizes
. esttab

------------------------------------------------------------
                      (1)             (2)             (3)
                        y               y               y
------------------------------------------------------------
x2               423051.8      -6999882.8      -1833948.3
                   (0.52)         (-0.66)         (-0.17)

x4                  2.853           3.389          -6.843
                   (0.89)          (0.87)         (-1.59)

x1                           -8.33482e+11    -1.88427e+11
                                  (-0.72)         (-0.16)

x3                                           -1.47517e+10
                                                  (-0.81)

_cons        -1.50561e+11     3.36708e+12     1.23826e+12
                  (-0.71)          (0.67)          (0.24)
------------------------------------------------------------
N                     780             552             436
------------------------------------------------------------
t statistics in parentheses
* p<0.05, ** p<0.01, *** p<0.001
```

So far so good, but what if we want to get one sample to use in the summary and
model tables? The answer is in `ereturn list`. After an estimation command runs
is saves the details in `ereturn list` and `return list`, this is where
commands like `esttab` get the information that they tabulate. One of these
details is a vector of ones and zeros that indicates which observations were
included in the estimation. This is called `e(sample)` and we can assign it to
a variable and use that to define our sample as follows:

```Stata
. // fit the most restrictive model
. quietly: regress y x2 x4 i.x1 x3
. generate mainsample = e(sample)
```

Now we can use `mainsample` to run all the models in the same sample:

``` Stata 
. quietly:eststo:regress y x2 x4       if mainsample == 1
. quietly:eststo:regress y x2 x4 x1    if mainsample == 1
. quietly:eststo:regress y x2 x4 x1 x3 if mainsample == 1

. // tabulate and note sample sizes
. esttab

------------------------------------------------------------
                      (1)             (2)             (3)
                        y               y               y
------------------------------------------------------------
x2             -1941846.0      -3240948.1*     -3131194.0
                  (-1.63)         (-2.01)         (-1.91)

x4                 -7.289          -8.035*         -7.841*
                  (-1.90)         (-2.06)         (-2.00)

x1                           -2.23118e+11    -2.14745e+11
                                  (-1.20)         (-1.14)

x3                                            7.39664e+09
                                                   (0.39)

_cons         1.22904e+12     2.40732e+12*    2.25026e+12
                   (1.89)          (2.04)          (1.80)
------------------------------------------------------------
N                     424             424             424
------------------------------------------------------------
t statistics in parentheses
* p<0.05, ** p<0.01, *** p<0.001
```
