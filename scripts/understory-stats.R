library(ggplot2)
library(metafor)
library(plyr)
options(na.action = "na.omit")

RESULTS_DIR = "../results/plots/"
DATA_DIR = "../data/response-vars/"

# no need to look at graminoids and forbs separately now
EXCLUDES = c("g-richness.csv", "g-cover.csv", "f-richness.csv", "f-cover.csv" ,
              "exotic-cover.csv", # use exotic richness
              "herb-richness.csv", # use herb-cover
              "s-richness.csv", #use shrub cover
              "native-cover.csv", "native-richness.csv" # similar to total
             )


## Global variable for default modifers:
MODS = ~ EastWest  # this is only modifier that ends up significant

# read in table of papers
papers <- read.csv("../data/papers.csv", stringsAsFactors=FALSE)
papers$FireIntensity <- factor(papers$FireIntensity)
papers$FuelType <- factor(papers$FuelType)
papers$EastWest <- ifelse(papers$Long < -100, "West", "East")
papers$EastWest <- factor(papers$EastWest, levels = c("West", "East"))




# Run a single treatment comparison. Needs some tricky text parsing
runComparison <- function(data, t1, t2, mods = MODS) {
    dat <- escalc("SMD",  m1i=eval(parse(text=paste(t1, ".mean",sep=""))),
                          m2i=eval(parse(text=paste(t2, ".mean", sep=""))),
                          sd1i=eval(parse(text=paste(t1, ".s", sep=""))),
                          sd2i=eval(parse(text=paste(t2, ".s", sep=""))),
                          n1i=eval(parse(text=paste(t1, ".n", sep=""))),
                          n2i=eval(parse(text=paste(t2, ".n", sep=""))),
                  data=data)

    returnNull <- function(err) NULL # we just need to skip any errors

    # "level" below indicates sig level. We use 90, for one-tailed test. This
    # effects confidence intervals, no p values, so we can still adjust those
    # manually.
    res <- tryCatch(rma(yi, vi, mods = mods, data=dat, level=90),
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
    r <- runComparison(data, t1, t2, mods=MODS)
    if(is.null(r)) {
        return(NULL)
    }
    print(paste(t1, " vs ", t2, resp.var))
    pdf(file.path(RESULTS_DIR, paste(resp.var, "-", t1, "-vs-", t2, ".pdf", sep="")))
    forest(r, slab=data$FormattedName)
    dev.off()

    png(file.path(RESULTS_DIR, paste(resp.var, "-", t1, "-vs-", t2, "-funnel.png", sep="")))
    funnel(r)
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
    df <- subset(df, Paper != "Nelson+Halpern+etal-2008")
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
conf.int.df <- conf.int.df[with(conf.int.df, order(param, pval)), ]

# P value adjustment "holm" is most conservative (= sequential Bonferroni), but
# "hommel" or "hochberg" are almost appropriate these data. Here we are really
# only interested in the intercept pvalue for adjustment, but I run on both
# params using ddply:
conf.int.df <- ddply(conf.int.df, .(param), mutate, adj.pval = p.adjust(pval, "holm"))

write.csv(conf.int.df, "../results/confidence-intervals.csv", row.names=FALSE)

