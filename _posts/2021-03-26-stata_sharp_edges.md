---
title: 2021-03-13
published: false
---

Stata has some sharp edges. 

There are a lot of things that Stata does really well. That's not what this is about. Today is about the little sharp edges in Stata, that will cut you if you bump them. 

## Missing numbers aren't missing at all, they are INFINITY.

Stata indicates missing numeric values with '.' You'll see this being used in something like `subinstr("This old string", "!", .)` where the `.` is being used to mean INFINITY! This seems to be behaviour that is deeply integrated into programming practice, commonly to allow unspecified upper limits and to move all missing data to the bottom of the dataset. 

However, this is a very sharp edge for folks using inequalities to subset their data, or to create allows unspecified upper limits
