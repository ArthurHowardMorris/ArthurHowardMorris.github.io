---
title: '2021-02-16'
categories:
  - coding
tags:
  - fe
  - stata
  - safe workflow
published: true
permalink: "/resources/indicate_fe_safely.html"
---

__Safe__ fixed effect indication in Stata.

## The safe research workflow.

My concept of a "safe" empirical workflow is based on Andrew Gellman's
philosophy that "I don't trust anything until it runs twice." And my continuing
observation that most high-profile retractions are cases where the __authors
themselves__ failed to replicate the results in the paper, not because _other
researchers_ failed to replicate the results. To me a workflow is safe to the
extent that it eliminates the chances for unintentional differences between the
results that the code produces and the results reported in the paper.

In general, I want as much of the content of the tables to be determined by the
actual estimation commands as possible. Cutting and pasting is unsafe,
hard-coding is unsafe, and manual editing after the fact is unsafe. Workflows
that deliver the output of estimation directly to the reader are safe. A safe
workflow will produce the same tables every time it is run, no matter who runs
it, and no matter where.

## Safe fixed-effect indication.

Safe fixed-effect indication is driven by the estimation command, rather than
something it do by hand after the fact or something you hard code. I'll use
`reghdfe` to illustrate. I recommend using `reghdfe` for models with fixed
effects and/or clustered standard errors as it does things like adjusting the
degrees of freedom and dropping singletons correctly by default.

### Setup

This approach uses `reghdfe` and `esttab`.

Install `esttab` from SSC:

```stata
ssc install esttab
```

Install `reghdfe` and it's dependencies:

```stata
ssc install reghdfe
```

### Estimation:

```stata
// load example data
sysuse auto
// fit three models with different FE structures
eststo clear
eststo:reghdfe price mpg rep78 , absorb(		gear_ratio) // est1
eststo:reghdfe price mpg rep78 , absorb(foreign 		  ) // est2
eststo:reghdfe price mpg rep78 , absorb(foreign gear_ratio)         // est3
```

At this point simply passing `est1`, `est2`, and `est3` to `esttab` will fail
to document the fixed effects that you included! You might be tempted to add
this later by hand, which is unsafe because you may forget or you may update
the fixed effect structure and forget to update your annotations. I recommend
using `estfe`, a function included with `reghdfe` and `esttab`'s indicate
option to automate this.

### Indicate:

```stata
// prep the FE for indication
estfe est*, labels(foreign "Foreign FE" gear_ratio "Gear Ratio FE")
// note that leading and trailing spaces cause errors here.

// tabulate 
esttab est* , ///
	indicate(`r(indicate_fe)') /// `r(indicate_fe)' puts in the label and 'yes/no'
```

Now the indication of fixed effects is driven completely by their actual
inclusion. This limits the possibility of unreported changes to the
fixed-effect structure as `esttab` will either throw an error (if you never
reference a FE that you labeled in `estfe`), or will just toss an unformatted
fixed effect indication into your tables so that you are reminded to add the new
variable to the `estfe` call.

