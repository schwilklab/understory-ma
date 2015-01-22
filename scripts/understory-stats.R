library(ggplot2)
library(metafor)
#library(plyr) # for rbind.fill
options(na.action = "na.omit")

RESULTS_DIR = "../results/plots/"
DATA_DIR = "../data/response-vars/"

# no need to look at graminoids and forbs separately now
EXCLUDES = c("g-richness.csv", "g-cover.csv", "f-richness.csv", "f-cover.csv" )


# read in table of papers
papers <- read.csv("../data/papers.csv", stringsAsFactors=FALSE)
papers$FireIntensity <- factor(papers$FireIntensity)
papers$FuelType <- factor(papers$FuelType)

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
    
    res <- tryCatch(rma(yi, vi, mods = ~ FuelType + Long, data=dat, level=90),
                      error = function(cond) {
                          message("RMA failed")
                          return(NULL)
                      }
                          )
    
    return(res)
}

getZVals <- function(rma.res, t1, t2) {
    ci <- data.frame( contrast = paste(t1,"-", t2,sep=""),
                     param = rownames(rma.res$b), b = rma.res$b,
                     zval = rma.res$zval, pval = rma.res$pval,
                     ci.lb = rma.res$ci.lb, ci.ub = rma.res$ci.ub)
    return(ci)
}


makePlotsGetZs <- function(data, resp.var, t1, t2) {
    r <- runComparison(data, t1, t2)
    if(is.null(r)) {
        return(NULL)
    }
    print(paste(t1, " vs ", t2, resp.var))
    pdf(paste(RESULTS_DIR, resp.var, paste("-", t1, "-vs-", t2, ".pdf", sep="")))
    forest(r, slab=data$FormattedName, addfit=FALSE)
    dev.off()

    print(r)
    z <- getZVals(r, t1, t2)
    return(z)
}


# Create three forest plots for a file and save them, 
# confidence intervals to stdout
plotsAndConfint <- function(x) {
    df <- read.csv(x, header = TRUE)
    df <- merge(df, papers, all.x=TRUE)
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
conf.int.df <- plyr::rbind.fill(r.list)
conf.int.df <- plyr::mutate(conf.int.df, sig=(ci.lb>0 & ci.ub>0) |  (ci.lb<0 & ci.ub<0))
write.csv(conf.int.df, "../results/confidence-intervals.csv", row.names=FALSE)



# some code to run particular comparisons
erich <- "../data/response-vars/total-richness.csv"
df <- read.csv(erich, header = TRUE)
## df <- merge(df, papers, all.x=TRUE)
## bname <- strsplit(basename(erich),".", fixed=TRUE)[[1]][1]    
## r <- runComparison(df, "thin" , "control")
## getZVals(r, "thin" , "control")

## plotsAndConfint(erich)
