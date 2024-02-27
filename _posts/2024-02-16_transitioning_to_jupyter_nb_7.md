---
title: "2024-02-16"
published: false 
category: "writing"
tags: 
    - jupyter
    - teaching
    - slides
---

Notes on the Notebook 7 transition.

Jupyter Notebooks + Rise, are great for teaching. I can create good looking slides by writing markdown in a notebook, and when I include code I'm not showing an image! I'm showing the actual code. Then I can code live in the slide (or fix typos live). 


Though jupyter notebooks have made a pretty big impression in the data science and applied academic communities, because they provide a nice way to explore data, I don't think that they are a great way to actually produce research. There are a number of nitpicky reasons for this, but the biggest and easiest to articulate is this:

__I don't trust anything until it runs twice producing the same results both times, and what it means to run a notebook is not clear by default.__ You can of course execute the notebook like you would any other script, but if I share a notebook with someone else I have no idea if that's what they are going to do, and the established workflow is to open the notebook and run it cell by cell. That's what the interface invites you to do! If I share an R, Python, or Stata project I am much more certain that the user will run them in the order I intended. This isn't gauranteed, but it's a much more reasonable expectation.  

Let's be clear here: Jupyter Notebooks are not great for making the research process robust. I'm not sure  
