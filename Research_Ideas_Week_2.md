# Research Ideas - Week 2
# May 15, 2025

------------------------------------------------------------------------------------------------------------------------------------
    "These ideas can be about how to extend the paper, how to test the paper, or how to apply the paper to a different context."
------------------------------------------------------------------------------------------------------------------------------------

# Comment about last week identification strategy
I reached a conclusion regarding what I though was off about the first stage with region-FE in Nakamura and Steinsson (2014). Although the military build-up can be considered exogenous to the conditions of each region's local economy, I claim that that is not the relevant exclusion condition for the constructed instrument. The instrument is the interaction of region fixed effect (slope) and military build-up. The threath for identification is as follows: These slopes are not pre-determined; they’re estimated using the full panel, after observing how each region responds across time. This means Regions that consistently received more spending will have higher estimated slopes, but why they received more spending may be non-random (perhaps the government learned over time which regions generate higher returns to military investment -better infrastructure, stronger political connections, more productive contractors, etc.-). In that case, the estimated slope is endogenously picking up economic characteristics of the region that also affect GDP growth! 
The violation to the exlusion restriction would be through the estimation of the slope (if you consider ex-ante exposition, no problem!), because these might be endogenously picking up economic characteristics of the region that also affect output. 

## Juan's thoughts.

Hi Bea,

I don't agree. I think there is an overemphasis in the empirical literature in economics that "ex-ante" exposure is equivalent to "exogenous exposure", but that is not correct. If the factors that determine endogenous exposure are persistent, then even if the shares are before the sample, they will be endogenous. A shift-share can have endogenous shares, as long as, from the perspective of a region in this case, the shocks are exogenous. That is the "exogenous shifter" perspective to identification on shift-share designs. Mathematically, you don't need in the exclusion restriction that the shares (here the sensitivities) and the error term are orthogonal. You need that the shares, times the shock, are orthogonal to the error term.

# (1) Do wealth effects in labor supply create an aditional challenge for the identification of the Phillips Curve? 
We studied two compeling arguments for the case of taking estimation of the slope of the Phillips Curve seriously. First, any shock to the Phillips curve will be offset by an increasingly commited monetary authority, which will generate an almost immediate reaction going in the other relationship as the one we want to predict (McLeay and Tenreyno, 2019). Second, inflation expectations where a -highly correlated with output/unemployment gap- ommited variable during the un-anchored policy regime (Nakamura et al, 2022). My research question is weather there exists another relevant ommited variable due to model specification or misspecification. 

If instead of assuming GHH preferences we assumed CES, we would observe that marginal cost deviations from trend are a combination of consumption and hours worked deviations from trend. Now, assume deviations in labor equalized deviations in output, but not consumption because there is trade. Then, not considering regional consumption in the regression for the regional Phillips curve would imply omitting a relevant variable. Like inflation expectations or cost-push shocks, a deviation of consumption from trend will translate to higher prices at any level of output/unemployment. However, in open economies its relationship with slackness is not easy to predict.  

What is interesing about considering the possibility of consumption being an omitted variable is that demand shocks might now violate the exclusion restriction! 

Most demand shocks the literature considers are assumed to instrument for ex-ante endogenous movements in demand to trace out the supply curve. But if we now consider that the demand shock also affects inflation directly, not throught demand but through consumption (in the error term), this violates the exclusion restriction for any instrument of the kind. 

Next steps: To make this idea viable, I would need to read a lot more on the literature, because I only know what I read for this class. This is very premature and only pointing to a direction I think might be interesting, but requieres -a lot- more thinking before formalizing an empirical strategy or a theoretical device to measure its relevance.

## Juan's thoughts.

Hi Bea,

Short comments given that we discussed in class at some length. I think in general any misspecification in which marginal costs are not just linear functions of output are a problem. Examples: wealth effects, capital, ...

Can you construct regional consumption measures that you can control for? Are wealth effects the most important among these channels that induce misspecification?


# (2) Monetary destruction or real destruction?
Motivated by Chodorow-Reich et al. (2020). The paper studies the 2016 Indian demonetization's differential effect across districts on relative output losses, claiming this is a mainly monetary shock. This allows for the general claim that this paper actually constitutes a large experiment for money non neutrality. I am concerned about how the motivation of the policy seems to undermine the notion of these being a purely monetary shock. First let us cover the basics, the district-level shock is defined as the ratio of post-demonization to pre-demonetization currency in an area. They show that these demonetization shocks occured essentially at random. Then, lets dive into the political context in which this policy was implemented. The reason for declaring high currency illegal was to push back informal and illegal economic activity. In fact, although the government gradually introduced replacement notes, in order to be elegible for changing their old-currency to new notes, households needed to present documentation validating the origin of the money. For this reason, I find it hard to believe that this shock is purely a monetary one, as I can imagine this having effects on the real economy. It for instance affects wealth, disproportionally more in those regions that -if we believe the government- were conducting illegal/informal activities. There, we see less people will have the conditions to transform their money -ever- into new notes. Regions with higher exposure to these activities might not have looked different in terms of economic performance than those less affected. What I am describing might be a challenge to the exogeneity of the shock but that is not my main point. Instead, I'm posing a concern of it being a representation of a purely monetary shock. In that sense, I call to question that the higher effects one sees in more exposed regions are due to monetary non-neutrality. They might be governed by higher wealth destruction in these regions, for instance, which I would call a real economy shock.

The informal sector is 81% of total employment and 44% of total output and is especially cash-intensive. This drives the authors to use employment and nightlight as proxies for economic activity rather than GDP. I would like to generate a measure of "informal output", capturing the share, fraction or differential economic activity over the formally measured one, at the district level and time-varying. With that, I would like to explore the parallel trend restriction in particular on the "informal output" measure. This can give an idea of the wealth shock story. 
If that exploration is relevant, I would like to continue further exploring how the policy reallocated economic activity. If districts with higher exposure to the shock were worst off -even temporally- this could have caused reallocation of factor of production (capital, labor, land use, etc) towards the formal economy. Can we see that in the data?

This idea is viable conditional on using the authors framework and data, which is made public after publication. 

 ## Juan's thoughts.
Hi Bea,

 I'm agnostic, but as usual, please prove me wrong. A couple of reasons. One is that night lights would capture informal output. Second, most cash got eventually replaced, so the purging of illegal activity was not very successful from my reading of the paper (not an expert). Third, I would be very agnostic that a transitory shock like this one would induce sectoral reallocations that seem to be so structural in a developing economy. I would be very happy if you can show me I'm wrong.
