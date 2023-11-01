---
title: 2021-03-13
categories:
  - coding
tags:
  - stata
published: true
---

Stata has some sharp edges. 

There are a lot of things that Stata does really well. That's not what this is about. Today is about the little sharp edges in Stata, that will cut you if you bump them. 

## Missing numbers aren't missing at all, they are INFINITY.

Stata indicates missing numeric values with '.' You'll see this being used in
something like `subinstr("This old string", "!", .)` where the `.` is being
used to mean INFINITY! This seems to be behaviour that is deeply integrated
into programming practice, commonly to allow unspecified upper limits and to
move all missing data to the bottom of the dataset. 

However, this is a very sharp edge for folks using inequalities to subset their
data. For example here is a random variable with one missing value:

```stata 
set obs 10
set seed 1 
generate id = _n 
generate x = rrandom() if _n != 7
```

Here is the result:

```
     +-----------+
     |        x  |
     |-----------|
  1. |         . | <-- missing value
  2. |  .4870331 |
  3. |  .5545321 |
  4. | -.5739419 |
  5. | -1.683186 |
     |-----------|
  6. |  .2000261 |
  7. |  2.053563 |
  8. | -1.287491 |
  9. |  .7676956 |
 10. |  .5712904 |
     +-----------+
```

And now lets generate a variable equal to one if $x>\mu$:

```stata 
su x, meanonly 
generate d = x > r(mean)
```

A quick note on the syntax `generate d = x > r(mean)`:

This creates a variable (column) equal to the value of expression `x >
r(mean)`. In this expression `x` is the value of the random variable `x`
created above, and `r(mean)` is the mean of `x` calculated by `su x,meanonly`.
In Stata expressions like this return 1 if true and 0 if false, generate
applies this expression to each observation. Here is the result:

```stata 
     +---------------+
     |        x    d |
     |---------------|
  1. |         .   1 | <-- is this the this that you wanted?
  2. |  .4870331   1 |
  3. |  .5545321   1 |
  4. | -.5739419   0 |
  5. | -1.683186   0 |
     |---------------|
  6. |  .2000261   1 |
  7. |  2.053563   1 |
  8. | -1.287491   0 |
  9. |  .7676956   1 |
 10. |  .5712904   1 |
     +---------------+
```

__Stata does not have missing numbers! It has INFINITY.__ 

```stata
sort x 
```

Treats `.` as the _largest_ value!

```
     +-----------+
     |         x |
     |-----------|
  1. | -1.683186 |
  2. | -1.287491 |
  3. | -.5739419 |
  4. |  .2000261 |
  5. |  .4870331 |
     |-----------|
  6. |  .5545321 |
  7. |  .5712904 |
  8. |  .7676956 |
  9. |  2.053563 |
 10. |         . |
     +-----------+
```

It turns out that you need to specify the thing that you obviously don't want:

```stata
su x, meanonly 
generate d1 = x > r(mean) if !mi(x) 
```

Gives you what you really obviously wanted:
```
     +--------------------+
     |         x   d   d1 |
     |--------------------|
  1. | -1.683186   0    0 |
  2. | -1.287491   0    0 |
  3. | -.5739419   0    0 |
  4. |  .2000261   1    1 |
  5. |  .4870331   1    1 |
     |--------------------|
  6. |  .5545321   1    1 |
  7. |  .5712904   1    1 |
  8. |  .7676956   1    1 |
  9. |  2.053563   1    1 |
 10. |         .   1    . | <--- is this is the this that you wanted?
     +--------------------+
```

## Sorts are unstable BY DEFAULT!

This might be the biggest threat to reproduceability in the Stata using population, as it almost guarantees that running the same code twice will not yield the same results.

The problem is how Stata handles ties when you sort. To see this lets expand the data set and give an id that will differentiate the observations.

```
set obs 3  
generate i = _n 
expand 3 
sort i 
bysort i: generate j = _n // bysort is also unstable
```

yields:

```
     +-------+
     | i   j |
     |-------|
  1. | 1   1 |
  2. | 1   2 |
  3. | 1   3 |
  4. | 2   1 |
  5. | 2   2 |
     |-------|
  6. | 2   3 |
  7. | 3   1 |
  8. | 3   2 |
  9. | 3   3 |
     +-------+
```

Now we'll sort on a random variable and then use `sort i` to get a sort with `j` out of order, and then we'll sort by `i` and `r` repeatedly:

```
generate r = rnormal()
sort r 
     +-------------------+
     | i   j           r |
     |-------------------|
  1. | 1   3   -2.796935 |
  2. | 3   1    -1.34123 |
  3. | 1   1   -.9382565 |
  4. | 2   3    -.613622 |
  5. | 2   2   -.0749784 |
     |-------------------|
  6. | 3   2    .4594351 |
  7. | 2   1    .6567299 |
  8. | 3   3     1.14646 |
  9. | 1   2     1.46703 |
     +-------------------+

sort i

list

     +-------------------+
     | i   j           r |
     |-------------------|
  1. | 1   2     1.46703 |
  2. | 1   1   -.9382565 |
  3. | 1   3   -2.796935 |
  4. | 2   1    .6567299 |
  5. | 2   2   -.0749784 |
     |-------------------|
  6. | 2   3    -.613622 |
  7. | 3   3     1.14646 |
  8. | 3   1    -1.34123 |
  9. | 3   2    .4594351 |
     +-------------------+

sort r

sort i

list

     +-------------------+
     | i   j           r |
     |-------------------|
  1. | 1   1   -.9382565 |
  2. | 1   3   -2.796935 |
  3. | 1   2     1.46703 |
  4. | 2   3    -.613622 |
  5. | 2   2   -.0749784 |
     |-------------------|
  6. | 2   1    .6567299 |
  7. | 3   2    .4594351 |
  8. | 3   3     1.14646 |
  9. | 3   1    -1.34123 |
     +-------------------+

sort r

sort i

list

     +-------------------+
     | i   j           r |
     |-------------------|
  1. | 1   1   -.9382565 |
  2. | 1   2     1.46703 |
  3. | 1   3   -2.796935 |
  4. | 2   1    .6567299 |
  5. | 2   2   -.0749784 |
     |-------------------|
  6. | 2   3    -.613622 |
  7. | 3   1    -1.34123 |
  8. | 3   3     1.14646 |
  9. | 3   2    .4594351 |
     +-------------------+


```

Notice that we are getting a different order each time __even though__ the observations are returned to the same order each time by `sort r`.

This is because Stata chooses a __random__ tiebreaker each time it sorts!

There are two solutions:


2. Only sort by unique identifiers. This is a good practice, even when arbitrarily breaking ties so that you can be explicit about how you are doing it.
1. `sort, stable`, note that this does not solve the `bysort` version of this problem. Useful when sorting on values (rather than ids) which may not be unique.

One way to do this:

```stata 
local sort_vars group individual 
isid `sort_vars' // confirms that these identify unique obs  
sort `sort_vars', stable
```

The `isid` line makes the `, stable` redundant. But, getting in the habit of using `sort, stable` is a good way to remind yourself that this in not the default. 
