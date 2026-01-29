--- 
title: "Loan Pricing Uncertainty and the Use of Financial Covenants"
author: "Fred Asante, John Donovan, Michael Iselin, Arthur Morris"
institute: "Cornell (Ph.D. Student), University of Notre Dame, University of Minnesota, HKUST"
theme: boxes
documentclass: beamer
classoption: 
  - aspectratio=169
header-includes:
  - \usepackage{caption}
  - \captionsetup{labelformat=empty,labelsep=none}
---

## 0.0 Roadmap {#sec:0}

- [1.0 Uncertainty and Debt Contracts](#sec:1)
- [2.0 Research Question](#sec:2)
- [3.0 The LIBOR-SOFR Transition](#sec:3)
- [4.0 Empirical Approach](#sec:4)
- [5.0 Results in Brief](#sec:5)
- [6.0 Results in Full](#sec:6)


## [1.0 Uncertainty and Debt Contracts](#sec:0) {#sec:1}

> _The word "uncertainty" seemed best for distinguishing the __defects of
> managerial knowledge__ from the ordinary "risks" of business activity which
> can be feasibly reduced if not eliminated by applying the insurance
> principle..._

- Frank H. Knight, _Risk, Uncertainty and Profit_ (1933, LSE edition)

## 1.1 Uncertainty and Debt Contracts

- The focus of the debt contracting literature has been on managing the agency
costs of debt (e.g., Smith and Warner 1979; Jensen and Meckling 1976;
Christensen and Nikolaev 2012; Christensen et al. 2016).
  - Performance covenants are used to reallocate control when performance
  changes the agency problem.  
  - Capital covenants are used to prohibit predictable behavior (debt overhang,
  asset substitution, etc.).

- A complementary view is that covenants are used to manage "uncertainty": "lack of contract relevant information."
  - This view uses covenants as a way to trigger renegotiation when new
  information arrives. 
  - We conjecture that performance, rather than capital, covenants should carry
    this information. 

__These explanations are likely to coexist, and are difficult to disentangle.__

<!--TODO: cite Hans, Valeri, and Regina here. -->
<!--TODO: Cite peter here, plug in the quote in the paper-->

<!--Here is a nice section from Peter: -->

<!-- > Moreover, the results suggest an alternative role for financial covenants that -->
<!-- > differs from the agency cost explanation (Smith and Warner 1979) typically -->
<!-- > cited in the literature. My study presents a new perspective, whereby the -->
<!-- > conflict is not over the borrower’s action but rather the lack of -->
<!-- > contract-relevant information during initial loan contracting. This departure -->
<!-- > from agency represents an innovation from past research and contributes to the -->
<!-- > growing literature on incomplete contracts and accounting information -->
<!-- > (Christensen et al. 2016). This study is, to the best of my knowledge, the -->
<!-- > first to examine how borrowers and creditors address uncertainty in contract -->
<!-- > design.  -->

<!--TODO: maybe a citation of peter's paper that includes the various params.-->

## [2.0 Research Question](#sec:0) {#sec:2}

### How are financial covenants used to manage uncertainty?

- To isolate uncertainty from other factors we consider the LIBOR-SOFR transition: a setting where a policy change introduces uncertainty about the pricing of debt contracts.
- We are interested in uncertainty in general, but the setting is interesting _per se_.

### 1. Is the LIBOR-SOFR transition associated with changes in the use of financial covenants?
### 2. Is this change driven by a change in the use of performance, rather than capital, covenants?

## [3.0 The LIBOR-SOFR Transition](#sec:0) {#sec:3} 

### Key Facts: 

- Post-GFC three things became clear about LIBOR.
  1. The market it was based on was shrinking. (London Interbank Market)
  2. LIBOR rates were often based on "expert judgment" rather than actual
     transactions.
  3. LIBOR was being actively manipulated by banks. 

## 3.1 The LIBOR-SOFR Transition: Uncertainty

The practitioner discussions and literature indicate that this transition was
uncertain in the Knightian sense.

### Key Factors: 

1. SOFR and LIBOR contain different information: 
  - SOFR is the cost of funds borrowed from the Federal Reserve. 
  - LIBOR is the cost of funds borrowed from peer banks. 
    - LIBOR includes the default premium and incorporates more information about
    the cost of financing than SOFR does.
2. Lack of experience pricing debt relative to the new rate. 
  - Included translating overnight SOFR into relevant term structures (1m, 6m, etc.)
3. Lack of experience negotiating and enforcing the transition to the new base
   rate. 
  
## 3.2.0 The LIBOR-SOFR Transition: Timeline

### Key Dates:

- In 2014 the US Fed begins to develop an alternative. 
- Begins publishing the "Secured Overnight Financing Rate" (SOFR) in April 2018.
- LIBOR transition announced January 2021.
- LIBOR no longer published 30 June 2023.

## 3.2.1 Figure 1: Percentage of sample loans originated using LIBOR versus SOFR over time.

![ ](./figs/plot_libor_sofr_orig_qtr.pdf){height=90%}

## 3.2.2 Figure 2: Percentage of active LIBOR-issued loans that retain the LIBOR benchmark.

![ ](./figs/plot_libor_sofr_qtr_switch.pdf){height=85%}

## [4.0 Empirical Approach](#sec:0) {#sec:4}

Three groups of loans:

- Always LIBOR.
- LIBOR to SOFR switchers. (the observations in Figure 2)
- Always SOFR. (the red line in Figure 1)

### Staggered Difference-in-Differences 

- We use a loan path panel, where loan attributes and firm fundamentals are
  observed each quarter from origination to maturity.
- Main analyses compare LIBOR-SOFR switchers to always LIBOR loans.

## [5.0 Preview of Results](#sec:0) {#sec:5}

1. Figure 3 Plot 1: Dynamic treatment effects, Financial Covenants
2. Figure 3 Plot 2: Dynamic treatment effects, Performance Covenants
3. Figure 3 Plot 3: Dynamic treatment effects, Capital Covenants

[All estimates using `eventstudyinteract` (Sun and Abraham 2021)](#sec:stag)

## 5.1 Figure 3 Plot 1: Dynamic treatment effects relative to quarter of LIBOR to SOFR switch

![ ](./figs/fincov_event_study_interact.pdf){height=85%}

## 5.2 Figure 3 Plot 2: Dynamic treatment effects relative to quarter of LIBOR to SOFR switch

![ ](./figs/perfcov_event_study_interact.pdf){height=85%}

## 5.3 Figure 3 Plot 3: Dynamic treatment effects relative to quarter of LIBOR to SOFR switch

![ ](./figs/capcov_event_study_interact.pdf){height=85%}

## 5.4 Summary:

1. Financial covenants appear to be used to manage the uncertainty resulting
   from the LIBOR-SOFR Transition.
2. The effect is __transient__ (4 qtrs). 
3. The effect is driven by the use of __Performance Covenants__.

## [6.0 Results Roadmap:](#sec:0) {#sec:6}

1. [Key Empirical Concerns](#sec:concern)
2. [Data](#sec:data)
3. [Model](#sec:model)
4. [Tables](#sec:tables)


## [6.1.0 Key Empirical Concerns](#sec:6) {#sec:concern}

1. [Staggered Difference-in-Differences](#sec:stag)
2. [Sample Overlap (statistical and conceptual)](#sec:laps)
3. [Is the transition _caused_ by a change in credit risk?](#sec:prswitch)
4. [Why would borrowers agree to this?](#sec:hhi)


## [6.1.1 Staggered Difference-in-Differences](#sec:concern) {#sec:stag} 

> "_when already-treated units act as controls, changes in their treatment effects over time get subtracted from the DD estimate. This does not imply a failure of the design, but it does caution against summarizing time-varying effects with a single-coefficient._" (Goodman-Bacon 2021)

__Two approaches:__ 

1. This concern is _decreasing_ in the proportion of the control group that is
   _never_ treated (Baker et al. 2022). 
  - 87\% of the sample in our main analyses is never treated (i.e. Always LIBOR).
2. The negative weights can be estimated and adjusted (Sun and Abraham 2021).
  - [Figure 3 uses `eventstudyinteract` from Sun and Abraham (2021).](#sec:5)

## [6.1.2 Sample Overlap](#sec:concern) {#sec:laps}  

### Statistical Overlap: Are there valid controls for all of the treated observations (i.e. SOFR==1)

- Imbens-Rubin Differences in Means in [Table 7a](#tab:7a) are >0.25 so this is a concern. 
- We address this with Entropy Balancing in [Table 7b](#tab:7b) and [Table 8](#tab:8)

### Conceptual Overlap: LIBOR observations may differ from SOFR observations in fundamental ways not reflected in the covariates. 

- Alternate control group: "Always SOFR"
- [Table 3](#tab:3) & [Table 5b](#tab:5b) show similar results using this control group. 


## [6.1.3 Do changes in credit risk drive our results?](#sec:concern) {#sec:prswitch}  

1. [Table 4: Firm performance is not associated with the LIBOR-SOFR
   transition.](#tab:4)
2. [Table 5a: no other terms change (except spread which is mechanical relative to Always LIBOR)](#tab:5a)
3. [Table 5b: no other terms change (including spread, not mechanical relative to Always SOFR)](#tab:5b)

## [6.1.4 Why would borrowers agree to this?](#sec:concern) {#sec:hhi}

Anecdotally, BoA (or similar) calls all their clients and says, "When we
renegotiate we are switching you to SOFR." Some threaten to ReFi and pre-pay.
When it's credible BoA agrees. 

- In [Table 6](#tab:6) we repeat our analyses splitting on HHI of lenders within
borrower industries. 
- Our results only hold when lenders are concentrated (i.e. few outside options)

<!-- GOODMAN-BACON quotes: -->

<!-- This paper shows that the two-way fixed effects DD estimator in (2) is a -->
<!-- weighted average of all possible 2x2 DD estimators that compare timing groups to -->
<!-- each other (the DD decomposition). Some use units treated at a particular time -->
<!-- as the treatment group and untreated units as the control group. Some compare -->
<!-- units treated at two different times, using the later-treated group as a control -->
<!-- before its treatment begins and then the earlier-treated group as a control -->
<!-- after its treatment begins. The weights on the 2x2 DDs are proportional to group -->
<!-- sizes and the variance of the treatment dummy in each pair, which is highest for -->
<!-- units treated in the middle of the panel. -->


## [6.2 Data](#sec:6) {#sec:data}

### Data Sources: 

- __Compustat:__ Quarterly borrower fundamentals.  
- __LPC Dealscan:__ Loan details (amount, spread, base rate, covenants) at
origination, and along the loan path (i.e. as amended until maturity)
- We limit the sample to loans benchmarked to LIBOR or SOFR, this is >90\% of Dealscan Observations (rates of other benchmarks are not impacted by the transition) 

### Data Structure:

- Loan-path panel: quarterly observations of firm fundamentals and loan attributes from origination to maturity.

### Variable of Interest:

- __SOFR__ is an indicator variable equal to 1 if the base rate is SOFR and 0
otherwise (i.e. base rate is LIBOR)

<!-- ## 6. Main Tables (a section, with slides for each table) -->

## [6.3 Model](#sec:6) {#sec:model}


\begin{equation}%
\label{eqn:sofr}
\begin{split}
  Contract\;Term_{l,t}  = \beta SOFR_{l,t}+ \gamma X_{l,t} + \psi Z_{i,t} + \lambda_{l} + \tau_{t}+ \varepsilon_{l, t}
\end{split}
\end{equation}


- $Contract\; Term_{l,t}$ is the debt contract term of interest for tranche $l$ in quarter $t$.
- $SOFR_{l,t}$ in an indicator variable equal to 1 if tranche $l$ uses SOFR in quarter $t$.
- $X_{l,t}$ is a vector of time-varying loan-level attributes.
- $Z_{i,t}$ is a vector of time-varying borrower-level attributes. 
- $\lambda_{l}$ indexes loan-tranche fixed effects.
- $\tau_{t}$ indexes year-quarter period fixed effects. 

## [6.4 Tables](#sec:6) {#sec:tables}

- Table 1: Descriptive Statistics for sample of loans issued relative to LIBOR
- Table 2: LIBOR-SOFR transition on covenant use: Always LIBOR control sample
- Table 3: LIBOR-SOFR transition on covenant use: Always SOFR control sample
- Table 4: The determinants of the LIBOR-SOFR transition
- Table 5a: The effect of the LIBOR-SOFR transition on other contract terms: Always LIBOR control sample
- Table 5b: The effect of the LIBOR-SOFR transition on other contract terms: Always SOFR control sample
- Table 6: Cross sectional effect of lending concentration: Always LIBOR control sample
- Table 7a: Sample Overlap comparing loans that switch from LIBOR to SOFR, to those that use LIBOR.
- Table 7b: Entropy-Balanced Sample Overlap comparing loans that switch from LIBOR to SOFR, to those that use LIBOR.
- Table 8: Entropy balancing results - Always LIBOR control sample

## [6.4 Table 1: Descriptive Statistics for sample of loans issued relative to LIBOR]() {#tab:1}

![ ](./tabsnap/T1.png){width=90%}

## [6.4 Table 2: LIBOR-SOFR transition on covenant use: Always LIBOR control sample](#sec:tables) {#tab:2}

![ ](./tabsnap/T2.png){width=83%}

## [6.4 Table 3: LIBOR-SOFR transition on covenant use: Always SOFR control sample](#sec:laps) {#tab:3}

![ ](./tabsnap/T3.png){width=83%}

## [6.4 Table 4: The determinants of the LIBOR-SOFR transition.](#sec:prswitch) {#tab:4}

![ ](./tabsnap/T4.png){height=90%}

## [6.4 Table 5a: The effect of the LIBOR-SOFR transition on other contract terms: Always LIBOR control sample](#sec:prswitch) {#tab:5a}

![ ](./tabsnap/T5a.png){width=90%}

## [6.4 Table 5b: The effect of the LIBOR-SOFR transition on other contract terms: Always SOFR control sample](#sec:prswitch) {#tab:5b}

![ ](./tabsnap/T5b.png){width=90%}

## [6.4 Table 6: Cross sectional effect of lending concentration: Always LIBOR control sample](#sec:hhi) {#tab:6}

![ ](./tabsnap/T6.png){width=90%}

## [6.4 Table 7a: Sample Overlap comparing loans that switch from LIBOR to SOFR, to those that use LIBOR.](#sec:laps) {#tab:7a}

![ ](./tabsnap/T7a.png){width=90%}

## [6.4 Table 7b: Entropy-Balanced Sample Overlap comparing loans that switch from LIBOR to SOFR, to those that use LIBOR.](#sec:laps) {#tab:7b}

![ ](./tabsnap/T7b.png){width=90%}

## [6.4 Table 8: Entropy balancing results - Always LIBOR control sample](#sec:laps) {#tab:8}

![ ](./tabsnap/T8.png){width=90%}

