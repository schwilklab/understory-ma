library(ggplot2)
library(metafor)
library(plyr) # for rbind.fill
library(reshape2)

RESULTS_DIR = "../results/plots/"
DATA_DIR = "../data/response-vars/"

EXCLUDES = c("g-richness.csv"  # Only three lines for thin-control and only 2
                               # for others. Won't run at all
            )

# Run a single treatment comparison.  neds some tricky text parsing
runComparison <- function(data, t1, t2) {
    dat <- escalc("SMD",  m1i=eval(parse(text=paste(t1, ".mean",sep=""))),
                          m2i=eval(parse(text=paste(t2, ".mean", sep=""))),
                          sd1i=eval(parse(text=paste(t1, ".s", sep=""))),
                          sd2i=eval(parse(text=paste(t2, ".s", sep=""))),
                          n1i=eval(parse(text=paste(t1, ".n", sep=""))),
                          n2i=eval(parse(text=paste(t2, ".n", sep=""))),
                  data=data)

    returnNull <- function(err) NULL # we just need to skip any errors
    
    res <- tryCatch(rma(yi, vi, data=dat, level=90),
                      error = returnNull)
    
    return(res)
}

getZVals <- function(rma.res, t1, t2) {
    ci <- data.frame( contrast = paste(t1,"-", t2,sep=""),
                     zval = rma.res$zval, ci.lb = rma.res$ci.lb, ci.ub = rma.res$ci.ub)
    return(ci)
}


makePlotsGetZs <- function(data, resp.var, t1, t2) {
    r <- runComparison(data, t1, t2)
    if(is.null(r)) {
        return(NULL)
    }
    print(paste(t1, " vs ", t2, resp.var))
    pdf(paste(RESULTS_DIR, resp.var, paste("-", t1, "-vs-", t2, ".pdf", sep="")))
    forest(r, slab=data$Paper)
    dev.off()

    print(r)
    z <- getZVals(r, t1, t2)
    return(z)
}


# Create three forest plots for a file and save them, 
# confidence intervals to stdout
plotsAndConfint <- function(x) {
    df <- read.csv(x, header = TRUE)
    bname <- strsplit(basename(x),".", fixed=TRUE)[[1]][1]    
    print(paste("Running tests on", bname))
    
    # burn vs control  
    ci.bc <- makePlotsGetZs(df, bname, "burn", "control")
    # thin vs control
    ci.tc <- makePlotsGetZs(df, bname, "thin", "control")
    # thin vs burn
    ci.bt <- makePlotsGetZs(df, bname, "burn", "thin")
        
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
