---
title: "2023-04-19"
categories:
    - coding
tags:
    - bash
---

Batch renaming in `bash`.

Often when I'm working on a revision of of a paper I find myself needing to
rerun all of the analyses in the paper with some substantial tweaks. For
example, the referee may have asked to see the main analysis with a new FE,
cluster, or control structure (often all three).

When I'm working through this initially I'll do the following to 'sandbox' the analyses. 

First make a subdirectory in the `analysis` folder:

``` bash
mkdir alternate_controls
```

Then I'll move into that subdirectory and create copies of the main analysis. I tend
to give the main analyses (those that get tables in the draft) a common prefix.
In this case the analysis all estimate the effect of "aaca" on various metrics
so they all start with aacaAnd.

``` bash
cd alternate_controls
cp ../prefix*
```

Now, I want to quickly rename all the analyses to indicate that these are not
the main analyses. You could do this one at a time, but you can also do it
quickly using bash. here is a quick renaming script:

``` bash
for file in *.do
	do mv $file ${file%.do}_alt_cntrls.do
done
```

the first line loops over all the matches for "`*.do`" in the folder. The `do` on the next line passes the shell command that follows for each "file" that ends in .do. `mv` is the unix command for 'move' which is equivalent to rename, `$file` is the original name. `$file%.do` is the origional name up to `.do` and then `_alt_cntrls.do` is the new suffix. 


