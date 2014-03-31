library(ggplot2)
library(metafor)


# function to calc standard deviations from standard errors

SE2SD <- function(se,n) {se*sqrt(n-1)}

getSDs <- function(d){
    d$control.SD <- SE2SD(d$control.s, d$control.n)
    d$burn.SD <- SE2SD(d$burn.s, d$burn.n)
    d$thin.SD <- SE2SD(d$thin.s,d$thin.n)
    return(d)
}

# Random effects model using standardized differences
# pick variable

t <- read.csv("data/exotic.richness.csv")
t <- getSDs(t)

# burn vs control
dat <- escalc("SMD", m2i=control.mean, m1i=burn.mean, sd2i=control.SD, sd1i=burn.SD, n2i=control.n, n1i=burn.n, data=t)
res <- rma(yi, vi, data=dat)
confint(res, level=90)
forest(res, slab=dat$Paper, level=90)

# thin vs control
dat <- escalc("SMD", m1i=thin.mean, m2i=control.mean, sd2i=control.SD, sd1i=thin.SD, n2i=control.n, n1i=thin.n, data=t)
res <- rma(yi, vi, data=dat)
confint(res, level=90)
forest(res, slab=dat$Paper, level=90)

# thin vs burn
dat <- escalc("SMD", m2i=burn.mean, m1i=thin.mean, sd2i=burn.SD, sd1i=thin.SD, n2i=burn.n, n1i=thin.n, data=t)
res <- rma(yi, vi, data=dat)
confint(res, level=90)
forest(res, slab=dat$Paper,level=90)
