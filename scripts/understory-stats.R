library(ggplot2)
library(metafor)
library(plyr) # for rbind.fill

RESULTS_DIR = "../results/plots/"
DATA_DIR = "../data/"

EXCLUDES = c("g-richness.csv"  # Only three lines for thin-control and only 2
                               # for others. Won't run at all
            )

# Run a single treatment comparison.  neds some tricky text parsing
runComparison <- function(data, bname, t1, t2) {
    dat <- escalc("SMD",  m1i=eval(parse(text=paste(t1, ".mean",sep=""))),
                          m2i=eval(parse(text=paste(t2, ".mean", sep=""))),
                          sd2i=eval(parse(text=paste(t1, ".s", sep=""))),
                          sd1i=eval(parse(text=paste(t2, ".s", sep=""))),
                          n1i=eval(parse(text=paste(t1, ".n", sep=""))),
                          n2i=eval(parse(text=paste(t2, ".n", sep=""))),
                  data=data)
    
    res <- rma(yi, vi, data=dat)

    print(paste(t1, " vs ", t2, bname))
    ci <- data.frame(confint(res)[1])
    ci$contrast <- paste(t1,"-", t2,sep="")
    ci$measure <- row.names(ci)

    pdf(paste(RESULTS_DIR, bname, paste("-", t1, "-vs-", t2, ".pdf", sep="")))
        forest(res, slab=dat$Paper)
    dev.off()
    return(ci)
}



# Create three forest plots for a file and save them, 
# confidence intervals to stdout
plotsAndConfint <- function(x) {
    df <- read.csv(x, header = TRUE)
    bname <- strsplit(basename(x),".", fixed=TRUE)[[1]][1]    
    print(paste("Running tests on", bname))

    returnNull <- function(err) NULL # we just need to skip any errors
    
    # burn vs control  
    ci.bc <- tryCatch(runComparison(df, bname, "burn", "control"),
                      error = returnNull)
    # thin vs control
    ci.tc <- tryCatch(runComparison(df, bname, "thin", "control"),
                      error = returnNull)
    # thin vs burn
    ci.bt <- tryCatch(runComparison(df, bname, "burn", "thin"),
                      error = returnNull)
        
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
