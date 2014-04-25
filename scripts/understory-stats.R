library(ggplot2)
library(metafor)
library(plyr) # for rbind.fill

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

# Create three forest plots for a file and save them, 
# confidence intervals to stdout
plotsAndConfint <- function(x) {
    t <- read.csv(x, header = TRUE)
    bname <- strsplit(basename(x),".", fixed=TRUE)[[1]][1]    
    print(paste("Running tests on", bname))
    
    # burn vs control
    dat <- escalc("SMD",  m1i=burn.mean, m2i=control.mean,
                  sd2i=control.s, sd1i=burn.s, n2i=control.n,
                  n1i=burn.n, data=t)
    res <- rma(yi, vi, data=dat)

    print(paste("burn vs control", bname))
    ci.bc <- data.frame(confint(res)[1])
    ci.bc$contrast <- "burn-control"
    ci.bc$measure <- row.names(ci.bc)

    pdf(paste(RESULTS_DIR, bname, "-burn-vs-control.pdf", sep=""))
        forest(res, slab=dat$Paper)
    dev.off()
    
    # thin vs control
    dat <- escalc("SMD", m1i=thin.mean, m2i=control.mean, 
                  sd1i=thin.s, sd2i=control.s, n1i=thin.n, n2i=control.n, data=t)
    res <- rma(yi, vi, data=dat)

    print(paste("thin vs control", bname))
    ci.tc <- data.frame(confint(res)[1])
    ci.tc$contrast = "thin-control"
    ci.tc$measure <- row.names(ci.tc)
    
    pdf(paste(RESULTS_DIR, bname, "-thin-vs-control.pdf", sep="") )
    forest(res, slab=dat$Paper)
    dev.off()

    # thin vs burn
    dat <- escalc("SMD", m1i=burn.mean, m2i=thin.mean,
                  sd1i=burn.s, sd2i=thin.s, n1i=burn.n, n2i=thin.n, data=t)
    res <- rma(yi, vi, data=dat)
    
    print(paste("burn vs thin", bname))
    ci.bt <- data.frame(confint(res)[1])
    ci.bt$contrast = "burn-thin"
    ci.bt$measure <- row.names(ci.bt)
    
    pdf(paste(RESULTS_DIR, bname, "-burn-vs-thin.pdf", sep=""))
    forest(res, slab=dat$Paper)
    dev.off()
    
    r.df <- rbind(ci.bc,ci.tc,ci.bt)
    r.df$var <- bname
    return(r.df)
}

# makes a list of the files in your working directory
# the user needs to specify their directory path
varfiles <- list.files(DATA_DIR, pattern = "*.csv", full.names = TRUE)
varfiles <- varfiles[! basename(varfiles) %in% EXCLUDES]

# make graphs and results
r.list <-  lapply(varfiles,FUN=plotsAndConfint)

# make big data frame of all confint results
conf.int.df <- rbind.fill(r.list)
write.csv(conf.int.df, "../results/confidence-intervals.csv", row.names=FALSE)
