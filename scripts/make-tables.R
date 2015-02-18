#!/usr/bin/env Rscript

## Code to create different table options

## TODO: edit so it will work with new stats code and p value tables

# library(reshape2)
library(pander)
library(xtable)

###############################################################################
## TABLE 1 ####################################################################

conf.int.df <- read.csv("../results/confidence-intervals.csv", stringsAsFactors = FALSE)
table1.caption <- "Standardized mean differences (z-values) and lower and upper confidence intervals at $\\alpha = 0.1$."

## write table for manuscript.
melted <- reshape2::melt(conf.int.df)

## First style: separate cell for each value, this would work well for LaTeX
## output if I can create custom headers rows with multi column spans
tabledat <- reshape2::dcast(melted, var ~ contrast + variable)
names(tabledat) <- c("Response", "B-C zval" ,"B-C ci.lb",  "B-C ci.ub",  "B-T zval", "B-T ci.lb",   "B-T ci.ub" , "T-C zval", "T-C ci.lb", "T-C ci.ub") 
panderOptions("table.split.table", Inf)
zvals.table <- pandoc.table.return(tabledat, style="rmarkdown",
                                   digits=3, caption=table1.caption)
cat(zvals.table, file="../results/tables/zvals1")

latex.tab <- xtable(tabledat, caption=c("Contrast z-values"))
digits(latex.tab) <- c(0, 0, rep(2,9))
ltable = print(latex.tab, file="../results/tables/zvals.latex", # File is empty, post-processing needed
    include.rownames=FALSE,
    include.colnames=FALSE,
    only.contents=TRUE,
    type="latex",
    booktabs=TRUE,
    #      latex.environment="center", # Or NULL
    )

## For some reason, latex chokes when \midrule is in the input file
ltable = sub("\\midrule", "", ltable, fixed=TRUE)
ltable = sub("\\bottomrule", "", ltable, fixed=TRUE)

## to use this style, put the following in the md file:
table_str <- paste("\\begin{table}\n
\\caption{", table1.caption  ,"}\n
\\begin{tabular}{llllllllll}\n
  \\toprule\n
  & \\multicolumn{3}{c}{Burn vs Control} & \\multicolumn{3}{c}{Thin vs Control} & \\multicolumn{3}{c}{Burn vs Thin}\\\\ \n
  \\cmidrule(lr){2-4}  \\cmidrule(lr){5-7} \\cmidrule{8-10} \\\\ \n
  Response & z & lb & ub & z & lb & ub & z & lb & ub \\\\ \n
  \\midrule \n",
  ltable,
  "\\bottomrule \n
  \\end{tabular} \n
\\end{table}" )

write(table_str, "../results/tables/zvals.latex")


## Style #2
make.cistrings <- function(d) {
    row.names(d) <- NULL
    d$str <- sprintf("%.2f (%.2f, %.2f)",
                         d$zval,
                           d$ci.lb, d$ci.ub)
    d <- d[c(1, 5:6)]
    names(d) <- c("contrast", "variable", "z-value")
    return(d)
}

tabledat2 <- make.cistrings(conf.int.df)
tabledat2 <- reshape2::dcast(tabledat2,  variable  ~ contrast)
set.caption(table1.caption)
zvals.table2 <- pandoc.table.return(tabledat2, style="rmarkdown", digits=3)
cat(zvals.table2, file="../results/tables/zvals2")