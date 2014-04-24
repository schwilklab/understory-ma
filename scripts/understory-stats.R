
library(ggplot2)
library(metafor)


graphmaker <- function(x) {

# Random effects model using standardized differences

# pick variable
t <- read.csv(x, header = true)


# burn vs control
dat <- escalc("SMD", m2i=control.mean, m1i=burn.mean,sd2i=control.s, sd1i=burn.s, n2i=control.n, n1i=burn.n, data=t)
res <- rma(yi, vi, data=dat)
confint(res)
forest(res, slab=dat$Paper)

# thin vs control
dat <- escalc("SMD", m2i=thin.mean, m1i=control.mean,sd2i=control.
s, sd1i=thin.s, n2i=control.n, n1i=thin.n, data=t)
res <- rma(yi, vi, data=dat)
confint(res)
forest(res, slab=dat$Paper)


# thin vs burn
dat <- escalc("SMD", m1i=burn.mean, m2i=thin.mean,sd1i=burn.s, sd2i=thin.s, n1i=burn.n, n2i=thin.n, data=t)
res <- rma(yi, vi, data=dat)
confint(res)
forest(res, slab=dat$Paper)
}


# makes a list of the files in your working directory
# the user needs to specify their directory path
my.files <- list.files(path = "your directory path here")


# the lappy command loops through the files executing the function for each one
graphs <- lapply(my.files,FUN=graphmaker)

