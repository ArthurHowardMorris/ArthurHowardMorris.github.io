--- 
title: "Environmental Covenants and Lenders' Economic Incentives"
author: "Ting Dai, Daniele Macciocchi, Arthur Morris"
institute: "HKUST (Ph.D. Student), University of Miami, HKUST"
theme: boxes
documentclass: beamer
classoption: 
  - aspectratio=169
header-includes:
  - \usepackage{caption}
  - \captionsetup{labelformat=empty,labelsep=none}
---

## Objective: 

### Paper: 

- Use the association between borrower pollution and environmental covenants in
debt contracts to clarify lenders' concerns about pollution and the role of
regulation in those concerns.

### Roadmap:

1. Background on Environmental Covenants, and the Literature.
2. Research Questions and Predictions.
3. Empirical Approach and Results.

## Three Types of Environmental Covenants

- __Compliance Covenants:__ 
  - Require borrower to comply with environmental laws and regulations. 
  - These are in all contracts.

- __Information Covenants__ 
  - Require the borrower to disclose information about pollution.

- __Action Covenants__ 
  - Require the borrower to remediate pollution.

- _"Covenants" in debt contracts are commonly "free standing events of default".
  So failure to act, inform, or comply allows the lender to call the loan._
<!-- - _Information covenants can be used to trigger "Material Adverse -->
<!-- Change" clauses. These clauses are understudied in the literature, and the topic -->
<!-- of another paper---that Ting Dai and I are working on._ -->

## What we Know About Environmental Covenants in Debt Contracts 

Very brief summary of the main research questions that the literature has
addressed:

::: {.incremental}
1. Is public environmental enforcement a complement or substitute for private monitoring (i.e. Environmental Covenants)? 
- Choy et al. (2023): Positive association between enforcement activity and
environmental covenants. (_ex post_: complements)
- Demerjian et al. (2025): Negative association between regulatory commitments and
environmental covenants. (_ex ante_: substitutes) 
2. Are lender's environmental commitments (e.g. the Equator Principles) associated with environmental covenant use (e.g. Amiram et al., 2021).
- Yes, positive.*
:::

<!-- ## For those of you that are not accountants -->

<!-- A dominant philosophical view in accounting research is that the accounting
activity is valuable for it's contribution to contracting. That is, accounting
exists to produce contractable information. So, research questions that other
fields might not be interested in interest us more. -->

## Our Framework:

- Pollution is an external cost.
  - To the managers and owners of a firm, polluting reduces production costs.
- What matters to lenders is how this external cost is internalized: 
  1. Ineffectively (the costs stay external): Lenders may not care.
  2. Effectively and timely: Lenders care, but general contract terms are sufficient (i.e. spreads, collateral).
  3. Effectively but __not__ timely: Lenders care, but general contract terms are not sufficient. 

### Enforcement in the US is (historically) often effective, but not timely.

## Our Framework:  

#### Pollution allows borrowers to reduce current costs while creating future environmental liabilities that are senior to the lender's claim. 

__Claim dilution (Smith and Warner, 1979)__

## Research questions 

1. Does use of general monitoring mechanisms (spread, collateral, etc.) vs. explicitly environmental covenants vary with borrower pollution?
  <!-- - i.e. Is pollution priced or monitored with collateral? -->
2. Does the use of environmental covenants vary with the type and location of the borrower's pollution? 
  <!-- - On on-site emissions of land and water pollution impact the assets the lender can claim in bankruptcy, air and off-site pollution does not.  -->
3. Does the type of environmental covenant used to manage these agency problems
   vary with uncertainty? 
  <!-- - Are the actions to be taken specified ex-ante (complete contracting), or is the contract focused on signals about the state of the world (incomplete contracting). -->

## Data 

__Sources:__

- Environmental Covenants: EDGAR 
  - We are the first to study Information and Action Covenants _separately_.
- Loan Contract Details: DealScan 
- Borrower and Lender Fundamentals: Compustat 
- Emissions: US EPA TRI data. 
  - We are the first to separate type and location of emissions (in this
  literature).
- Enforcement and Reputation Shocks: RepRisk
<!-- - Specialization: We adapt the Giometti & Pietrosanti (2022) approach to measure -->
<!--"Brown Industry Specialization" by banks.-->

__Main sample: 2002-2022__  

__Environmental Events (RepRisk): 2008-2022__  

## RQ 1: 

__Does use of general monitoring mechanisms (spread, collateral, etc.) vs. explicitly environmental covenants vary with borrower pollution?__ 

__Prediction:__

- The use of general mechanisms alone should decrease, and the use of environmental mechanisms should increase, as pollution increases. 

__Empirical Approach:__ 

- 3 Contract Term "Levers": High Spread, Collateral, Environmental Covenants.
- Model how the combination of levers varies with pollution.
- Multinomial logit:
  - levers can be used in combination, and 
  - the alternatives are not independent (IIA does not hold).

## Figure 1. Panel B. Pr(Contract Term Bundle) across Total Emissions

![Combined Plot, Predicted Probability by Contract Term Bundle across Total Emissions](./img/F1PB.png){width=80%}


## Table 3. Panel A. (For Q&A)

![Distribution of Bundles.](./img/T3PA.png){width=100%}

## Table 3. Panel B. (For Q&A)

![Average Marginal Effects of Total Emissions.](./img/T3PB.png){width=100%}

## RQ 2: 
__Does the use of environmental covenants vary with the type and location of the borrower's pollution?__ 

__Prediction:__ 

- If the use of environmental covenants is motivated by the claim dilution
problem we describe, then only on-site emissions of land and water pollution
should be associated with their use. 

__Empirical Approach:__ 

- Separate emission types into air, land, water, on-site, and off-site. 
- Model covenant use as a function of each type and location. 

## Table 4. 

![Environmental Covenants and Borrower Emissions.](./img/T4.png){width=70%}

## This is consistent with lawyers' concerns:

From _The Loan Syndications and Trading Association's (LSTA) Complete Credit
Agreement Guide_:

> _...even if liability is not direct to the lender itself, the lender could
> indirectly incur a loss if the values of the borrower's property decreased due
> to the presence of contamination. If other collateral was not available, the
> cost to remediate the property would effectively be paid by the lender._

## RQ 3: 

__Does the type of environmental covenant used to manage these agency problems vary with uncertainty?__

__Prediction:__ 

- If Information Covenants are 'incomplete contract' mechanisms, and Action Covenants are 'complete contract' mechanisms. Then use of Action Covenants should vary with uncertainty about the borrower's pollution. 

## RQ 3: Uncertainty 

> _The word "uncertainty" seemed best for distinguishing the __defects of
> managerial knowledge__ from the ordinary "risks" of business activity which
> can be feasibly reduced if not eliminated by applying the insurance
> principle..._

- Frank H. Knight, 1933, _Risk, Uncertainty and Profit_.
  - From the author's forward to the 1933 edition published by the London School
of Economics.

## RQ 3:


__Empirical Approach:__ 


- We model the use of Information Covenants and Action Covenants both alone and
  together as a function of:
  - Brown Industry Specialization (i.e. portfolio concentration in a brown
  industry is an outlier). Specialists have less defective knowledge.
  - Industry Environmental Enforcement/Reputation Events. Reveal defects in knowledge.
- We both OLS (indicator) and multinomial logit (continuous) to model how the choice of bundles of contract terms changes with lender specialization.

## Table 5. 

![Environmental Covenant Type and Brown Bank Specialization.](./img/T5.png){width=100%}

## Figure 3. pr(Covenant Bundle) across Brown Specialization Level

![Combined Plot, Predicted Probability by Covenant Bundle across Brown Specialization Level.](./img/F3.png){width=80%}

## Table 6

![Environmental Covenant Type and Industry Violations.](./img/T6.png){width=100%}

## Table 7  

![Environmental Covenant Type and Industry Environmental Events.](./img/T7.png){width=100%}

## Takeaway:

- Pollution is an externality.
- Private monitoring of pollution is a response to the internalization of pollution related costs by regulators. 
- Suggests a central role for environmental regulation, and a perhaps peripheral role for environmental disclosure.


## Thank You! 

## Additional Material 

## Compliance Covenant

> _"The Borrower will, and will cause each of its Subsidiaries to, __comply with
> all laws__, rules, regulations and orders of any Governmental Authority
> applicable to it or its property (including, without limitation, ERISA and
> Environmental Laws)"_

__All contracts in our sample have compliance covenants.__

## Information Covenant

> _"The Borrower will, and will cause each of its Subsidiaries to, permit any
> representatives designated by the Administrative Agent or any Lender, upon
> reasonable prior notice, to __visit and inspect__ its __properties__, to examine and
> make extracts from its __books and records__, __including environmental assessment
> reports and Phase I or Phase II studies__,"_

## Action Covenant

> _"if the Administrative Agent or __any Lender has formed a reasonable belief__
> that __material violations__ of Environmental Laws may exist or __Hazardous
> Materials may be present on the Real Property__ in amounts or under
> circumstances which could reasonably be expected to result in a liability
> exceeding a Material Environmental Amount, then,"_
>
> _"\[perform\] any cleanup, remediation, containment, operation, maintenance,
> monitoring or restoration work, whether on or off of the Real Property"_
>
> _"__restore the Real Property to the maximum extent practicable, which shall
> include, without limitation, the repair of any surface damage__."_


## Covenant Use Over Time

![Covenant use over time.](./img/trend.png){width=80%}

## Examples of the Liabilities That Lenders are Trying to Manage: 

| Company | Year | Amount |
|:---|:---:|:---:|
| Anaconda Smelter | 2022 | $126M |
| U.S. Magnesium | 2021 | $60M |
| Atlantic Richfield Company | 2020 | $150M |
| Nuclear Metals | 2019 | $125M |
| Doe Run | 2018 | $80M |
| Freeport-McMoran, Inc. | 2017 | $600M |
| Occidental Chemical | 2016 | $165M |
| Mosaic Fertilizer | 2015 | $2B |
| Tronox (Bankruptcy) | 2014 | $5.15B |
| Transocean | 2013 | $1B |
| Moex Offshore | 2012 | $90M |
| BP America | 2011 | $324M |
| General Motors (Bankruptcy) | 2010 | $773M |
| ASARCO (Bankruptcy) | 2009 | $1.79B |
| Lexington-Fayette | 2008 | $290M |


<!-- ## Append. -->

<!-- Selection Analysis T8 -->

<!-- Oster Analysis T9  -->

<!-- Financial Covenants Fig B1 -->

<!-- Persistence Tab B1  -->

<!-- Off-site Land/Water Tab B2  -->

<!-- Multi Info.Action. Tab B3 -->


