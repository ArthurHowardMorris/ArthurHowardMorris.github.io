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
- Regulatory capture vs. regulatory. 

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

## RQ 1: Preview of Results

1. Positive and significant relation between regulatory exposure and spreads.
    - 3.60 bp or 1.59% 
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
2. When banks do lend to regulatory peers, they require lower interest spreads
(7.23% lower spread), also more favorable non-price terms (evidence of
specialization)

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
| Dealscan loan facilities with financial data available from US non fic/ute Compustat.     | 63,821       |
| __H1:__ with regulatory exposure data (Kalmenovitz 2023) and no missing control variables | 30,011       |
| __H3:__ with regulatory similarity scores (Kalmenovitz and Chen 2023).                    | 12,655       |
| __H4:__ with both regulatory exposure and regulatory similarity scores.                   | 12,275       |
| __H2:__ Bank-firm-year level regressions for lending probability tests.                   | 510,550      |

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
| Reg.Exp.   | 36\*\*\* | 33\*\*   | 32\*\*   | 30\*\*   | -0.037    | -0.029    |
|            | $(2.65)$ | $(2.04)$ | $(2.48)$ | $(2.24)$ | $(-0.27)$ | $(-0.42)$ |
| Controls   | Yes      | Yes      | Yes      | Yes      | Yes       | Yes       |
| Year       | Yes      | Yes      | Yes      | No       | Yes       | Yes       |
| Ind.       | Yes      | No       | No       | No       | Yes       | Yes       |
| Firm       | No       | Yes      | No       | No       | No        | No        |
| Bank       | No       | No       | Yes      | No       | No        | No        |
| Bank×Yr    | No       | No       | No       | Yes      | No        | No        |
| _N_        | 30,011   | 30,011   | 30,011   | 30,011   | 30,011    | 15,905    |
| Adj. $R^2$ | 0.519    | 0.637    | 0.596    | 0.627    | 0.366     | 0.291     |

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

|           | Lending     | Lending     | Lending     | Lending     | Lending     |
|-----------|-------------|-------------|-------------|-------------|-------------|
| Reg.Peer  | 0.240\*\*\* | 0.242\*\*\* | 0.240\*\*\* | 0.216\*\*\* | 0.214\*\*\* |
|           | $(15.18)$   | $(15.31)$   | $(15.22)$   | $(16.34)$   | $(16.41)$   |
| Controls  | Yes         | Yes         | Yes         | Yes         | Yes         |
| Year      | Yes         | Yes         | No          | Yes         | No          |
| Ind.      | Yes         | No          | No          | Yes         | Yes         |
| Firm      | No          | Yes         | No          | No          | No          |
| Firm×Yr   | No          | No          | Yes         | No          | No          |
| Bank      | No          | No          | No          | Yes         | No          |
| Bank×Yr   | No          | No          | No          | No          | Yes         |
| _N_       | 510,550     | 510,550     | 510,550     | 510,550     | 510,550     |
| Adj $R^2$ | 0.267       | 0.269       | 0.284       | 0.279       | 0.297       |

<!-- # Tests of H3  -->

## Models and Data for H3:

$$
Loan Terms = \alpha + \beta Regulatory Peer + \Gamma Controls + \varepsilon
$$

### All variables as defined above.

### Data Structure:

As in tests of H1.

## Loan Terms Results (H3):


|             | Spread      | Spread      | Spread    | Spread     | Spread     |
|-------------|-------------|-------------|-----------|------------|------------|
| Reg.Peer    | $-12\*\*\*$ | $-11\*\*\*$ | $-13\*\*$ | $-8\*\*\*$ | $-8\*\*\*$ |
|             | $(-4.84)$   | $(-4.42)$   | $(-2.25)$ | $(-3.60)$  | $(-3.33)$  |
| Controls    | Yes         | Yes         | Yes       | Yes        | Yes        |
| Firm        | No          | Yes         | No        | No         | No         |
| Firm×Yr     | No          | No          | Yes       | No         | No         |
| Bank        | No          | No          | No        | Yes        | No         |
| Bank×Yr     | No          | No          | No        | No         | Yes        |
| _N_         | 12,955      | 12,955      | 12,955    | 12,955     | 12,955     |
| Adjusted R2 | 0.620       | 0.702       | 0.813     | 0.661      | 0.687      |
 
## Loan Terms Results (H3):

|             | F-Cov     | PVIOL     |
|-------------|-----------|-----------|
| Reg.Peer    | $-0.010$  | -0.019    |
|             | $(-0.36)$ | $(-1.53)$ |
| Controls    | Yes       | Yes       |
| Year        | Yes       | Yes       |
| Ind         | Yes       | Yes       |
| Firm        | No        | No        |
| Firm×Yr     | No        | No        |
| Bank        | No        | No        |
| Bank×Yr     | No        | No        |
| _N_         | 12,955    | 7,081     |
| Adjusted R2 | 0.408     | 0.308     |

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
| Reg.Peer×Reg.Exp. | -79.595\*\*\* |
|                   | $(-4.72)$     |
| Reg.Peer          | 65.932\*\*\*  |
|                   | (4.15)        |
| Reg.Exp.          | 38.908\*\*    |
|                   | (2.19)        |
| Controls          | Yes           |
| Loan Type FE      | Yes           |
| Loan Purpose FE   | Yes           |
| Year FE           | Yes           |
| Industry FE       | Yes           |
| Observations      | 12,275        |
| Adjusted R2       | 0.623         |

# Additional Analysis

## Other Forms of Uncertainty: Reporting

|                 | Spread                   | Spread        |
|-----------------|--------------------------|---------------|
| _Factor_        | _Discretionary Accruals_ | _Restatement_ |
| Reg.Peer×Factor | -8.457\*\*\*             | -11.263\*     |
|                 | $(-2.94)$                | $(-1.84)$     |
| Reg.Peer        | -7.556\*\*\*             | -10.188\*\*\* |
|                 | $(-3.44)$                | $(-4.05)$     |
| Factor          | 7.271\*\*\*              | 15.107\*\*\*  |
|                 | $(2.99)$                 | $(2.82)$      |
| Controls        | Yes                      | Yes           |
| Year FE         | Yes                      | Yes           |
| Industry FE     | Yes                      | Yes           |
| Observations    | 12,421                   | 12,955        |
| Adjusted R2     | 0.623                    | 0.621         |

## Other Forms of Uncertainty: Political, Economy

|                 | Spread                  | Spread                        |
|-----------------|-------------------------|-------------------------------|
| _Factor_        | _Political Uncertainty_ | _Economic Policy Uncertainty_ |
| Reg.Peer×Factor | -12.586\*\*             | -8.978\*\*                    |
|                 | $(-2.17)$               | $(-2.24)$                     |
| Reg Peer        | -11.119\*\*             | -7.733\*\*\*                  |
|                 | $(-2.42)$               | $(-2.65)$                     |
| Factor          | 13.823\*\*              | 9.067\*\*                     |
|                 | $(2.53)$                | $(2.12)$                      |
| Controls        | Yes                     | Yes                           |
| Year FE         | Yes                     | Yes                           |
| Industry FE     | Yes                     | Yes                           |
| Observations    | 7,734                   | 12,955                        |
| Adjusted R2     | 0.610                   | 0.621                         |

## Other contract terms:

|                 | Loan Size   | Maturity  | Collateral   | Lenders     |
|-----------------|-------------|-----------|--------------|-------------|
| Reg Peer        | 0.298\*\*\* | 0.889\*\* | -0.049\*\*\* | 1.527\*\*\* |
|                 | $(10.33)$   | $(2.27)$  | $(-4.23)$    | $(7.91)$    |
| Loan Type FE    | Yes         | Yes       | Yes          | Yes         |
| Loan Purpose FE | Yes         | Yes       | Yes          | Yes         |
| Year FE         | Yes         | Yes       | Yes          | Yes         |
| Industry FE     | Yes         | Yes       | Yes          | Yes         |
| Observations    | 12,955      | 12,955    | 12,955       | 12,955      |
| Adjusted R2     | 0.593       | 0.572     | 0.359        | 0.394       |

## Matching

|                      | Spread      | Spread      |
|----------------------|-------------|-------------|
| _Matching Proc._     | __PSM__     | __EB__      |
| High Regulatory Exp. | 9.086\*\*\* | 9.205\*\*\* |
|                      | $(3.12)$    | $(3.33)$    |
| Controls             | Yes         | Yes         |
| Year                 | Yes         | Yes         |
| Ind.                 | Yes         | Yes         |
| _N_                  | 13,882      | 30,011      |
| Adj. $R^2$           | 0.514       | 0.518       |





