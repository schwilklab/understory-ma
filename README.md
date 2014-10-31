understory-ma
=============

Metanalysis project effects of thinning and burning on understory vegetation

Authors: Josh Willms, Anne Bartuszevige, Dylan Schwilk, Pat Kennedy.


Code and Results
----------------

Forest plots of effect sizes are produced by the R code (https://github.com/schwilklab/understory-ma/blob/master/scripts/understory-stats.R).  Those plots are saved in [.results/plots] which is not under version control

A spreadsheet of the confidence intervals is here: [../results/confidence-intervals.csv] on github:  https://github.com/schwilklab/understory-ma/blob/master/results/confidence-intervals.csv


Manuscript
----------

The manuscript is a markdown file for processing with [pandoc][pandoc]. The build system depends upon the Schwilk Lab [pandoc-build-system git repository][pbs] and Makefile currently assumes that a clone of that repo is found at ~/write/pandoc. Modify the PREFIX variable in the [makefile](ms/Makefile) to point to a different location of the build system.


To create .pdf, .docx and .html output documents, type "make" in the ms directory.

[pandoc]: http://johnmacfarlane.net/pandoc/
[pbs]: https://github.com/schwilklab/pandoc-build-system
