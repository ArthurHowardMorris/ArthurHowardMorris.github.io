---
title: '2025-10-23'
categories:
  - coding
tags:
  - jupyter 
  - marimo 
  - python
published: true
---

[Marimo](https://marimo.io) for viewing data. 

Back when people used to tell[^never] me why they preferred using SAS to using Stata,
folks would tell me that they liked being able to look at their data. Honestly,
I see the point. SAS made it easy to look at all the datasets that you had
loaded. Stata was also fine for this, but since you could only load one dataset
at a time[^frame] the interaction was clunkier. This was especially true if you
were working on a merge, and wanted to look at both datasets side by side.
 While `frame` now allows you to have multiple datasets loaded in
    memory, the ergonomics of the experience are still not as nice as what SAS
had (I'm insisting on the part tense), and you still can't have both datasets
up. 

My habit in Stata (since I work in the console version) is something like this:

``` Stata 
frame create left 
frame left {
  use left_data
}
frame create right 
frmame right {
  use right_data
}
local ids id_var time_var 
frame left: codebook `ids'
frame right: codebook `ids'
frame left: list `ids' in 1/20
frame right: list `ids' in 1/20
```

Which is fine as far as it goes, but it's not a selling point of Stata. I've
also always hated how hard it is to use SQL-like syntax to query data in Stata
(SQL was honestly the best things about SAS for me... or rather I only ever
learned SQL so that was all I used in SAS... I was an Econ Major not an
Accounting Major). Now, over the last several years I've been shifting my
workflow away from Stata toward Python (Polars, in particular).[^emo]

While Python (both polars and pandas) do allow you to load multiple datasets
into memory at once, the interaction with the data has still been clunky (or
forced you to use a Jupyter Notebook which was better but still not amazing).
Marimo has changed all this. Now, I'm of the opinion that if you aren't using
Marimo to inspect your data you are flying blind. You see, in the past we (I)
just wanted to be able to scroll around in the datasets I'm working with, filter
them, and see how things looked. Marimo does this. But Marimo does something
additional, that might be more important. But before I get into that, a quick
comparison to SAS. 

If you liked the GUI of SAS, with dataset viewers launched by clicking on the
datasets, you'll miss that. Marimo adopts an approach more similar to a Jupyter
Notebook, where you have code cells that you can run to inspect the data. What
you loose on the GUI slide, is more than made up for by the ability to script
against the data while keeping track of the state that you have created. But,
that isn't the most important part. 

I believe that we, as a profession (i.e. those of us that use microeconometrics
in our work) should be plotting our data more than we do. My, perhaps incorrect,
perception is that we plot data much the same way that we tabulate results: for
production. But I think that plotting data should be much more a part of our
exploratory data analysis, even better if we do that in a way that generates
code, allowing us to document and reproduce the exploration. 

When I have taught in the past, I've felt the tools were in my way. While
Python's plotting ecosystem is incredibly capable, it discourages the sort of
casual plotting that students and researchers would benefit from doing
iteratively as they construct their datasets. 

Marimo changes this. With Marimo when I load a dataset, I see options to plot
along with the dataset, and Marimo even makes simple plots of the distributions
of numeric variables automatically. From there I can quickly make basic plots
with simple dialogues (these show up as reproducible python code cells in the
file that gets saved). So, not only is Marimo a more capable data viewer than
anything widely used in our field, Marimo also makes improved data
workflows---those that integrate plotting early and often---natural and obvious. 



[^emo]: Nothing else comes close to Stata for parsimony if you want to load a
    file, create a simple variable, and run a regression, and I don't think
anything ever will. It's also enough of a _lingua franca_ for econometrics, that
I don't think I'll ever completely remove it from my workflow. If you want to
work through Wooldridge (2010), Stata is the way to go.
[^never]: These conversations were never initiated by me _asking_ why someone
    preferred SAS to Stata.

Switching from [Jupyter Notebook](https://jupyter.org/) to
[Marimo](https://marimo.readthedocs.io/en/latest/).

With `uv` install `marimo`:
```
uv add marimo\[recommended\] 
```
Then fire up a notebook for a python file:
```
marimo edit notebook.py
```

There are a ton of cool features, far beyond what Jupyter Notebooks offer, but
I'm making the jump because marimo doesn't have the two dealbreakers that kept
me from using Jupyter Notebooks in my workflow.

Jupyter Notebooks are very nice for exploring datasets, but:

1. My workflow is based on everything being a text file. Jupyter Notebooks are
   not. This means that all my version control and task management tricks ([wtfd](https://github.com/ArthurHowardMorris/wtfd)) get fall apart.[^json]

2. Jupyter Notebooks don't integrate well into workflows where you want
   everything to run in order! (i.e. be reproducible)           g

Marimo solves both of these. First, the files that are saved are just .py files (state
is saved separately), so you can track them in version control and grep them as
you would any other code file. This addresses both of my issues, since I can
also script against the notebook.py file as I would against any other .py file.
With the benefit of being able to run cells interactively, and inspect the data
throughout the pipeline. Second, marimo tracks the state of the cells, and will
warn you if you are using stale data. This prevents the problem where someone
gives you a notebook that has cell output that you cannot replicate. Marimo
defaults to guaranteeing that your results are reproducible (overstated, but
more or less true).

Oh, also Jupyter 6 broke all of my slides. 

[^json]: What I mean by this is that I manipulate the file that holds the code
    directly. Jupyter Notebooks generate JSON files which preserve the state of
the notebook, including your code cells, but a ton of other things. 
