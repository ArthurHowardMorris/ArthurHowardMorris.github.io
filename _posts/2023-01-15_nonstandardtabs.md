---
title: '2023-01-15'
categories:
  - coding
tags:
  - esttab
  - tables
  - stata
published: true
---

Certain common tables are simple with Stata. Just use `esttab` or other similar
commands. However, when things get less simple they seem to do so very rapidly!

A coauthor asked about making a table of post-estimations from `lincom` in a
one-model-per-row format. I generally stick this sort of thing at the bottom of
each column with `estadd`, but in this case the tests themselves needed more
space to label than that arrangement provides. So we wanted to switch to
one-model-per-row. 

Here is what I ended up sharing (verbatum for my reference and yours):

> There are two quirks of Stata that make this a little tricky, the first is
> that `lincom` saves it's output into "return" rather than `ereturn` where
> Stata looks for estimates, the second is that `esttab` and other Stata
> tabulation formats want models to be cols rather than rows. I'm sure there's
> a smart way to deal with the latter separately... but I don't know it because
> these two problems tend to arise together so I've been doing the following:

1.  make an empty matrix
2.  pipe the output of each estimation (`lincom` in this case) to cells in the matrix
3.  pipe the matrix to latex using `esttab`

> sounds simple enough when I write it like that, but you'll notice that I have
> to do a little bit of kludgy juggling in the "substitute" option of `esttab` to
> get the formatting to look reasonable.

Here is the example code:

1. Start by setting up an empty matrix. You can use LaTeX in the column names
   but not the row names, so I'm giving the row names something unique that I
   can easily replace later. 

```Stata
// set up a matrix to hold the estimates
matrix ests = J(6, 2, .)
matrix colname ests = "Ratings" "Comparison"
#delimit;
matrix rowname ests =
  "**line1**"
  "**line2**"
  "**line3**"
  "**line4**"
  "**line5**"
  "**line6**"
  ;
#delimit cr 
```

2. Load some example data and get the actual estimates:

```Stata
// load example data 
webuse regress
// run the regression 
regress y x1 x2 x3
```

3. Do the post estimation and pipe the results you want into the matrix. Note
   that `lincom` is an rclass command so these results are in ``
   `r(something)'`` not `` `e(something)'`` this is true of most post
   estimation commands like `test` and `boottest` etc.

```Stata
// do the lincoms and load the estimates and tstats into the matrix
lincom x2-x1
matrix ests[1,1] = `r(estimate)'
matrix ests[2,1] = `r(t)'
local t1 = round(`r(t)',.01)
matrix ests[1,2] = 9991

lincom 3*x1 + 500*x3
matrix ests[3,1] = `r(estimate)'
matrix ests[4,1] = `r(t)'
local t2 = round(`r(t)',.01)
// todo put the rounded tstat in a local
matrix ests[3,2] = 9992

lincom 3*x1 + 500*x3 - 12
matrix ests[5,1] = `r(estimate)'
matrix ests[6,1] = `r(t)'
local t3 = round(`r(t)',.01)
matrix ests[5,2] = 9993

matrix list ests 
```

The 999s are just tags for replacement as well. In the last step we just pipe all this into a .tex file using `esttab` and then use the `substitute` option to replace all the place holders with the values marked up with LaTeX.


```Stata
#delimit;
esttab matrix(ests, fmt(%9.2fc %9.0f)) 
	using "veryNiceTable.tex", replace booktabs
	title("Very nice title.")
	nomtitles
	substitute(
		// here we reset the names
		"**line1**" "First model:"
		"**line2**" ""
		"**line3**" "Second model:"
		"**line4**" ""
		"**line5**" "Third model:"
		"**line6**" ""
		// now we put in the parens for the tstats
		"`t1'" "(`t1')" 
		"`t2'" "(`t2')" 
		"`t3'" "(`t3')" 
		// and flip the model numbers
		"9991" "(1)"
		"9992" "(2)"
		"9993" "(3)"
		// clean up 
		".&" " &" ".\\" " \\" "c1" "" "$$$" "\$" "0(" "(0"
	)
	postfoot(
		`"\bottomrule"'
		`"\end{tabular}"'
		`"\end{table}"'
	)
;
#delimit cr
     
```



By the way, if a SAS head ever tells you that the problem with Stata is that
you can only open one dataset at a time, you can ask them what they mean by
"dataset" and then they will describe something stata can hold in a matrix.
When you explain this to them you will find yourself with the feeling of being
correct in an empty office... because you will be.

