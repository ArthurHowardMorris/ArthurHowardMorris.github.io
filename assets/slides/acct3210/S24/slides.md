---
title: "Review Session"
---

### Overview:

- Comprehensive
- 2 hours
- 2 sections
- Each section will have 6 numbered parts, of which you may skip one. This means that we will drop the worst part from each of the two sections.

### Overview:

- Each part will include information you will use to answer the questions in
  that part. 
- These questions will be indicated with letters: (a) if there is one, (b) if
  there is a second, and so forth.
- The exam is closed book and notes.

<!-- ### PUT THE NOTE HERE -->

## Section 1:

- This will cover the information that was on the mid-term.
- The original five parts will be repeated with minor edits.
- There will be one additional question.

### Cost functions
    - Average cost,  marginal cost, incremental costs.
    - When do they exist, when do they differ, when do the differences matter.

### Regression and Plotting

- [Cost Estimation Lecture](https://arthurhowardmorris.github.io/assets/slides/acct3210/S3/Lecture3CostEstimation.slides.html)
- [Cost Estimation Excel Example](https://arthurhowardmorris.github.io/assets/slides/acct3210/S3/Problem2and3.xlsx)

Practice plotting data and adding a trend line using your tool of choice. 

### Interpret Plots of Data and Trends

- Review the characteristics of good model fit.
- Consider both how to use intuition to interpret the model, and how to use the
  relation between the data and the model (or trend line) to evaluate the model.
- Remember that just because data is on the graph, does not mean that we should
  be using it.
- The details of this question will come from the homework assignment in the excel example.

### Constrained Maximization

- Be able to set up an objective function.
- Identify the choice variables.
- Identify the constraints.
- Understand what it means for a constraint to bind, or to be slack.
- Understand shadow constraints, and explain their real world meaning. 
- The details from this question will come from the [Non-linear programming lecture](https://arthurhowardmorris.github.io/assets/slides/acct3210/S4/lecture4nonlinearProgramming.slides.html)

### Multiple Choice questions about taxes.

### Key tax concepts:

1. Assets, investments, and projects all have different pre-tax returns ($r$).
2. Tax rates $t$ vary across individuals, jurisdictions, organizations, and assets.
3. pre-tax returns $r$ correspond to post tax returns $r(1-t)$ 
4. When preferential tax treatment increases demand for a tax favored asset it's price increases and/or the return to holding it decreases. This price change is an _implicit_ tax.
5. When tax payers use organizational forms like pensions and insurance policies to avoid taxes it is called _organizational form arbitrage_.

### Key tax concepts:

6. When high-tax tax payers issue taxable debt to finance the purchase of tax free debt (e.g. municipal bonds in the US) issued by low-tax tax payers (e.g. US non-profit universities) it is called _clientele arbitrage_.
7. The depreciation _tax shield_ is the present value of the reduction in tax payments afforded by the depreciation deduction.
8. The value of the tax shield $TS$ is a function of the investment $x$, the cash flow it generates $k$, the risk-free rate of return $r$, the tax rate $t$, and the depreciation rate $d$.
$$TS=f(x,k,t,d,r)$$
9.  $TS$ is increasing in both  $d$ and $t$.

### Data Science work flow

- Review the "A 'Data Science' Workflow" Section of the [Cost Estimation Lecture](https://arthurhowardmorris.github.io/assets/slides/acct3210/S3/Lecture3CostEstimation.slides.html#/1/1)
- You should have a sense for the flow of the "management accounting" data work flow.

## Section 2 - What we've covered since the midterm

### Economics of agency

- The following issues will be covered:
  - Separation of ownership and control
  - The nature of the principal agent problem.
  - Risk aversion and incentives

### Economics of agency

- These will be questions about the concepts from:
  - [Incentives and Compensation](https://arthurhowardmorris.github.io/assets/slides/acct3210/S10/session10incentives.slides.html) and 
  - [Examples](https://arthurhowardmorris.github.io/assets/slides/acct3210/S11/MoreIncentives.slides.html)

  Note that the details of the Rothwell problem will not be tested.

### Section 2 Part 2: Transfer Pricing

- Vik-Giger
- Why do we need transfer prices?
  - Overconsumption of common resources.
  - Transmit information and incentives within a decentralized firm.

### Cost Allocation

- The key concept here is that cost allocations (including transfer prices) function as 'Pigouvian' taxes
  - Taxes reduce the taxed activity
  - Negative taxes are subsidies, and increase the subsidised activity

### Absorption Costing

- Navisky, Aspen, Kothari problems (don't worry, I won't ask all of them)
- add the breakdowns to navisky TODO

### Navisky notes:

- [Application of fixed overhead](https://arthurhowardmorris.github.io/assets/slides/acct3210/S20/problems.html#/q1-solution-1)

- You can think of the formula for fixed manufacturing overhead applied to cost of goods sold as:

$$FMO=OHR \times Q_{sold}$$

- OHR is the overhead rate: $OHR=OH/Q_{made}$
- OH is the total overhead incurred, 2.7 million in this case
- $Q_{made}$ is the number of units produced, and $Q_{sold}$ is the number of units sold.

### Navisky notes:

- [The cost per unit of inventory](https://arthurhowardmorris.github.io/assets/slides/acct3210/S20/problems.html#/q2-solution-4) is the sum of the overhead applied to the inventory and the [variable manufacturing costs](https://arthurhowardmorris.github.io/assets/slides/acct3210/S20/problems.html#/navisky-data)

- $VC/unit=380$
- The fixed overhead applied to each unit of inventory is just the overhead rate: $OHR=
### Activity Based Costing

Conceptual understanding of how activity based costing improves on simple absorption costing.

1. More granular information leads to more accurate cost allocations.
2. More accurate allocations provide better information via transfer prices.
3. More accurate allocations connect incentives (a la Pigou) to the actual costs that the firm incurs.

### Budgets/Standard Costs/Variances

The only terms you need are the ones used in the following slides. I will cover these with multiple choice questions.

### Variance:

Total Variance = Actual Cost - Standard Cost

### Disaggregation of direct cost variances

Direct cost (labor and materials) can be disaggregated into Price and Quantity variances using the flexible budget.

### Disaggregation of direct cost variances


| Total Variance                      | Actual DM Cost   | Flexible Budget  | Standard DM Cost |
|-------------------------------------|------------------|------------------|------------------|
| $(Q_a\times P_a) - (P_s\times Q_s)$ | $P_a \times Q_a$ | $P_s \times Q_a$ | $P_s \times Q_s$ |


| Total Variance                      | Price Variance                    | Quantity Variance                |
|-------------------------------------|-----------------------------------|----------------------------------|
| $(Q_a\times P_a) - (P_s\times Q_s)$ | $P_a \times Q_a - P_s \times Q_a$ | $P_s \times Q_a- P_s \times Q_s$ |
| $[Q_a(P_a-P_s)] +  [P_s(Q_a-Q_s)]$  | $Q_a(P_a-P_s)$                    | $P_s(Q_a-Q_s)$                   |

### Disaggregation of overhead cost variances

__Total Overhead Variance = Actual Overhead Costs - Overhead Absorbed__
$$AOH - (OHR \times SV) = AOH - (OHR \times SV)
$$\$2,300,000 - \$2,291,600 = \$8,400

__Interpretation:__
- Overhead is 'Underabsorbed', if actual > absorbed
- Overhead is 'Overabsorbed', if actual < absorbed

### Disaggregation  Overhead Variance

__Total Overhead Variance = Actual Overhead - Overhead Absorbed__

- Overhead spending variance = Actual overhead - Flexible budget at actual volume
- OSV = AOH - FB@AV
- Overhead efficiency variance = Flexible budget at actual volume - Flexible budget at standard volume
- OEV = FB@AV - FB@SV
- Overhead volume variance =  Flexible budget at standard volume - Overhead Absorbed
- OVV = FB@SV - OA

### Disaggregation  Overhead Variance

| TOV | = | AOH |     |       | -   |       |     | OA |
|-----|---|-----|-----|-------|-----|-------|-----|----|
| OSV | = | AOH | -   | FB@AV |     |       |     |    |
| OEV | = |     |     | FB@AV | -   | FB@SV |     |    |
| OVV | = |     |     |       |     | FB@SV | -   | OA |

### More detailed definitions:

| TOV | = | AOH |     |                     | -   |                     |     | $OHR \times SV$ |
|-----|---|-----|-----|---------------------|-----|---------------------|-----|-----------------|
| OSV | = | AOH | -   | FOH+(VOH$\times$AV) |     |                     |     |                 |
| OEV | = |     |     | FOH+(VOH$\times$AV) | -   | FOH+(VOH$\times$SV) |     |                 |
| OVV | = |     |     |                     |     | FOH+(VOH$\times$SV) | -   | $OHR \times SV$ |

### Disaggregation  Overhead Variance

- Overhead spending variance: OSV = AOH - FB@AV
  - This is the variance due to change in the cost of the overhead itself.
- Overhead efficiency variance: OEV = FB@AV - FB@SV
  - This is the variance due to differences in how efficiently we used the overhead.
- Overhead volume variance: OVV = FB@SV - OA
  - This is the variance due to the effect of volume on the overhead allocation.
