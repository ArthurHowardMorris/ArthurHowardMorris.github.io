---
published: true 
title: "2021-04-13"
category: "writing"
tags:
    - book 
    - clang 
---

Learning some 'C' is worth your time.

Am I arguing that a run of the mill empiricist needs the computational
firepower that comes from deep 'C' expertise, no. Not at all. 

But, 'C' underpins so much of modern computing that I'm finding it to be very
high leverage learning. A small amount of effort is giving me volumes of
clarity on the syntax of languages and tools that I'm already exposed to.
Stata, for example really sings when it's being used in a simple, declarative,
one-line-at-a-time kind of a way. __Especially__ if you're confining your use
to the analysis portion of your project. Comparing `use`, `regress`, `areg`,
`reghdfe` and `esttab` to their peers is pretty astounding. You can get a
'publication quality' \LaTeX table in three clean readable lines. However, as
soon as you start doing anything else you start to find all sorts of strange
things in the Stata syntax. Everything that's confusing about local and global
macros (what are they? why do they work the way that they do? are they
variables? how do they relate to columns and scalars and matrices?) suddenly
becomes clear when you read about macro substitution in 'C' and pay attention
to the fact that Stata is written in 'C', and so the folks that are making the
Stata that we interact with are deeply steeped in 'C' idioms! 

Why can we increment a local using `local i += 1`? Because this seems like a
normal thing to do if you live in 'C'. Why do loops live in squirrely braces?
Because that's where they live in 'C'. To me this was odd, I was expecting
something a little more like the structure in python or bash. Using open and
closed brackets across lines wouldn't have occurred to me, but to a 'C'
programmer nothing else would have occurred. Why do some commands start with
octothorps? Super strange, unless you're a 'C' programmer, then it's a super
normal thing to do! 

So, do I think that we all need to run out and learn to write compilers? Nope.
Not at all. But, do I think it's worth picking up a silly[^sil] 100 page book
like [_Victory at
'C'_](https://www.amazon.co.uk/Victory-at-C-G-N-Pitts/dp/0538107200) and
reading it with more interest than you expected to. Which is what I did.

[^sil]: It's silly because of the puns, not because of any shortcoming other than the puns.
