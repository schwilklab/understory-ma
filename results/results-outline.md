


Methods
=======
We conducted a meta-analysis using means and standard errors to calculate effect sizes.

For each response variable, we examine comparisons across three treatment pairs: burn versus control, thin vs control and thin vs burn. We calculated  standardized mean differences (Hedges’ adjusted g, Hedges and Olkin 1985) for each pair and tested if this differed from zero using a random effects model fit with restricted maximum likelihood (Borenstein et al. 2009, Viechtbauer, 2010, other citations?). We conducted all analyses in R (R Core Team 2013) using the metafor package (Viechtbauer 2010).

Results
=======

Summary of Results
------------------
Most understory variables did not vary among treatments. Of the differences that were significant, most tended to take place with regards to native and exotic plants.

###Summary of Species Richness Results:

The richness of exotic plants was significantly higher in thin treatments than in control and burn treatments.

###Summary of Percent Cover Results:

The cover of native plants was significantly higher in thin treatments than in control and burn treatments. The cover of exotic plants was  significantly higher in thin treatments than in control treatments. In addition, the cover of shrubs was significantly lower in burn treatments than in control treatments.


Test result details
-------------------

### Significant ###

#### Native.Cover ####

- Higher cover in thin than control treatments.
- Higher cover in thin than burn treatments.


#### Exotic.Richness ####

- Higher richness in thin than control treatments.
- Higher richness in thin than burn treatments.

#### Exotic.Cover ####

- Higher cover in thin than control treatments.

#### Shrub.Cover ####

- Lower cover in burn than control treatments.



### Non significant ###

#### Total.Richness ####

- burn vs control
- thin vs control
- thin vs burn
 
#### Native.Richness ####

- burn vs control
- thin vs control
- thin vs burn

#### Exotic.Richness ####

- burn vs control

#### S.Richness ####

- burn vs control
- thin vs control
- thin vs burn

#### G.Richness ####

- burn vs control
- thin vs control
- thin vs burn

#### F.Richness ####

- burn vs control
- thin vs control
- thin vs burn


#### Total.Cover ####

- burn vs control
- thin vs control
- thin vs burn


#### Native.Cover ####

- burn vs control

#### Exotic.Cover ####

- thin vs burn
- burn vs control

#### S.Cover ####

- thin vs control
- thin vs burn

#### G.Cover ####

- burn vs control
- thin vs control
- thin vs burn

#### F.Cover ####

- burn vs control
- thin vs control
- thin vs burn


Not Enough Papers:
----------------

#### G.Richness ####

- burn vs control
- thin vs control
- thin vs burn

#### F.Richness ####

- burn vs control
- thin vs control
- thin vs burn

#### F.Cover ####

- burn vs control
- thin vs control
- thin vs burn


###Nearly Significant Results:

- Richness or Cover: x vs y (left)
	- Indicates that there was lower richness or cover in x treatment than in y treatment.

- Total richness: thin vs control (right)
- Native richness: thin vs control (right)
- Total cover: burn vs control (left)
- Exotic cover: burn vs control (right)
- Exotic cover: thin vs burn (right)

References
----------

Hedges, L.V., Olkin, I., 1985. Statistical Methods for Meta-Analysis. Academic
  Press, New York.

R Core Team (2013). R: A language and environment for statistical computing. R
  Foundation for Statistical Computing, Vienna, Austria. URL
  http://www.R-project.org/.


Wolfgang Viechtbauer (2010). Conducting meta-analyses in R with the metafor
  package. Journal of Statistical Software, 36(3), 1-48. URL
  http://www.jstatsoft.org/v36/i03/.



Talk about how native and total are very similar

Talk about how native was used for total in many cases, when total was not reported