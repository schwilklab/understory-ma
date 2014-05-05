Methods
=======
We conducted a formal [Josh: what do you mean by "formal"?]  meta-analysis using means and standard errors to calculate effect sizes.

For each response variable, we examine comparisons across three treatment pairs: (burn versus control, thin vs control and thin vs burn). We calculated  standardized mean differences (Hedges’ adjusted g, Hedges and Olkin 1985) for each pair and tested if this differed from zero using a random effects model fit with restricted maximum likelihood (Borenstein et al. 2009, Viechtbauer, 2010, other citations?). We conducted all analyses in R (R Core Team 2013) using the metafor package (Viechtbauer 2010).

Results
=======

Summary of Results
------------------
Most understory variables did not vary among treatments. Of the differences that were significant, most tended to be between thin and control groups for native species, thin and control groups for exotic species, and burn and control groups for exotic species.

Summary of Species Richness Results:
The richness of native and exotic plants was significantly higher in thin treatments than in control treatments. However, the richness of exotic plants was significantly lower in burn treatments than in control treatments.

Summary of Percent Cover Results:
The cover of native and exotic plants was significantly higher in thin treatments than in control treatments. The cover of native plants was also significanly higher in thin treatments than in burn treatments. However, the cover of exotic plants was significantly lower in burn treatments than in control treatments.

Test result details
-------------------

### Significant ###

#### Native.Richness ####

- Greater richness in thin than control treatments.
 
#### Exotic.Richness ####

- Greater richness in thin than control treatments.
- Lower richness in burn than control treatments.

#### Native.Cover ####

- Greater cover in thin than control treatments.
- Greater cover in thin than burn treatments.

#### Exotic.Cover ####

- Greater cover in thin than control treatments.
- Lower cover in burn than control treatments.

### Non significant ###

#### Total.Richness ####

- burn vs control
- thin vs control
- thin vs burn

#### Native.Richness ####

- burn vs control
- thin vs burn

#### Exotic.Richness ####

- thin vs burn

#### S.Richness ####

- burn vs control
- thin vs control
- thin vs burn

#### Total.Cover ####

- burn vs control (but almost)
- thin vs control
- thin vs burn

#### Native.Cover ####

- burn vs control

#### Exotic.Cover ####

- thin vs burn

#### G.Cover ####

- burn vs control
- thin vs control
- thin vs burn

#### F.Cover ####

- burn vs control
- thin vs control
- thin vs burn

#### S.Cover ####

- burn vs control (but almost)
- thin vs control
- thin vs burn

Not Enough Papers:
----------------

#### G.Richness ####

- burn vs control
- thin vs control (low number of papers)
- thin vs burn (low number of papers)

#### F.Richness ####

- burn vs control
- thin vs control
- thin vs burn (low number of papers)


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


