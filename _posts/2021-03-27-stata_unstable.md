---
title: 2021-03-26
categories:
  - coding
tags:
  - stata
  - sharps
  - missings
published: true
---

Stata has some sharp edges. This the second it a series of posts about the
things that Stata does by default that you probably don't want it to do!

## Sorts are unstable BY DEFAULT!

This might be the biggest threat to reproduceability in the Stata using
population, as it almost guarantees that running the same code twice will not
yield the same results.

The problem is how Stata handles ties when you sort. To see this lets expand
the data set and give an id that will differentiate the observations.

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

Notice that we are getting a different order each time __even though__ the
observations are returned to the same order each time by `sort r`.

This is because Stata chooses a __random__ tiebreaker each time it sorts!

There are two solutions:


2. Only sort by unique identifiers. This is a good practice, even when
   arbitrarily breaking ties so that you can be explicit about how you are
   doing it.
1. `sort, stable`, note that this does not solve the `bysort` version of this
   problem. Useful when sorting on values (rather than ids) which may not be
   unique.

One way to do this:

```stata 
local sort_vars group individual 
isid `sort_vars' // confirms that these identify unique obs  
sort `sort_vars', stable
```

The `isid` line makes the `, stable` redundant. But, getting in the habit of
using `sort, stable` is a good way to remind yourself that this in not the
default. 

As an extra special bonus, this leads to `duplicates, drop` dropping different
observations each time you run your code, because `duplicates, drop` has an
unstable sort inside it.
