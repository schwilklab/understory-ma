library(ggplot2)
library(metafor)
library(stringr)

RESULTS_DIR = "../results/plots/"
DATA_DIR = "../data/"

#files to exclude
EXCLUDES = c("f-richness.csv",  # only three papers, too few
             "g-richness.csv",  # too few papers
             "g-cover.csv",  # issue #7: zenner 2006 values make no sense
              "s-cover.csv",   # check zenner et al 2006 weird values
              "s-richness.csv"   # check, escalc failing on thin vs control
            )

#options(error = recover)

# run through a data file and create three forest plots for each and print
# confidence intervals to stdout


graphmaker <- function(x) {
     
    t <- read.csv(x, header = TRUE)

   bname <- strsplit(basename(x),".", fixed=TRUE)[[1]][1]
                                       
    print(paste("Running tests on", bname))
    
    # burn vs control
    dat <- escalc("SMD",  m1i=burn.mean, m2i=control.mean,
                  sd2i=control.s, sd1i=burn.s, n2i=control.n,
                  n1i=burn.n, data=t)
    res <- rma(yi, vi, data=dat)

    print(paste("burn vs control", bname))
    print(confint(res))

    pdf(paste(RESULTS_DIR, bname, "-burn-vs-control.pdf", sep=""))
        forest(res, slab=dat$Paper)
    dev.off()
    
    # thin vs control
    dat <- escalc("SMD", m1i=thin.mean, m2i=control.mean, 
                  sd1i=thin.s, sd2i=control.s, n1i=thin.n, n2i=control.n, data=t)
    res <- rma(yi, vi, data=dat)

    print(paste("thin vs control", bname))
    print(confint(res))

    pdf(paste(RESULTS_DIR, bname, "-thin-vs-control.pdf", sep="") )
    forest(res, slab=dat$Paper)
    dev.off()

    # thin vs burn
    dat <- escalc("SMD", m1i=burn.mean, m2i=thin.mean,
                  sd1i=burn.s, sd2i=thin.s, n1i=burn.n, n2i=thin.n, data=t)
    res <- rma(yi, vi, data=dat)
    
    print(paste("burn vs thin", bname))
    print(confint(res))
    
    pdf(paste(RESULTS_DIR, bname, "-burn-vs-thin.pdf", sep=""))
    forest(res, slab=dat$Paper)
    dev.off()
}


# makes a list of the files in your working directory
# the user needs to specify their directory path
varfiles <- list.files(DATA_DIR, pattern = "*.csv", full.names = TRUE)
varfiles <- varfiles[! basename(varfiles) %in% EXCLUDES]

# make graphs and results
lapply(varfiles,FUN=graphmaker)

