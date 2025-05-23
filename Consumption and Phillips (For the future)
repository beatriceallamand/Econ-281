This is a document trying to pursue the idea in Research_Ideas_Week_2. I discovered it was hard to implement causally so I stopped pursuing it as for the Class Project. It is here just so I don't forget.

May 20, 2025

## Data
I can see how differently consumption per state and employment per state have changed over the years

SARPP Real personal income, real PCE -Personal Consumption Expenditures-, and regional price parities by state: downloaded as CSV file from 2008 to 2022

Personal Consumption Expenditures by State, 2023 https://www.bea.gov/news/2024/personal-consumption-expenditures-state-2023
How consumpton changes each year, by state

Can we compare with trend?
Feldman et al. (2016) "Estimates of the Output Gap at the State Level"
Crane et al. (2018) "An Evaluation of the Fed’s State-Level Output Gap Estimates"

These approaches often use:

BLS state-level employment, hours, and productivity
Capital stock proxies from investment series
Total factor productivity trends (TFP) by state (constructed)


## Positioning Statement
Are differences in consumption across space predictable by differences in output/production across space?
- Local consumers choose to consume from an aggregator of products produced in different regions, and choose to save in a capital aggregator supplying resources to firms in different regions. 
- Prices of consumption goods and interest rate of capital are such that the aggregate goods and capital markets clear
- If a shock increases employment differentially across space, there is reasons to believe consumption also varies across space, but are the two related?
- In a TANK model where one region has a higher share of HtM yes. An expansionary MP shock decreases interest rate so Ricardian agents consume more. This implies firms want to employ more workers, and since only Ricardian HH have elastic labor supply, wages increase for all workers by the amount predicted by the labor supply elasticity of Ricardian agents. The extra employment is 100% Ricardian agents, but all workers now recieve higher wage (including the HtM). The keynesian effect now comes, for Ricardian agents the increase in wage is temporal so they only consume a small fraction of it, but the HtM consume everything, so now firms want to produce more, again moving along the labor supply curve of Ricardians and increasing wages for everyone. Regions that had a higher fraction of HtM perceive a higher employment effect, but also a higher price effect (demand is higher so deviation from trend mc is higher). Inflation will respond differently in each region, the one with more HtM agents increases prices more, so some of its increase consumption will go to other regions. This implies other regions will receive a feedback into production -> mc -> prices too. Real wages and consumption increase in both regions, but more in the one with more HtM.
- Now think about an increase in employment in one region. It will cause higher income in the region but also higher mc for firms, so prices will also go up. This implies consumers will consume more foreign goods, causing the foreing region to also move along its labor supply curve increasing marginal cost, increasing prices there too.

Empirical strategies fail because I precisely want to show that employment and consumption are not 1 to 1. So that a shock to a location that increases employment will not only affect the region consumption through increased employment, also through increase employment in other locations, that demand goods from this region.

## Empirical strategy posibilities 
I want to get an exposure shifter in local employment to see the effect on local consumption, and show that they are not fully related!

🔹 1. Bartik (Shift-Share) Instrument
Idea: Use national industry-level employment growth, interacted with state pre-period industry shares.
Exogenous component: National trends in industry 
Heterogeneity: States differ in initial industry composition
Exclusion restriction: Assumes national industry shocks don’t directly affect local consumption other than through local employment.

FAILS exactly because we claim consumption in region i will react to the shock not only to employment in region i but to employment and consumption in other regions!


🔹 2. Exposure to Military Spending or Federal Procurement
Some states are more exposed to military contracts or federal infrastructure projects.
Shocks to national military/federal spending are plausibly exogenous.
Use lagged exposure × changes in national spending.
Used in Nakamura & Steinsson (2014) for fiscal stimulus.
Exclusion restriction: Federal money boosts employment, which boosts consumption — not consumption directly.

FAILS because of the same!

📦 What is RIMS II?
RIMS II provides Input-Output (I-O) multipliers at the county or multi-county level. These multipliers are based on the national I-O structure but adjusted to reflect the industrial composition of a specific region.

🔧 What does it do?
It lets you estimate how economic activity in one industry spills over into others within a region. This helps answer questions like:

How much of industry output is consumed locally vs exported to other regions?
What is the total economic impact (direct + indirect + induced) of a shock (like a plant opening)?
How interdependent are local industries?



## Other questions

Is consumption response to MP shocks predictable by employment effects? 
- Real measures of marginal costs

Part 2: "Sketch of model that connects micro data to macro outcome"

# Do wealth effects in labor supply create an aditional challenge for the identification of the Phillips Curve? 
Misspecification in which marginal costs are not just linear functions of output are a problem (wealth effects and capital). 

If instead of assuming GHH preferences we assumed CES, we would observe that marginal cost deviations from trend are a combination of consumption and hours worked deviations from trend. 
Now, assume deviations in labor equalized deviations in output (or are a linear function and therefore controlling for that closes the deal), but not consumption because there is trade across regions. 
Then, not considering regional consumption in the regression for the regional Phillips curve would imply omitting a relevant variable. Like inflation expectations or cost-push shocks, a deviation of consumption from trend will translate to higher prices at any level of output/unemployment. The mechanism being under wealth effects, marginal costs are higher (people need to be paid more to work an extra hour). 
If we cannot control for consumption at the local level, demand shocks might now violate the exclusion restriction. Consider that the demand shock also affects inflation directly, not throught demand but through consumption (in the error term), this violates the exclusion restriction for any instrument of the kind. 

Can you construct regional consumption measures that you can control for? Are wealth effects the most important among these channels that induce misspecification?

Only consumption at the annual level 
🔴 Official State-Level Consumption (PCE)
Published by: BEA
Frequency: Annual only
Years available: 1997–present
Link: BEA PCE by State
Details: Nominal and real PCE, by category (e.g., durable goods, services)
Limitation: Not available quarterly/monthly.


