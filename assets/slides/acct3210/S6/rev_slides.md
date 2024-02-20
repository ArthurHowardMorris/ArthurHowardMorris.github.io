---
title: "Review of ACCT3210 Part I: Tools"
author: "Dr. Arthur Morris"
---

# Review Outline:
## Key Topics by Lecture:

1. Lecture 2:
    - Key terms: ATC, MC, IC.
    - Key concept: How do these terms relate to each other and to ideas from other courses.
2. Lecture 3: 
    - Data Analysis Workflow.
    - Bad (esp. Missing) Data.
    - How to plot, estimate, and interpret. (basic steps) 
3. Lecture 4: 
    - Optimization Workflow. 
    - What does it mean for a constraint to 'bind'?
4. Lecture 5:
    - Shadow prices.
    - Framing of the marginal cost.


# Lecture 2:
## Lecture 2 Topics:

1. Average total cost.
2. Marginal cost.
3. Incremental cost. 

- How do these terms relate to each other and to ideas from other courses (esp. Introductory Economics)

## Marginal Cost and Incremental Cost:

- The __incremental cost__ is the change in cost due to changing output by a
    specific increment, most often one unit. This is often calculated as the
    difference in costs before and after the change, and is the slope of the line
    through those two points on the cost curve.
- The __marginal cost__ is the rate of change of cost at a particular point.
    This is the slope of the line tangent to the cost curve at the point you are
    making the calculation.

## Marginal Cost and Incremental Cost:

- _These terms are equivalent_
    1. When the cost curve is linear, 
    2. When a linear approximation is appropriate (i.e. useful),
- _and the terms are often used interchangeably._ 
- _You should clarify in cases where the difference matters (i.e. if the two are meaningfully different)._
- The exam question will be a version of P1.1 and will not treat the two as interchangeable. __I.e. on the exam MC $\neq$ IC__.

## Why am I emphasizing this?

In introductory microeconomics marginal cost is often defined as the incremental cost. For example:

- _Microeconomics_ (6e) Perloff, page 190: "A firm's marginal cost (MC) is the amount by which a firm's cost changes if the firm produces one more unit of output."[^well]
- _Microeconomics_ (8e) Pindyck & Rubinfeld, page 237: "Marginal cost, sometimes called incremental cost, is the increase in cost that results from producing one extra unit of output."
- _Principles of Economics_ (4e) Mankiw, page 276: "Marginal cost tells us the increase in total cost that arises from producing an additional unit of output."
- _Economics_ (14e) Samuelson & Nordhaus, page 733: "The extra cost (or the increase in total cost) required to produce 1 extra unit of output (or the reduction in total cost from producing 1 unit less)."

[^well]: In a footnote Perloff mentions the precise definition referencing infinitesimals, but does not discuss when these two definitions are interchangeable and when they are not.

## Why am I emphasizing this?

The role of marginal cost in microeconomic theory depends on the mathematical attributes of the __derivative of the cost function__, attributes which the incremental cost only shares when the two are interchangeable.

- Price theory.
- Aggregation to macroeconomic theory.
- Monopoly definition and pricing.

Particularly important when 'increments' are large (e.g. aircraft) or hard to define (e.g. social media).

## Average Cost (AC):

Total Cost of producing the output over the number of units of output. 

- This is a simple average for single-product firms. 
- Average cost is only defined in multi-product firms when the cost function is separable. That is when there is no interaction between the production of products within the firm. The production processes cannot: 
    1. Interfere with each other,
    2. Share capital,
    3. Exhibit any synergy.

## Average Cost (AC):

- Synergy is the reason why products are grouped within firms, and grouping products within firms is costly so it is unlikely that AC is ever useful in practice.
- This is at odds with the common use of the concept of average total cost in microeconomic theory, where the decision to enter or exit a product market is made based on expected average total cost.

## Links to Relevant Slides and Examples:

- [Lecture notes.](https://arthurhowardmorris.github.io/resources/semesters/s2024/ACCTG3210.html#lecture-2-the-nature-of-costs)
- [MC, IC, AC defined](https://arthurhowardmorris.github.io/assets/slides/acct3210/S2/Session2Slides.slides.html#/2/2)
- [Formula for AC](https://arthurhowardmorris.github.io/assets/slides/acct3210/S2/Session2Slides.slides.html#/10)
- [Formula for MC](https://arthurhowardmorris.github.io/assets/slides/acct3210/S2/Session2Slides.slides.html#/13)
- [Formula for IC](https://arthurhowardmorris.github.io/assets/slides/acct3210/S2/Session2Slides.slides.html#/15)
- [Excel Example](https://arthurhowardmorris.github.io/assets/slides/acct3210/S2/Problem1.xlsx)

# Lecture 3:
## Lecture 3 Topics:

- Data Analysis Workflow.
- Bad (esp. Missing) Data.
- How to plot, estimate, and interpret. (basic steps) 

## Data Analysis Workflow.

1. Obtain data.
2. Plot data.
3. Model data and evaluate.
4. Interpret data.

## 1. Obtain data.

- The data you gather should be informed by the question you are asking, if you are modeling cost then you should consider the input of those who designed the products as processes as well as those who conduct them.
- The model you intend to fit is implicit in this step. If you think _x_ causes _y_ you will collect measures of _x_ and _y_.

## 2. Plot data.

- This should be a test of your intuition, and the quality of the data.

## 3. Model data and evaluate.

- Start with simple functional forms (i.e. linear regression).
- Evaluate fit by plotting data and the model, as well as formal statistical tests.

## 4. Interpret data.

- What does the estimated relationship mean?
- Does it make sense? Is it physically possible?
- What is the level of uncertainty inherent in the data? This is both what you see in the graph and what you know about the data generating process.

## Bad (esp. Missing) Data.

- The handling of missing data is critical. Always ask whether a missing value is a 0 (e.g. R\&D is not reported if none occurred) or should be thrown out.
- More generally, it is important to think through how the data are translated from the real world into rows in your dataset. 

## How to plot, estimate, and interpret. (basic steps) 

- Can you explain the steps to create a plot of a dataset using Excel or Python (or something else)?
- The names of the commands do not need to be precise, you can assume that the tool has been set up and that the person you are explaining it to has a general knowledge of the tools.


# Lecture 4:
## Lecture 4 Topics

- Optimization Workflow. 
- What does it mean for a constraint to 'bind'?

## Optimization Workflow 

1. Identify the choice variables.
    - Keep in mind that the constraints may limit the choice variables.
    - Be explicit about any natural constraints (e.g. $q>0$).
    - Include initial values (guesses) if required.
2. Write out the objective function.
    - Make any substitutions.
    - Note whether the objective is to maximize or minimize the function.
3. Write out the constraints.
    - These will be equations with more than one variable.
    - Single variable constraints will be reported with the choice variables.
4. Solve.
    - This will be done with a solver (gekko, excel) in practice.
    - You will not be asked to take this final step on the exam.

## Optimization workflow:

- Can you explain the steps solve an optimization problem using Excel or Python (or something else)?
- The names of the commands do not need to be precise, you can assume that the tool has been set up and that the person you are explaining it to has a general knowledge of the tools.

## What does it mean for a constraint to 'bind'?

- In the case of a profit function a binding constraint prevents the firm from earning more profit.
- When a constraint binds, the optimal production plan will include choices equal to the constraint.

## Links to slides and examples.

_Note that lectures 4 \& 5 both have examples of the optimization workflow._ 

- [Step 1. Choice Variables (linear example)](https://arthurhowardmorris.github.io/resources/semesters/s2024/ACCTG3210.html#lecture-5-linear-programs)
- [Step 1. Choice Variables (non-linear example)](https://arthurhowardmorris.github.io/assets/slides/acct3210/S4/lecture4nonlinearProgramming.slides.html#/2/3)
- [Step 2. Objective Function (linear example)](https://arthurhowardmorris.github.io/assets/slides/acct3210/S5/SolvingLPs.slides.html#/2/2)
- [Step 2. Objective Function (non-linear example)](https://arthurhowardmorris.github.io/assets/slides/acct3210/S4/lecture4nonlinearProgramming.slides.html#/3)
- [Step 3. Constraints (Linear example)](https://arthurhowardmorris.github.io/assets/slides/acct3210/S5/SolvingLPs.slides.html#/2/3)
- Step 3. Constraints (non-linear example): Note that there are no remaining multivariate constraints!
- [Step 4. Solve (Linear example)](https://arthurhowardmorris.github.io/assets/slides/acct3210/S5/SolvingLPs.slides.html#/2/4)
    - Again, you do not have to do this by hand.
- [Excel Examples](https://arthurhowardmorris.github.io/resources/semesters/s2024/ACCTG3210.html#lecture-5-linear-programs)

# Lecture 5:

- Shadow prices.
- Framing of the marginal cost.

## Shadow prices.

For a given objective function and constraint, the shadow price on the constraint is the rate at which the value of the objective function changes as the constraint is relaxed. You may have heard this referred to as a Legrange multiplier ($\Lambda$) in math and econ where we are interested in it's infinitesimal properties; however, in our case we are most interested in it's value over specific intervals. I.e. what is the predicted benefit of purchasing 1500 more machines? Increasing a budget by \$100,000,000?

- [Python Example](https://arthurhowardmorris.github.io/assets/slides/acct3210/S5/SolvingLPs.slides.html#/3)
- [Excel Examples](https://arthurhowardmorris.github.io/resources/semesters/s2024/ACCTG3210.html#lecture-5-linear-programs)

## Framing of the marginal cost.

In P5 we have:

- Revenue: $R=40x+42y$
- Cost: $C=30x+30y$ 
- Profit: $\Pi = 10x + 12y$

What is the marginal cost of $x$ based on this information?

$\frac{\delta C}{\delta x}=30$

This the marginal cost in the direct sense that you will have to obtain \$30 of resources that you do not have in order to produce 1 unit of $x$

### Is \$30 all you give up to produce one more unit of $x$?

No. Because the amount of $y$ you produce depends on $x$, so we are also giving up \$2 per unit of $y$ that is displaced.

