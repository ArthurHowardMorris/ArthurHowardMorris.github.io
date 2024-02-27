---
title: "Returns Before and After Taxes"
---

## 1. Effect of Organizational Form on Returns

|      |      Instrument     | Terminal Payoff               | Annualized Return             |
|------|:-------------------:|-------------------------------|-------------------------------|
| I.   |  Money Market Fund  | $[1+R(1-t)]^n$                | $R(1-t)$                      |
| II.  |         SPDA        | $[(1+R)^{n}(1-t)+t]$          | $[(1+R)^{n}(1-t)+t]^{1/n} -1$ |
| III. |     Mutual Fund     | $[1 + R(1 - g)]^n$            | $R(1 - g)$                    |
| IV.  | Foreign Corporation | $(1+R)^{n}(1-g)+g$            | $[(1+R)^{n}(1-g)+g]^{1/n} -1$ |
| V.   |   Insurance Policy  | $(1 + R)^n$                   | $R$                           |
| VI.  |       Pension       | $\frac{1}{1-t}(1+R)^{n}(1-t)$ | $R$                           |

Where:

- $R$ annual pre-tax return  
- $n$ investment horizon in years  
- $t$ tax rate on ordinary income  
- $g$ capital gains tax rate  

__Questions:__

- Which instrument(s) dominate?
- Why would anyone own a dominated instrument?

## 2. Comparing After-tax returns

### 2.1 Example: Pensions versus SPDA versus munis (municipal bonds)

Suppose munis yield 7%. The tax rate today is $t0 = 30\%$ and the tax rate in
the future is 40% (i.e., $t_1$, $t_2$, . . . , $t_n = 40\%$). How does
investing in munis compare with investing in a pension and investing in a
single premium deferred annuity when the before tax return on each of these
investments is 10%?

| $n$   | SPDA                                     | Pension                                     |
|-------|------------------------------------------|---------------------------------------------|
|       | $((1.1)^{n}(1 - 40\%) + 40\%)^{n/1} - 1$ | $(\frac{1}{1-30\%}1.1^{n}(1-40\%))^{1/n}-1$ | \hline
| 1     | 6.00%                                    | -5.71%                                      |
| 2     | 6.11%                                    | 1.84%                                       |
| 3     | 6.22%                                    | 4.49%                                       |
| 4     | 6.33%                                    | 5.84%                                       |
| 5     | 6.44%                                    | 6.66%                                       |
| 10    | 6.94%                                    | 8.32%                                       |
| 20    | 7.73%                                    | 9.16%                                       |
| 1,000 | 9.94%                                    | 9.98%                                       |

- At what investment horizon does the pension first dominate the tax exempt
  bond?
- When $n$ is very large, what do the annualized returns on the SPDA and
  pension tend to?
- Why does the pension dominate the muni at long horizons?
- Why does the pension dominate the SPDA when the investment horizon is 10 or
  more years?
- Why does the pension not always dominate the SPDA?
- Suppose that tax rates are constant over time. Then the after tax return on
  pensions always dominates the return on SPDAs. Why do SPDAs survive at all in
  the marketplace?  

### 2.2 Example: Changes in tax rates

Suppose an asset offers a pre-tax return of $R = 10\%$. From now (year 1) until
year $n - 1$, the tax rate is 30%. In year n and after, the tax rate is 40%
(i.e., $t_1$,$t_2$,...,$t_n-1 = 30\%$, and $t_n$ = 40%). How does investing in
a money market account compare with investing in a pension when all funds are
withdrawn in year $n$?

+---------------+---------------+--------------------+
| Fruit         | Price         | Advantages         |
+===============+===============+====================+
| Bananas       | $1.34         | - built-in wrapper |
|               |               | - bright color     |
+---------------+---------------+--------------------+
| Oranges       | $2.10         | - cures scurvy     |
|               |               | - tasty            |
+---------------+---------------+--------------------+

+-------+------------------------------------------+------------+-----------------------------------+------------+
| $n$   | Money Market                             |            | Pension                           |            |
+-------+------------------------------------------+------------+-----------------------------------+------------+
|       | After Tax                                | Annualized | After-Tax                         | Annualized |
|       | Terminal Value                           |  Return    | Terminal Value                    |  Return    |
+-------+------------------------------------------+------------+-----------------------------------+------------+
|       | _(per $ invested)_                       |            | _(per $ invested)_                |            |
+-------+------------------------------------------+------------+-----------------------------------+------------+
|       | $(1+10\%(1-30\%))^{n-1}\times$           |            | $\frac{1-40\%}{1-30\%}(1+10\%)^n$ |            |
|       |                       $(1+10\%(1-40\%))$ |            |                                   |            |
+=======+:========================================:+============+:=================================:+============+
| 1     | 1.06                                     | 6.00%      | 0.94                              | -5.71\%    |
+-------+------------------------------------------+------------+-----------------------------------+------------+
| 2     | 1.13                                     | 6.50%      | 1.04                              | 1.84%      |
+-------+------------------------------------------+------------+-----------------------------------+------------+
| 3     | 1.21                                     | 6.67%      | 1.14                              | 4.49%      |
+-------+------------------------------------------+------------+-----------------------------------+------------+
| 4     | 1.30                                     | 6.75%      | 1.25                              | 5.84%      |
+-------+------------------------------------------+------------+-----------------------------------+------------+
| 5     | 1.39                                     | 6.80%      | 1.38                              | 6.66%      |
+-------+------------------------------------------+------------+-----------------------------------+------------+
| 10    | 1.95                                     | 6.90%      | 2.22                              | 8.32%      |
+-------+------------------------------------------+------------+-----------------------------------+------------+
| 20    | 3.83                                     | 6.95%      | 5.77                              | 9.16%      |
+-------+------------------------------------------+------------+-----------------------------------+------------+
| 1,000 | 2.40E + 29                               | 7.00%      | 2.12E + 41                        | 9.98%      |
+-------+------------------------------------------+------------+-----------------------------------+------------+

- Why does the return on pensions in this example not differ from the return in
  the previous example?
- Does the return on the money market in this example differ from the return
  that would be computed assuming the tax rates in the previous section? Why?
- Does the annualized return offered on pension investments at long horizons
  depend on tax rates? If so, how?

### 2.3 Looking backwards can help us anticipate the future

The Tax Reform Act of 1986 (TRA86 for short) significantly changed individual
tax rates. The top tax rate for individuals was lowered from 50% to 28% while
the bottom rate was raised from 11% to 15%.  

- Were the retirement savings of people who were high-income earners in 1986
  favorably or unfavorably affected by this event? 
- Were the retirement savings—if they had any—of people who were low- income
  earners in 1986 favorably or unfavorably affected by this event?  

### 2.4 Roth IRA  

An interesting application of this logic to a new savings vehicle is presented
by the creation of the Roth IRA under the 1997 Taxpayer Relief Act. Several
limitations apply.[^ded]

Since the vehicle is intended to encourage saving only for certain purposes
(namely first time home purchase, retirement, disability, and providing for
family members or other beneficiaries following the death of the Roth IRA
holder) a ten percent penalty tax applies to withdrawals of earnings from the
plan that do not meet prescribed conditions. In contrast to other provisions in
the tax code, Roth IRA distributions are deemed to be contributions first.

Suppose your are saving for a purpose that is not approved, i.e., distributions
of earnings from the plan will be subject to the ten percent penalty tax. Can
it still be worthwhile to save through a Roth IRA? Suppose your marginal tax
rate is $t$ = 30% and you may invest in bonds that offer a pretax return of $R$
= 8%.

[^ded]: Contributions are not tax deductible. Individual and spousal
  contributions are capped at $2,000 annually. Eligibility is phased out for
  high income individuals.
