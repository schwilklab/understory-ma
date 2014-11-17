understory-ma
=============

Metanalysis project effects of thinning and burning on understory vegetation

Authors: Josh Willms, Anne Bartuszevige, Dylan Schwilk, Pat Kennedy.


Data organization
-----------------

- Databases of searches, papers vetted and papers selected are all under ./database-searches
- Extracted data on treatments means, etc, are in files under ./data. There is one file per response variable
- Code to analyze these data are under ./scripts

Results
-------

Results are stored under ./results. Although a few files under this directory have been entered into version control for convenience, nothing should go under this folder that cannot be automatically recreated from raw data. In other words, this is where code in the ./scripts directory saves tables and figures.

Forest plots of effect sizes are produced by the R code (https://github.com/schwilklab/understory-ma/blob/master/scripts/understory-stats.R). Those plots are saved in [.results/plots] which is not under version control

A spreadsheet of the effect size confidence intervals is here: [../results/confidence-intervals.csv] on github:  https://github.com/schwilklab/understory-ma/blob/master/results/confidence-intervals.csv


Manuscript
----------

The manuscript is a markdown file for processing with [pandoc][pandoc]. The build system depends upon the Schwilk Lab [pandoc-build-system git repository][pbs] and Makefile currently assumes that a clone of that repo is found at ~/write/pandoc. Modify the PREFIX variable in the [makefile](ms/Makefile) to point to a different location of the build system.


To create .pdf, .docx and .html output documents, type "make" in the ms directory.

[pandoc]: http://johnmacfarlane.net/pandoc/
[pbs]: https://github.com/schwilklab/pandoc-build-system
