The Effects of Thinning and Burning on Understory Vegetation in North America: A Meta-Analysis
==============================================================================================

Joshua Willms (a)(b), Anne Bartuszevige (c), Dylan Schwilk (a), Pat Kennedy (d)(e)

a Texas Tech University, Department of Biological Science, Box 43131, Lubbock, TX 79409. J.willms@ttuhsc.edu

b Coresponding author: P: 505-412-7111, E: j.willms@ttuhsc.edu

c Eastern Oregon Agricultural Research Center, Union Station, Union, OR 97883. Pat.kennedy@oregonstate.edu

d Current address: Playa Lakes Joint Venture, Lafayette, CO 80026. Anne.bartuszevige@pljv.org

e Corresponding author: 2575 Park Lane, Suite 110, Lafayette, CO 80026. P: 303-926-0777, F: 303-926-8102, E: anne.bartuszevige@pljv.org


Abstract
--------

We conducted a meta-analysis to determine the big-picture effects of fire and fire-surrogates on understory vegetation in North America. Means and standard errors were extracted from papers containing data on the response of understory species to thinning and burning treatments to calculate effect sizes. For each response variable, we examine comparisons across three treatment pairs: burn versus control, thin vs control and thin vs burn. We calculated  standardized mean differences (Hedges’ adjusted g, Hedges and Olkin 1985) for each pair and tested if this differed from zero using a random effects model fit with restricted maximum likelihood (Borenstein et al. 2009, Viechtbauer, 2010, other citations?). We conducted all analyses in R (R Core Team 2013) using the metafor package (Viechtbauer 2010). We found that most understory variables did not vary among treatments. Of the differences that were significant, most tended to be due to the effects of thinning and burning on native and exotic species. Specifically, the richness of exotic plants was significantly higher in thin treatments than in both control and burn treatments. In addition, the cover of native plants was significantly higher in thin treatments than in control and burn treatments. The cover of exotic plants was  also significantly higher in thin treatments than in control treatments. The only subgroup that displayed significant results outside of the native and exotic categories was the percent cover of shrubs after burning. Shrubs showed a significant decrease in percent cover after fire compared to the control (Table 3). We conclude that fire and fire-surrogates tend to have a slightly positive impact on native and exotic species richness and cover. There was insufficient data published on forbs, graminoids, and shrubs to provide insight into specific species, meaning that studies directed towards these species are necessary.

Introduction
------------

Most North American forest plant species evolved under the influence of fire and, consequently, many ecological processes in these forests are fire-adapted. However, for much of the 20th century, land managers concentrated on minimizing the amount of land that burned. Compared to presettlement fire regimes in many contemporary forests, fire intervals have greatly lengthened. Increased recognition of the central role of fire in maintaining forest structure and function has contributed to a shift from fire exclusion to the reintroduction of fire in fire-dependent forests. This recognition has prompted federal initiatives such as the National Fire Plan and Healthy Forest Restoration Act (2003) that mandate federal land managers to restore forest structure and function and reduce risk of wildfire on federal lands (Graham et al., 2004; Schoennagel et al., 2004). It is now widely accepted that the return of fire to dry forests restores ecological processes, creates ecologically valuable early successional habitats, and is consistent with management objectives aimed at maintenance of biodiversity and decreased risk of landscape-scale wildfires (Brawn et al., 2001; Fulé et al., 2004). However, how and if the process of fire is reintroduced is less certain, particularly since fire-suppressed forests have developed dramatically different structures than when fire was more frequent (Covington and Moore 1994, Van Lear et al., 2005). Thus, fire managers may employ mechanical thinning techniques which yield a more predictable result. 

However, the extent to which thinning approximates the effects of prescribed fire responses in forested ecosystems is not well understood. Fire is a unique ecosystem disturbance that restructures habitat and soils that many plants depend on for germination and growth (Boerner et al., 2006; Bond and van Wilgen, 1996; Lione, 2002; Whigham 2004; Gundale et al., 2005, 2006). Thinning may approximate fire for certain ecosystem attributes.

Thinning is a disturbance that removes vegetation from the forest instead of consuming vegetation. The result of removing vegetation is that unless the slash is left on site, the nutrients stored in the vegetation are lost from the system. As a result, influxes of nutrients in thinned forests may be lower and different in composition than in burned forests. In a loblolly/short leaf pine forest, thinning increased Potassium and Magnesium, whereas fire decreased Carbon and Nitrogen in the Organic horizon; both treatments increased soil pH (Lione, 2002). In a mixed oak forest, thinning reduced soil Carbon in the first year post-treatment in contrast to burned areas in which a reduction in soil Carbon was not detected for several years post-treatment (Boerner et al., 2006). However like burning, thinning increases bare mineral soil (Boerner et al., 2007). By thinning the canopy, light is increased at the forest floor, which can increase surface temperatures. The additional bare mineral soil and light can provide areas for seeds to germinate and establish as seedlings; however, this effect may be true only if slash is removed. 

Early forest management emphasized recruiting trees for commercial harvest. However, in the last half of the 20th century, forest management practices have shifted focus to manage for ecosystem properties, including biodiversity, not just for high quality timber. In most forests, the majority of plant biodiversity is found in the understory herbaceous layer (Gilliam 2007). In addition to harboring high diversity, understory herbaceous communities have profound effects on forest nutrient cycling (reviewed by Gilliam, 2007).

### Objectives ###

Our objective was to complete a literature review of those studies that investigated effects of thin and burn treatments on understory herbaceous species. Specifically we are interested in the degree to which thin and burn treatments mimic prescribed burn treatments and control or no treatment patches. We ask the following questions:

1. Do thin and thin and burn treatments have similar percent cover of native species, exotic species, graminoids, forbs, and shrubs compared to prescribed burn and control treatments? 
2. Do thin and thin and burn treatments have similar species richness of native species, exotic species, graminoids, forbs, and shrubs compared to prescribed burn and control treatments?

We hypothesize that thin and burn treatments have higher percent cover and species richness of native species, graminoids, forbs and shrubs compared to control and lower percent cover and species richness of exotic species compared to control. We hypothesize that thin and burn treatments have the same percent cover and species richness of native species, graminoids, forbs and shrubs compared to prescribed burn treatments and lower percent cover and species richness compared to prescribed fire.



Methods
-------

### Literature Search and Vetting ###

In December 2007, July 2008, and December 2011 we performed a search of the scientific literature investigating prescribed fire and thinning treatments. Table 1 provides a detailed list of the keywords used in the literature search. We used three databases: Web of Science and AGRICOLA both of which searched literature published since 1970 and Forest Science which searched literature published since 1939. In addition to those two search engines, we included additional references gleaned from publications found in the literature search and from a recent U.S. Department of Agriculture / U.S. Department of Interior Joint Fire Sciences Rainbow Series document on the effects of fire on invasive plant species (Zouhar et al., 2008). The literature search from the databases yielded approximately 3,000 references which were then vetted for appropriate material. Documents were eliminated that dealt with medical issues (i.e. new treatments for burn victims), investigations of ecological processes related to fire but not relevant to the scope of this document (i.e. nutrient cycling, insect infestation, etc.), or modeling studies with little empirical data. 

We were specifically interested in studies that were experimental in nature and that collected quantitative data on the response of understory herbaceous plants to a prescribed fire or thinning treatment. We further narrowed our search to papers that specifically addressed thinning (understory or overstory) and prescribed fire. We excluded papers that dealt exclusively with prescribed fire or wildfire because we thought these topics were sufficiently addressed in the two rainbow series documents (Brown and Smith, 2000, Zouhar et al., 2008). We encourage those who are interested in fire effects on flora to explore these documents. This vetting process yielded the 24 references included in this document. 

In January and February 2014 we performed a second search of the scientific literature to increase our sample size and include data published after 2013. Table 2 provides a detailed list of the keywords used in this literature search. We used the Google Scholar and Mendeley search engines to find papers published after the original search. The second literature search yielded approximately 250 references which were then vetted for appropriate material. Documents were eliminated that dealt with medical issues (i.e. new treatments for burn victims), investigations of ecological processes related to fire but not relevant to the scope of this document (i.e. nutrient cycling, insect infestation, etc.), or modeling studies with little empirical data. This vetting process yielded an additional 10 references, for a total of 34 references.

A final search was performed in May of 2014 utilizing the original search methodology to include papers published in 2014 (Table 1). This final search yielded 1 additional reference, for a total of 35 references.

Because statistical reporting was not uniform across references, we performed a second round of vetting to exclude papers that could not be compared to the others statistically. Papers that reported chi square tests, standardized mean differences, and ones that failed to include standard errors were excluded. In addition, studies which reported data that was collected 20 or more years after the thinning or burning event were excluded. Papers from geographical locations outside of North America were also excluded. After the final vetting, a final total of 22 references remained.

### Data Extraction and Analysis ###

The selected papers were entered into a database. Information was collected on the location of the study, the forest type and age, treatment type, intensity of the treatment, sampling method, and the response. We performed a meta-analysis using means and standard deviations to calculate effect sizes. All hypotheses were a priori, thus no adjustments for multiple comparisons were made. Because we were making one-tail comparisons, we used $\alpha = 0.10$.

A handful of compromises and assumptions were necessary to reconcile each reference into a single, comparable format. When papers reported mean species richness or percent cover values and standard errors for multiple years per treatment, the mean of these means and standard errors was taken to generate a single representative value. This methodology was utilized when extracting data from Metlen & Fiedler (2006), Phillips & Waldrop (2008), Laughlin et al. (2008), Mason et al. (2009), Waldrop et al. (2008), and Zald et al. (2008). All other sources reported data for a single year.

Because native species represented over 99% of species richness and percent cover for papers in which both parameters were reported on, 'total' and 'native' species were used interchangeably for papers in which only one or the other was reported (Metlen & Fiedler 2006, Nelson et al. 2008, Kerns et al. 2006). 'Native' was used for 'total' in Dodson et al. (2007), Collins et al. (2007), and Huffman et al. (2013). 'Total' was used for 'native' in Youngblood et al. (2006), Wolk & Rocca (2009), Phillips & Waldrop (2008), Fule et al. (2007), Laughlin et al. (2008), Mason et al. (2009), Zenner et al. (2006), Waldrop et al. (2008), Stoddard et al. (2001), Shive et al. (2013), and Scudieri et al. (2010). 

Papers with a wide degree of sampling methodologies and time-lines were included. The length of time from treatment to sampling ranged from 1 to 13 years. The mean length of time from treatment to sampling was 4 years, and only two papers reported data that was collected more than 9 years after treatment. Varying levels of prescribed burn severity were inherent due to differences in species composition, terrain, weather, and season. For studies which reported data for multiple levels of burning severity, the moderate level of burning was selected for inclusion in this analysis. Varying forms of mastication were utilized for thinning treatments as well: These included, chainsaw, dragging a chain between tractors, hand-thinning, thin-and-pile, thin-and-burn, thin-and-scatter, thin-only, thin-and-chip, partial-cut, and clear-cut. For each paper, data was selected that was close to thin-only as possible.


Results
-------

Thin and burn treatments were applied with the intent of mimicking outcomes of prescribed fire treatments. In addition, it was assumed that thin and burn treatments would have outcomes that were different from control or no treatment groups. In particular, treatments were assumed to increase species richness and percent cover of native species and decrease species richness and percent cover of exotic species. In general, however, our hypotheses were not accepted. A summary of the significant findings can be found in Table 3.

#### Species Richness ####

There was a significant increase in exotic species richness between thin and control treatments. There was also a significant increase in exotic species richness between thin and burn treatments. There was no significant difference in exotic species richness between burn and control treatments.

There was so significant difference in species richness for the total number of species, native species, forbs, graminoids, or shrubs between burn and control treatments, thin and control treatments, or thin and burn treatments.

#### Percent Cover ####

There was a significant increase in native species percent cover between thin and control treatments. There was also a significant increase in native species percent cover between thin and burn treatments. There was no significant difference in native species percent cover between burn and control treatments.

There was a significant increase in exotic species percent cover between thin and control treatments. There was no significant difference in exotic species percent cover between thin and burn treatments, or between burn and control treatments.

There was a significant decrease in shrub species percent cover between thin and control treatments. There was no significant difference in shrub percent cover between thin and burn treatments, or between burn and control treatments. Shrubs were the only species to experience a significant decrease in species percent cover after any form of treatment.



### Table 3: Standardized Mean Difference Summary Table for Significant Findings ###

|      Experimental Parameter      	| Number of Papers 	| Standardized Mean Difference 	| C.I. Low 	| C.I. High 	|
|:--------------------------------:	|:----------------:	|:----------------------------:	|----------	|-----------	|
|   Native Cover: Thin vs Control  	|         5        	|             0.58             	| 0.00     	| 1.15      	|
|    Native Cover: Thin vs Burn    	|         4        	|             1.44             	| 0.13     	| 2.75      	|
| Exotic Richness: Burn vs Control 	|         6        	|             1.06             	| 0.22     	| 1.89      	|
| Exotic Richness: Thin vs Control 	|         6        	|             1.37             	| 0.82     	| 1.92      	|
|   Exotic Cover: Thin vs Control  	|         4        	|             0.44             	| 0.00     	| 0.88      	|
|   Shrub Cover: Burn vs Control   	|         7        	|             -0.59            	| -1.14    	| -0.05     	|



There was not a sufficient number of papers that reported data on forb richness, forb cover, or graminoid richness for burn vs control, thin vs control, or thin vs control groups. Because of this, further study on the effects of burning and thinning on forb richness, forb cover, and graminoid richness are needed for analysis to take place.


Discussion
----------

In general, understory plant species did not respond as predicted to fire surrogate treatments. Total percent cover and species richness was not significantly effected by either thinning or burning treatments. However, exotic species did respond positively, both percent cover and species richness, to disturbance treatments, as expected. Native species also responded positively with regards to percent cover after thinning treatments. Shrubs were the only species to respond negatively to any treatment method (specifically to burning).

In addition to the significant findings reported above, there were also a handful of results that were nearly significant, and could be analyzed in the near future after additional data has been collected. Total species richness was extremely close to increasing significantly after thinning (Figure 1). Total species percent cover was also extremely close to decreasing significantly in response to fire. Native richness in response to thinning and exotic percent cover in response to burning were also extremely close to significantly increasing.
 
Increase of exotic species due to disturbance is well established (CITATIONS) as is the intensity of disturbance and amount of increase (Bartuszevige and Kennedy 2009, Schwilk et al. 2009, OTHER CITATIONS). One concern of manipulating systems for conservation outcomes (e.g. fire surrogate treatments) is the risk of increasing the amount of exotic species. This is especially true when large-scale manipulations are applied such as in national forests for which follow-up treatment may be unfeasible. Although increases in these studies were not large, they could be biologically significant if they were allowed to increase in forest understory or if they were introduced after the treatment application. However, some forest stands may be at greater risk for establishment of exotic species. For example, exotic species are less likely to establish in the interior of forests, and more likely to establish in areas near other large invasions and human establishments (CITATIONS, Bartuszevige et al. 2006). Thus, an important consideration for treatment application is proximity to the wildland urban interface (WUI). 

To prevent the spread of exotic plants into forest ecosystems after treatment, managers should consider several management options including: no treatment, pre-treatment of exotic plants to reduce their abundance prior to treatment, seeding with native plants (Korb et al., 2004), reducing grazing by domestic livestock prior to and immediately after treatment (Keeley, 2006), or conducting a low impact disturbance (e.g. thinning only; Dodson and Fiedler, 2006; Laughlin et al. 2008). Thinning treatments in particular can be modified to reduce soil disturbance (which facilitates invasion of exotic plants). Also, thinning in winter months when equipment will drive over snow will also minimize soil disturbance and thus, the probability of invasion (Gundale et al., 2005).

Forbs increased in species richness in thin treatments, but did not increase in percent cover. Forbs may be in the seed bank and increase when competition by graminoids in reduced. Is this true in grassland studies? Do forbs increase in richness? How long (years) do forbs stay increased in richness? Why not cover? Is there evidence from prairie studies about this? Is this a structure thing? Forbs are generally growing tall and straight and not growing out like grasses? Is this a scale thing – look at Dodson 2010.
 
In general, thin and burn treatments did not have negative effects on understory plants. In fact, in the studies included in the analysis most either detected no difference or an increased response by understory species. Thus, thin and thin treatments may be used to thin dry forests with little concern for losing understory diversity; however, care should be taken in not increase exotic species. However, there are some logistical considerations worthy of discussion such as timing and intensity of treatments, spatial scale and human socio-economic concerns. 

Many of the studies included in this review concluded that multiple entries into a forest are needed to properly restore the understory to the historical range of variation (Harrington and Edwards, 1999; Metlen and Fiedler, 2006; Laughlin et al., 2008; Waldrop et al., 2008). Few studies have followed systems over multiple entries; however, Laughlin et al. (2008) followed a restoration for over a decade after multiple entries. In this system, there was an immediate positive response to herbaceous production. However, differences in species richness took much longer to occur; species richness was higher in treated areas compared to controls after 11 years. The results from this long-term study indicate that restoration of the understory to historical variability is a long-term process involving repeated prescribed burns. The Laughlin et al. (2008) data also provide another important lesson: active fire suppression has occurred for most of the last century and restoration management of the forests is a relatively new occurrence, therefore, it may take multiple treatments to restore a forest. In addition, it may take many years before the effects of the treatments are fully realized.

While it may take many years for the effects of restoration treatments to become fully realized, the results also depend on the pretreatment condition of the area (Dodson et al., 2008). Dodson et al. (2008) found that treatments did affect understory plant response but the degree of the response was dependent on the pre-treatment condition of the forest such that greater responses were observed in treatment plots with lower initial values. One reason Dodson et al. (2008) were able to document this affect was the Before-After-Control-Impact design of the FFS study. Instead of only collecting data in an unmanipulated “control” plot, pretreatment data were also collected. This is a powerful experimental design that should be encouraged in future investigations of forest restoration.

Dodson et al. (2010) investigated potential differences in treatment effect at multiple spatial scales. They found that treatment did not significantly affect species richness at the smaller quadrat scale (alpha diversity) but diversity at the unit scale was significantly increased. Thus, effects of forest treatments may not be evident at the scale at which most monitoring is conducted (1m2) but overall impacts may be evident at the forest level. The studies included in this review typically measured results at smaller spatial scales (1-400m2) and evaluated alpha diversity (diversity at the quadrat scale). However, additional analysis to investigate beta diversity (diversity across scales) may reveal more consistent patterns and may shed light on large-scale impacts of fire and fire surrogate treatments on understory plant communities. 

Finally human socio-economic factors are often considered when determining application of treatments. Exotic plants are also associated with the wildland urban interface (WUI) because many exotics are used in landscape and horticultural plantings. Although the Healthy Forest Restoration Act (2003) mandates that most of the forest restoration occurs at the WUI, it is important to recognize that these areas serve as foci for exotic spread into the forest matrix (Bartuszevige et al., 2006). Invasion of the forest by exotic plants works against the prescribed goals of forest management to reduce wildfire risk and increase native biodiversity. Some exotic plants can change the fire interval or intensity through a variety of mechanisms such as increasing fuel loads or moisture content of the fuel (Brooks et al., 2004). In addition, exotic plants can reduce biodiversity by becoming the dominant species in the forest understory. 

Exotic plants were recorded in most studies we presented, but were often at a low density or cover, even post-treatment. Regardless, it is important to understand the potential threat of these species to native understory species in forested landscapes. The management tools used in many of the reviewed studies were successful at increasing understory diversity and richness of both native and exotic species. In general, prescribed fire and thinning treatments can be used successfully to restore understory community composition, but managers would be wise to take into consideration the presence and potential impacts of exotic plants. 


Acknowledgments
---------------

We thank the Joint Fire Science Program for funding. Jim McIver helped conceptualize the final product and provided us with all of the available Fire and Fire Surrogate Program information. We thank John Cissel, Colette Coiner, Tim Swedberg, Kim Verhelst and Becky Jenison for administrative support. We would like to thank a number of people who participated in the development of the original review document from which this document is derived. They were: Jim Gallagher, Robert Means, Kenneth Outcalt, Dana Perkins, Roger Rosentreter, and Steve Sutherland. John Bailey, Carl Fiedler, Joe Fontaine, David Hibbs and Dana Perkins reviewed the original review document. This is contribution number XX of the National Fire and Fire Surrogate Project (FFS), funded by the U.S. Joint Fire Science Program. 



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


Appendix
----------




### Paper Summary Table ###

| Author               | Year | Journal                           | Location                                                                                                                                                | Measurements                    | New | Used |
|----------------------|------|-----------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------|-----|------|
| Adel et al.          | 2012 | Forestry Studies in China         | Northern Iran                                                                                                                                           | Percent Cover                   | New | No   |
| Ares et al.          | 2010 | Forest Ecology and Management     | Keel Mountain, O.M. Hubbard, and Bottom-line sites in the western Oregon Cascades and Coast Range, Oregon                                               | Percent Cover, Species Richness | New | No   |
| Burton et al.        | 2011 | Plant Ecology                     | Okmulgee Game Management Area, Oklahoma                                                                                                                 | Percent Cover, Species Richness | New | No   |
| Busse et al.         | 2000 | Forest Science                    | Fremont National Forest, Oregon                                                                                                                         | Percent Cover, Species Richness | Old | No   |
| Collins et al.       | 2007 | Forest Ecology & Management       | Blodgett Forest Research Station, California                                                                                                            | Percent Cover, Species Richness | Old | Yes  |
| Dodson et al.        | 2007 | Restoration Ecology               | Lubrecht Experimental Forest, Montana                                                                                                                   | Percent Cover, Species Richness | Old | Yes  |
| Dodson et al.        | 2008 | Forest Ecology & Management       | Okanogan-Wenatchee National Forest, Washington                                                                                                          | Percent Cover, Species Richness | Old | No   |
| Dodson, Peterson     | 2010 | Forest Ecology & Management       | Okanogan-Wenatchee National Forest, Washington                                                                                                          | Percent Cover                   | Old | No   |
| Freeman et al.       | 2007 | Ecological Applications           | Coronado NF, Arizona; Deschutes NF, Oregon; Bandelier NM, New Mexico; Pike, San Isabel NF, Colorado; Wenatchee NF, Washington; El Dorado NF, California | Percent Cover, Species Richness | New | Yes  |
| Fulé et al.          | 2002 | Forest Ecology & Management       | Kaibab National Forest, Arizona                                                                                                                         | Species Richness                | Old | Yes  |
| Griffis et al.       | 2001 | Forest Ecology & Management       | Coconino National Forest, Arizona                                                                                                                       | Species Richness                | Old | No   |
| Harrington, Edwards  | 1999 | Canadian Journal of Forestry      | Savannah River Site, South Carolina                                                                                                                     | Percent Cover, Species Richness | Old | No   |
| Harrod et al.        | 2008 | Northwest Science                 | Okanogan-Wenatchee National Forest, Washington                                                                                                          | Percent Cover                   | Old | No   |
| Huffman et al.       | 2013 | Forest Ecology and Management     | Kaibab NF, Arizona                                                                                                                                      | Percent Cover, Species Richness | New | Yes  |
| Kane et al.          | 2010 | Applied Vegetation Science        | Challenge Experimental Forest, California                                                                                                               | Percent Cover, Species Richness | Old | Yes  |
| Kerns et al.         | 2006 | Ecoscience                        | Malheur NF, Oregon                                                                                                                                      | Percent Cover, Species Richness | New | Yes  |
| Laughlin et al.      | 2008 | Plant Ecology                     | Coconino National Forest, Arizona                                                                                                                       | Species Richness                | Old | Yes  |
| Mason et al.         | 2009 | Forest Ecology & Management       | Lincoln National Forest, New Mexico                                                                                                                     | Percent Cover                   | Old | Yes  |
| Metlen et al.        | 2004 | Northwest Science                 | Hungry Bob Study Area, Oregon                                                                                                                           | Percent Cover                   | Old | No   |
| Metlen, Fiedler      | 2006 | Forest Ecology & Management       | Lubrecht Experimental Forest, Montana                                                                                                                   | Percent Cover, Species Richness | Old | Yes  |
| Nelson et al.        | 2008 | Ecological Applications           | Colville, Okanogan, Wenatchee National Forests, Washington                                                                                              | Percent Cover                   | Old | Yes  |
| Phillips, Waldrop    | 2008 | Forest Ecology & Management       | Clemson Experimental Forest, South Carolina                                                                                                             | Percent Cover                   | Old | Yes  |
| Provencher, Thompson | 2014 | Rangeland Ecology Management      | Eastern Nevada                                                                                                                                          | Percent Cover                   | New | Yes  |
| Scudieri et al.      | 2010 | Forest Ecology & Management       | Fort Valley EF and Long Valley EF in Coconino NF, Arizona                                                                                               | Percent Cover, Species Richness | New | Yes  |
| Shive et al.         | 2013 | Applied Vegetation Science        | Apache-Sitgreaves NF, Arizona                                                                                                                           | Percent Cover, Species Richness | New | Yes  |
| Shive, Sieg, Fule    | 2013 | Forest Ecology & Management       | White Mountain Apache Tribal lands, Arizona                                                                                                             | Percent Cover, Species Richness | New | No   |
| Stoddard et al.      | 2011 | Western North American Naturalist | Fort Valley EF in Coconino NF, Arizona                                                                                                                  | Percent Cover, Species Richness | New | Yes  |
| Waldrop et al.       | 2008 | Forest Ecology & Management       | Green River Site, North Carolina and Ohio Hills, Ohio                                                                                                   | Percent Cover                   | Old | Yes  |
| Wayman, North        | 2007 | Forest Ecology & Management       | Teakettle Experimental Forest, California                                                                                                               | Percent Cover                   | Old | No   |
| Wienk et al.         | 2004 | Forest Ecology & Management       | Badger Game Production Area, South Dakota                                                                                                               | Species Richness                | Old | No   |
| Wolk, Rocca          | 2009 | Forest Ecology & Management       | Heil Valley Ranch, Colorado                                                                                                                             | Percent Cover, Species Richness | Old | Yes  |
| Youngblood et al.    | 2006 | Forest Ecology & Management       | Blue Mountains, Oregon                                                                                                                                  | Percent Cover                   | Old | Yes  |
| Zald et al.          | 2008 | Forest Ecology & Management       | Teakettle Experimental Forest, California                                                                                                               | Percent Cover                   | Old | Yes  |
| Zenner et al.        | 2006 | Forest Ecology & Management       | Missouri                                                                                                                                                | Percent Cover, Species Richness | Old | Yes  |
| Zhang et al.         | 2008 | Canadian Journal of Forestry      | Blacks Mountain Experimental Forest, California                                                                                                         | Percent Cover                   | Old | Yes  |

