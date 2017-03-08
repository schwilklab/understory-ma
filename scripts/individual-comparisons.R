# to run individual comparisons and make figures

source("./understory-stats.R")
source("./ggplot-theme.R")

# helper function to read response var data
get_var <-  function(var) {
  df <- read.csv(file.path(DATA_DIR, paste(var, "csv", sep=".")), header = TRUE)
  
    df <- merge(df, papers) #, all.x=TRUE)
    df <- subset(df, )
    return(df)
}


# some code to run particular comparisons

## exotic-richnessg
## s-cover
## herb-cover
## total-richness

## Richness plots

## exotic richness -- only 7 western sites
ex.richness <- get_var("exotic-richness")
#ex.richness <-  subset(ex.richness, Paper != "Nelson+Halpern+etal-2008")

runComparison(ex.richness, "burn", "control", mods = NULL) # no sig modifiers for this comparison
runComparison(ex.richness, "thin", "control",  mods = NULL)
runComparison(ex.richness, "burn", "thin",  mods = NULL)

#Figure 2
pdf("../results/ms-figs/fig2.pdf")
print(forest(runComparison(ex.richness, "thin", "control",  mods = NULL),
       slab=ex.richness$FormattedName))
### add column headings to the plot
#text(c(-9.5,-8,-6,-4.5), 26, c("TB+", "TB-", "TB+", "TB-"))
#text(c(-8.75,-5.25),     27, c("Vaccinated", "Control"))
text(-4, 8.5, "Author(s) and Year",     pos=4)
text(6.8, 8.5, "Exotic richness, Thin - Control [95% CI]", pos=2)
dev.off()
##


## Shrub cover
s.cover <- get_var("s-cover")
count(s.cover, EastWest)
##   EastWest     n
##     <fctr> <int>
## 1     West     6
## 2     East     3

res <- runComparison(ex.richness, "burn", "control", mods = NULL) # no sig modifiers for this comparison
#runComparison(ex.richness, "thin", "control",  mods = NULL)
#runComparison(ex.richness, "burn", "thin",  mods = NULL)

#Figure 4
pdf("../results/ms-figs/fig4.pdf")
print(forest(runComparison(s.cover, "burn", "control",  mods = NULL),
       slab=s.cover$FormattedName))
### add column headings to the plot
#text(c(-9.5,-8,-6,-4.5), 26, c("TB+", "TB-", "TB+", "TB-"))
#text(c(-8.75,-5.25),     27, c("Vaccinated", "Control"))
text(-9.6, 9.5, "Author(s) and Year",     pos=4)
text(7.8, 9.5, "Shrub cover, Burn - Control [95% CI]", pos=2)
dev.off()

##


## total cover
t.cover <- get_var("total-cover")
count(t.cover, EastWest)
##   EastWest     n
##     <fctr> <int>
## 1     West     13
## 2     East     2

res <- runComparison(t.cover, "burn", "control", mods = ~ EastWest)
#runComparison(ex.richness, "thin", "control",  mods = NULL)
#runComparison(ex.richness, "burn", "thin",  mods = NULL)

#Figure 3
#pdf("../results/ms-figs/fig3.pdf")
print(forest(runComparison(t.cover, "thin", "control",  mods = NULL),
       slab=t.cover$FormattedName))
### add column headings to the plot
#text(c(-9.5,-8,-6,-4.5), 26, c("TB+", "TB-", "TB+", "TB-"))
#text(c(-8.75,-5.25),     27, c("Vaccinated", "Control"))
text(-9, 9.5, "Author(s) and Year",     pos=4)
text(6, 9.5, "Burn - Control [95% CI]", pos=2)
#dev.off()

##



# test
res <- rma(ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg, measure="RR",
           slab=paste(author, year, sep=", "), method="REML")
 
### set up forest plot (with 2x2 table counts added; rows argument is used
### to specify exactly in which rows the outcomes will be plotted)
forest(res, xlim=c(-16, 6), 
       ilab=cbind(dat.bcg$tpos, dat.bcg$tneg, dat.bcg$cpos, dat.bcg$cneg),
       ilab.xpos=c(-9.5,-8,-6,-4.5),
       cex=.75,
       ylim=c(-1, 27),
       order=order(dat.bcg$alloc),
       rows=c(3:4,9:15,20:23),
       xlab="Relative Risk", mlab="RE Model for All Studies", psize=1)


## Total richness

t.richness <- get_var("total-richness")

forest(runComparison(t.richness, "burn", "control",  mods = ~ YearsSinceTreatment),
       slab=t.richness$FormattedName)

t.richness <- arrange(t.richness, EastWest)
### fit random-effects model (use slab argument to define study labels)
res <- runComparison(t.richness, "burn", "control", mod=NULL)

 
### set up forest plot; rows argument is used
### to specify exactly in which rows the outcomes will be plotted)
print(forest(res, order=order(t.richness$EastWest),
       #     at=c(.05, .25, 1, 4),
     #  cex=.75,
#       ylim = c(-2.5, 20),
#       rows=c(1:17, 18:20),
       xlab="Richness", mlab="RE Model for All Studies", psize=1,
       slab=t.richness$FormattedName)
 )
### set font expansion factor (as in forest() above) and use bold italic
### font and save original settings in object 'op'
op <- par(cex=.75, font=4)
 
### add text for the subgroups
text(-16, c(24,16,5), pos=4, c("Systematic Allocation",
                               "Random Allocation",
                               "Alternate Allocation"))
 
### switch to bold font
par(font=2)
 
### add column headings to the plot
text(c(-9.5,-8,-6,-4.5), 26, c("TB+", "TB-", "TB+", "TB-"))
text(c(-8.75,-5.25),     27, c("Vaccinated", "Control"))
text(-16,                26, "Author(s) and Year",     pos=4)
text(6,                  26, "Relative Risk [95% CI]", pos=2)
 
### set par back to the original settings
par(op)
 
### fit random-effects model in the three subgroups
res.s <- rma(ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg, measure="RR",
             subset=(alloc=="systematic"), method="REML")
res.r <- rma(ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg, measure="RR",
             subset=(alloc=="random"), method="REML")
res.a <- rma(ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg, measure="RR",
             subset=(alloc=="alternate"), method="REML")
 
### add summary polygons for the three subgroups
addpoly(res.s, row=18.5, cex=.75, atransf=exp, mlab="RE Model for Subgroup")
addpoly(res.r, row= 7.5, cex=.75, atransf=exp, mlab="RE Model for Subgroup")
addpoly(res.a, row= 1.5, cex=.75, atransf=exp, mlab="RE Model for Subgroup")






runComparison(t.richness, "thin", "control")
runComparison(t.richness, "burn", "thin")


forest(runComparison(t.richness, "burn", "thin",  mods = ~ YearsSinceTreatment),
       slab=t.richness$FormattedName)
# no treatment effect total richness

t.cover <- get_var("total-cover")
runComparison(t.cover, "burn", "control", mods=NULL) 
runComparison(t.cover, "thin", "control", mods=NULL)
runComparison(t.cover, "burn", "thin", mods=NULL)
forest(runComparison(t.cover, "burn", "control",  mods = ~ YearsSinceTreatment))
# no treatment effect on total cover


runComparison(get_var("herb-cover"), "burn", "control", mods=NULL)
runComparison(get_var("herb-cover"), "thin", "control", mods = NULL)
runComparison(get_var("herb-cover"), "burn", "thin")
# No treatment effects on herb cover


runComparison(get_var("herb-richness"), "burn", "thin", mods = ~ YearsSinceTreatment)
forest(runComparison(get_var("herb-richness"), "burn", "thin", mods = ~ YearsSinceTreatment))
runComparison(get_var("herb-cover"), "burn", "thin",  mods = ~ EastWest)
# nothing


runComparison(get_var("s-cover"), "burn", "control")
runComparison(get_var("s-cover"), "burn", "thin")
runComparison(get_var("s-cover"), "thin", "control")
# 


# examine potential modifiers and make figures
get_g <- function(data, t1, t2) {
  dat <- escalc("SMD",  m1i=eval(parse(text=paste(t1, ".mean",sep=""))),
                          m2i=eval(parse(text=paste(t2, ".mean", sep=""))),
                          sd1i=eval(parse(text=paste(t1, ".s", sep=""))),
                          sd2i=eval(parse(text=paste(t2, ".s", sep=""))),
                          n1i=eval(parse(text=paste(t1, ".n", sep=""))),
                          n2i=eval(parse(text=paste(t2, ".n", sep=""))),
                data=data)
  return(dat)
}


pd <- position_dodge(1) # move them .05 to the left and right





t.richness <- get_var("total-richness")
t.r.g <- get_g(t.richness, "burn", "control") %>%
  filter(!is.na(yi))
ggplot(t.r.g, aes(FormattedName, yi)) +
  ylab("Total richness Burn - Control Hedge's g") +
  xlab("") +
 geom_errorbar(aes(ymin=yi-vi, ymax=yi+vi), width=.1) +
  geom_point() +
  facet_grid( EastWest ~ .,  scales = "free", space = "free") +
  coord_flip() + pubtheme
ggsave("../results/ms-figs/fig3.pdf")

## trg2 <-  get_g(t.richness, "thin", "control") %>%
##   filter(!is.na(yi))
## ggplot(trg2, aes(FormattedName, yi)) +
##   ylab("Total richness Thin - Control Hedge's g") +
##   xlab("") +
##  geom_errorbar(aes(ymin=yi-vi, ymax=yi+vi), width=.1) +
##   geom_point() +
##   facet_grid( EastWest ~ .,  scales = "free", space = "free") +
##   coord_flip() + pubtheme
## ggsave("../results/ms-figs/fig4-n.pdf")


t.cover <- get_var("total-cover")
t.c.g <- get_g(t.cover, "thin", "control") %>%
  filter(!is.na(yi))
ggplot(t.c.g, aes(FormattedName, yi)) +
  ylab("Totol cover Thin - Control Hedge's g") +
  xlab("") +
 geom_errorbar(aes(ymin=yi-vi, ymax=yi+vi), width=.1) +
  geom_point() +
  facet_grid( EastWest ~ .,  scales = "free", space = "free") +
  coord_flip() + pubtheme
ggsave("../results/ms-figs/fig5.pdf")


ggplot(get_var("total-richness"), aes(EastWest, burn.mean - thin.mean)) +
    geom_point()

ggplot(get_var("total-richness"), aes(EastWest, thin.mean - control.mean)) +
    geom_point()


# examine potential modifiers
ggplot(get_var("total-cover"), aes(YearsSinceTreatment, burn.mean - control.mean)) +
    geom_point()

ggplot(get_var("total-cover"), aes(YearsSinceTreatment, burn.mean - thin.mean)) +
    geom_point()

ggplot(get_var("total-cover"), aes(YearsSinceTreatment, thin.mean - control.mean)) +
    geom_point()


# examine potential modifiers
ggplot(get_var("total-richness"), aes(YearsSinceTreatment, burn.mean - control.mean)) +
    geom_point()

ggplot(get_var("total-richness"), aes(YearsSinceTreatment, burn.mean - thin.mean)) +
    geom_point()

ggplot(get_var("total-richness"), aes(YearsSinceTreatment, thin.mean - control.mean)) +
    geom_point()



ggplot(get_var("herb-richness"), aes(EastWest, burn.mean - control.mean)) +
    geom_point()

ggplot(get_var("herb-richness"), aes(EastWest, burn.mean - thin.mean)) +
    geom_point()

ggplot(get_var("herb-richness"), aes(EastWest, thin.mean - control.mean)) +
    geom_point()


# examine potential modifiers
ggplot(get_var("herb-richness"), aes(YearsSinceTreatment, burn.mean - control.mean)) +
    geom_point()

ggplot(get_var("herb-richness"), aes(YearsSinceTreatment, burn.mean - thin.mean)) +
    geom_point()

ggplot(get_var("herb-richness"), aes(YearsSinceTreatment, thin.mean - control.mean)) +
    geom_point()


# examine potential modifiers
ggplot(get_var("herb-cover"), aes(YearsSinceTreatment, burn.mean - control.mean)) +
    geom_point()

ggplot(get_var("herb-cover"), aes(YearsSinceTreatment, burn.mean - thin.mean)) +
    geom_point()

ggplot(get_var("herb-cover"), aes(YearsSinceTreatment, thin.mean - control.mean)) +
    geom_point()

