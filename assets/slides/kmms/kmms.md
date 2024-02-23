---
title: "Regulatory Exposure, Debt Contract Terms, and Bank Specialization"
author: "Junqiang Ke (CUFE), Zhiming Ma (Guanghua SM), Derrald Stice (HKU BS), Arthur Morris (SBM @ HKUST)"
toc: true
---

# Motivation: Incentives and Regulation 

## I study incentive problems and regulation:

### Past:

- [_Financial Shocks to Lenders and the Composition of Financial Covenants_]()
- [_Political Information Flow and Management Guidance_]()
- [_Pay for Prudence_]()

### Present:

- [_Renegotiation Costs and Debt Contract Design_]()
- [_Individual Mortgage Lending, Public Corruption, Race, and Gender: Evidence from Local Corruption Crack-Downs_]()
- [_Option Grants and Risky Projects_]()

### Future:

- Environmental Terms in Debt Contracts
- Environmental Terms in Compensation Contracts 

## Regulation:

Central to the function of the economy; highly contentious.
Depending on who you ask the US regulatory regime is:

- [So onerous that it destroys any economic dynamism.](https://a16z.com/the-techno-optimist-manifesto/)
- [Completely captured by the regulated; only useful for rent extraction.]()
- [Utterly toothless.]()

This is one fundamental tension in all studies of regulation.

## This Study:

### How do banks manage uncertainty due to borrowers' regulatory exposure?

- Specialization vs. diversification.
- Spreads vs. covenants.
- Regulatory capture vs. regulatory enfeeblement. 

We build on recent work in finance that attempts to measure regulatory
exposure, and shows that it is a meaningful source of uncertainty for firms
([Kalmenovitz, 2023
RFS](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3451344); [Kalmenovitz
& Chen, 2023
JLE](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3730721)). And recent
theory work in accounting on the interaction between spreads, covenants, and
uncertainty (Hiemann, 2023 WP)

### Definition:

- _Regulatory Exposure_: The bundle of costs and uncertainties that are associated with government regulation.

# Research Question: Managing Uncertainty Due To Regulation

## Two Research Questions:

### Is there a relation between borrowers' regulatory exposure and debt contract terms?

- If uncertainty due to regulatory exposure leads to higher interest spreads
  and/or stricter contract terms, then some banks may find it profitable to
  specialize in order to provide financing for borrowers that are exposed to
  this source of uncertainty.
- This leads to our second question:

### Do banks use specialization to manage regulatory exposure in their lending portfolio?

## RQ 1: Use of the contract to manage uncertainty.

- Cost of debt reflects credit risk.
- In equilibrium, a negative relation between spreads and covenants (Jensen &
  Meckling, 1979; Myers 1977; Smith & Warner 1979; Gigler et al. 2009; Bradley
  & Roberts, 2015)
- How this trade-off adjusts to differing levels and sources of uncertainty is
  less clear.
<!-- - Complete contracts allocate decision rights ex-ante.  -->
<!-- - Incomplete contracts transfer control ex-post. -->
<!-- - Trade-off between spreads and covenants (negative relation). -->


__Hiemann (2023) argues that the extent to which borrowers can influence risk will determine this trade-off.__

## Hiemann (2023):

- __High borrower influence__ $\rightarrow$ Low spreads, tight covenants.
- __Low borrower influence__ $\rightarrow$ High spreads, loose covenants.

This is the foundation of our predictions for RQ 1.

## Measurement of Regulatory Exposure:

### __Kalmenovitz (2023 RFS)__: 

- Takes advantage of the fact that US Federal paperwork law requires regulators
  to estimate and report the cost of gathering data, and preparing paperwork
  required to comply with regulations. 
- Uses a machine learning algorithm to identify regulations that are relevant
  for each company and generates an index of exposure to these regulations as a
      proportion of all active regulations.
- Validates this measure of observable paperwork burden as a proxy, for
  unobservable burden of regulation.

## Note on uncertainty:

- The argument that this burden is a straightforward cost, rather than a source of uncertainty, gives us a credible null.
- Traditional performance measures would be sufficient statistics for this effect. I.e.: MTB, Profitability, Z-Score, and Cash Flow Volatility.

## RQ 1: Preview of Results

1. Positive and significant relation between regulatory exposure and spreads.
    - 4.10 bp or 1.8% 
2. Negative and insignificant relation between regulatory exposure and covenants. 

Spread results are consistent with _low borrower influence_, covenant results
are directionally consistent. More evidence is needed to fully validate the
prediction from Hiemann (2023), but this is evidence suggest that banks do not
view the regulatory process as captured.

## RQ 2: Use of specialization to manage regulatory exposure.

- __Specialization__ allows the bank to accumulate and apply expertise to borrower screening and monitoring.
    - Allows specialist bank to provide more attractive terms.
- Alternatively, banks may manage their exposure by __diversification__.

## RQ 2: Potential strategies/predictions

1. If banks specialize, then we expect a positive association between lending
   to a firm's regulatory peers, and lending to the firm itself.
2. If banks diversify, then we expect a negative relation between lending to a
   firm's regulatory peers, and lending to the firm itself.

__Definition:__ _Regulatory peers_ are firms exposed to the same set of regulations.

## Measurement of Specialization

### __Kalmenovitz & Chen (2023)__:

Compare the text of Federal Register publications which mention each firm, to
create pairwise similarities for all mentioned firms. We define each firm's
peers as the top 20 most similar firms based on this metric.

We create an indicator equal to 1 if the bank has lent to the borrower's peers in the last five years.

## RQ 3: Preview of Results 

1. Lenders are more likely to lend within regulatory peer groups. 
    - Borrowers are 24% more likely to obtain a loan from a bank that lends to
      their regulatory peers than from other active banks in the market.
2. When banks do lend to regulatory peers, they require lower interest spreads,
    also more favorable non-price terms (evidence of specialization).

# Contribution: Regulatory Uncertainty and Bank Specialization

## Key contributions:

1. Literature on Regulatory Uncertainty:
    - Regulatory exposure is priced
    - Regulatory exposure appears not to be a source of uncertainty which borrowers control (i.e. not captured)
2. Literature on Bank Specialization:
    - First evidence that regulatory uncertainty is managed through specialization rather than diversification 
    - Note the difference between regulatory risk which may be idiosyncratic or Knightian, and systematic risks which can be diversified
    - Specialization is particularly salient given recent bank failures

# Hypotheses and Data

## Hypotheses (null form):

- __H1:__ Regulatory exposure has no relationship with interest spreads and loan covenants.
- __H2:__ Lenders are not more or less likely to lend to regulatory peers.
- __H3:__ Lenders will not offer differential interest spreads or covenant terms to regulatory peers of existing borrowers. (CX)
- __H4:__ Regulatory exposure is not associated with loan terms when the bank lends to the borrower’s regulatory peers. (CX)

## Data:

- DealScan, Compustat, Kalmenovitz (Regulatory Exposure & Regulatory Peer).
- One transaction-level (loan origination dataset)
- One borrower-lender panel (lender-borrower-year)

## Samples:

| Description                                                                               | Observations |
|-------------------------------------------------------------------------------------------|--------------|
| Dealscan loan facilities with financial data available from US non fic/ute Compustat.     | 61,884       |
| __H1:__ with regulatory exposure data (Kalmenovitz 2023) and no missing control variables | 30,533       |
| __H3:__ with regulatory similarity scores (Kalmenovitz and Chen 2023).                    | 14,242       |
| __H4:__ with both regulatory exposure and regulatory similarity scores.                   | 13,247       |
| __H2:__ Bank-firm-year level regressions for lending probability tests.                   | 490,250      |

# Tests of Hypotheses 

## Model and Data for H1:

$$
Loan Term = \alpha + \beta Regulatory Exposure + \Gamma Controls + \varepsilon 
$$
<!-- $Loan\;Term = \alpha + \Beta Regulatory\;Exposure + \Gamma Controls + \espilon$ -->

### Loan Terms:
- Spread, Financial Covenants, Strictness.

### Controls:
- Loan attributes, borrower attributes.
- Year, industry, borrower, lender, and lender-year effects (in various models).

### Data structure:

- Standard loan-level dataset, measured at initiation.

## Results (H1):

|            | Spread   | Spread   | Spread   | Spread   | F-Cov     | PVIOL     |
|------------|----------|----------|----------|----------|-----------|-----------|
| Reg.Exp.   | 41\*\*\* | 37\*\*   | 40\*\*\* | 36\*\*\* | -0.116    | -0.039    |
|            | $(3.01)$ | $(2.23)$ | $(3.01)$ | $(2.67)$ | $(-0.76)$ | $(-0.58)$ |
| Controls   | Yes      | Yes      | Yes      | Yes      | Yes       | Yes       |
| Year       | Yes      | Yes      | Yes      | No       | Yes       | Yes       |
| Ind.       | Yes      | No       | No       | No       | Yes       | Yes       |
| Firm       | No       | Yes      | No       | No       | No        | No        |
| Bank       | No       | No       | Yes      | No       | No        | No        |
| Bank×Yr    | No       | No       | No       | Yes      | No        | No        |
| _N_        | 30,553   | 30,553   | 30,553   | 30,553   | 30,553    | 16,092    |
| Adj. $R^2$ | 0.514    | 0.629    | 0.592    | 0.623    | 0.366     | 0.291     |

<!-- # Tests of H2 -->

## Model and Data for H2: Lender-Borrower-Year Panel

$$
Lending = \alpha + \beta Regulatory Peer + \Gamma Controls + \varepsilon
$$
<!-- $$ -->
<!-- Loan Term = \alpha + \Beta Regulatory Peer + \Gamma Controls + \varepsilon -->
<!-- $$ -->

### Regulatory Peer:

An indicator equal to 1 if the bank has loaned to a regulatory peer in the past 5 years, 0 otherwise. 

### Lending:

An indicator equal to 1 if the bank loans to the firm in the year, 0 otherwise.

### Controls:

Borrower attributes. Year, industry, borrower, borrower-year, lender, lender-year (as indicated). 

### Data Structure:

Lender-Borrower pairwise combinations of the top-50 banks by market share (prior year) and DealScan borrowers with required data (Bharath et al., 2007; Hellman et al. 2008).


## Lending Results (H2):

|          | Lending     | Lending     | Lending     | Lending     | Lending     | Lending     |
|----------|-------------|-------------|-------------|-------------|-------------|-------------|
| Reg.Peer | 0.238\*\*\* | 0.240\*\*\* | 0.238\*\*\* | 0.215\*\*\* | 0.213\*\*\* | 0.216\*\*\* |
|          | $(15.37)$   | $(15.52)$   | $(15.38)$   | $(16.66)$   | $(16.76)$   | $(16.91)$   |
| Controls | Yes         | Yes         | Yes         | Yes         | Yes         | Yes         |
| Year     | Yes         | Yes         | No          | Yes         | No          | Yes         |
| Ind.     | Yes         | No          | No          | Yes         | Yes         | No          |
| Firm     | No          | Yes         | No          | No          | No          | No          |
| Frm×Yr   | No          | No          | Yes         | No          | No          | Yes         |
| Bank     | No          | No          | No          | Yes         | No          | No          |
| Bnk×Yr   | No          | No          | No          | No          | Yes         | Yes         |
| _N_      | 490,250     | 490,250     | 490,250     | 490,250     | 490,250     | 490,250     |
| A $R^2$  | 0.266       | 0.268       | 0.283       | 0.278       | 0.297       | 0.280       |

<!-- # Tests of H3  -->

## Models and Data for H3:

$$
Loan Terms = \alpha + \beta Regulatory Peer + \Gamma Controls + \varepsilon
$$

### All variables as defined above.

### Data Structure:

As in tests of H1.

## Loan Terms Results (H3):


|          | Spread    | Spread    | Spread  | Spread    | Spread    | Spread    |
|----------|-----------|-----------|---------|-----------|-----------|-----------|
| Reg.Peer | -15\*\*\* | -13\*\*\* | -11\*\* | -11\*\*\* | -11\*\*\* | -11\*\*\* |
|          | (-6.07)   | (-5.21)   | (-3.56) | (-4.48)   | (-4.25)   | (-4.56)   |
| Controls | Yes       | Yes       | Yes     | Yes       | Yes       | Yes       |
| Year     | Yes       | Yes       | No      | Yes       | No        | Yes       |
| Ind      | Yes       | No        | No      | No        | Yes       | No        |
| Firm     | No        | Yes       | No      | No        | No        | Yes       |
| Frm×Yr   | No        | No        | Yes     | No        | No        | No        |
| Bank     | No        | No        | No      | Yes       | No        | Yes       |
| Bnk×Yr   | No        | No        | No      | No        | Yes       | No        |
| _N_      | 14,242    | 14,242    | 14,242  | 14,242    | 14,242    | 14,242    |
| A $R^2$  | 0.602     | 0.669     | 0.752   | 0.643     | 0.666     | 0.698     |






## Loan Terms Results (H3):

|          | F-Cov     | PVIOL     |
|----------|-----------|-----------|
| Reg.Peer | $-0.015$  | -0.019    |
|          | $(-0.55)$ | $(-0.23)$ |
| Controls | Yes       | Yes       |
| Year     | Yes       | Yes       |
| Ind      | Yes       | Yes       |
| Firm     | No        | No        |
| Firm×Yr  | No        | No        |
| Bank     | No        | No        |
| Bank×Yr  | No        | No        |
| _N_      | 14,242    | 7,514     |
| Adj R2   | 0.431     | 0.290     |

<!-- # Tests of H4: -->

## Model and Data For H4:

$$
Loan Terms = \alpha + \beta_1 Reg Peer \times RegExp + \beta_2 Reg Peer
$$
$$
+ \beta_3 Reg Exp + \Gamma Controls + \varepsilon
$$

### All details as in previous loan term models

## Results (H4):

 |                   | Loan Spread   |
 |-------------------|---------------|
 | Reg.Peer×Reg.Exp. | -90.915\*\*\* |
 |                   | (-3.63)       |
 | Reg.Peer          | 75.239\*\*\*  |
 |                   | (3.06)        |
 | Reg.Exp.          | 71.069\*\*\*  |
 |                   | (3.12)        |
 | Controls          | Yes           |
 | Loan Type FE      | Yes           |
 | Loan Purpose FE   | Yes           |
 | Year FE           | Yes           |
 | Industry FE       | Yes           |
 | Observations      | 13,247        |
 | Adjusted R2       | 0.602         |

# Additional Analysis

## Other Forms of Uncertainty: Reporting

|                 | Spread                   | Spread        |
|-----------------|--------------------------|---------------|
| _Factor_        | _Discretionary Accruals_ | _Restatement_ |
| Reg.Peer×Factor | -17.202\*\*\*            | -13.500\*\*   |
|                 | $(-3.68)$                | $(-2.55)$     |
| Reg Peer        | -7.560\*\*               | -11.734\*\*\* |
|                 | $(-2.36)$                | $(-4.38)$     |
| Factor          | 9.405\*\*                | 18.232\*\*\*  |
|                 | $(2.04)$                 | $(3.70)$      |
| Controls        | Yes                      | Yes           |
| Year FE         | Yes                      | Yes           |
| Industry FE     | Yes                      | Yes           |
| Observations    | 12,796                   | 14,242        |
| Adjusted R2     | 0.608                    | 0.603         |

## Other Forms of Uncertainty: Political, Economy

|                 | Spread                  | Spread                        |
|-----------------|-------------------------|-------------------------------|
| _Factor_        | _Political Uncertainty_ | _Economic Policy Uncertainty_ |
| Reg.Peer×Factor | -17.375\*\*             | -23.725\*\*\*                 |
|                 | (-2.57)                 | (-5.25)                       |
| Reg Peer        | -16.998\*\*\*           | -4.999\*                      |
|                 | (-3.61)                 | (-1.83)                       |
| Factor          | 16.602\*\*\*            | 11.551\*\*                    |
|                 | (2.70)                  | (2.30)                        |
| Controls        | Yes                     | Yes                           |
| Year FE         | Yes                     | Yes                           |
| Industry FE     | Yes                     | Yes                           |
| Observations    | 7,734                   | 12,955                        |
| Adjusted R2     | 0.610                   | 0.621                         |

## Other contract terms:

|                 | Loan Size   | Maturity    | Collateral   | Lenders     |
|-----------------|-------------|-------------|--------------|-------------|
| Reg Peer        | 0.354\*\*\* | 1.442\*\*\* | -0.032\*\*\* | 1.324\*\*\* |
|                 | $(11.06)$   | $(3.38)$    | $(-2.82)$    | $(6.65)$    |
| Loan Type FE    | Yes         | Yes         | Yes          | Yes         |
| Loan Purpose FE | Yes         | Yes         | Yes          | Yes         |
| Year FE         | Yes         | Yes         | Yes          | Yes         |
| Industry FE     | Yes         | Yes         | Yes          | Yes         |
| Observations    | 12,955      | 12,955      | 12,955       | 12,955      |
| Adjusted R2     | 0.593       | 0.572       | 0.359        | 0.394       |

## Matching

|                      | Spread       | Spread      |
|----------------------|--------------|-------------|
| _Matching Proc._     | __PSM__      | __EB__      |
| High Regulatory Exp. | 10.432\*\*\* | 9.436\*\*\* |
|                      | $(3.50)$     | $(3.37)$    |
| Controls             | Yes          | Yes         |
| Year                 | Yes          | Yes         |
| Ind.                 | Yes          | Yes         |
| _N_                  | 14,038       | 30,533      |
| Adj. $R^2$           | 0.501        | 0.503       |



## Kalmenovitz (2023) on Uncertainty:

> _"Third, crosssectional tests highlight two possible mechanisms: budget
> constraints and uncertainty. Compliance costs could create budget pressures,
> forcing companies to prioritize compliance over other business activities
> (Giroud and Mueller (2017)). Moreover, the expansion of regulatory burden
> increases the legal uncertainty, incentivizing managers to postpone projects
> until the uncertainty would be resolved (McDonald and Siegel (1986); Bernanke
> (1983); Julio and Yook (2012); Gulen and Ion (2015)). Indeed, I find that the
> decline in capital investment is concentrated among financially constrained
> firms, which have little slack and must repurpose resources toward
> compliance, and among companies with irreversible investment opportunities,
> which are especially sensitive to uncertainty."_ 

While more can be done on this topic, we do not think this is a gap in the literature that we are well positioned to fill.

