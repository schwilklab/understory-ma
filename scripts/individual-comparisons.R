# to run individual comparisons and make figures

source("./understory-stats.R")

# helper function to read response var data
get_var <-  function(var) {
    df <- read.csv(file.path(DATA_DIR, paste(var, "csv", sep=".")), header = TRUE)
    df <- merge(df, papers, all.x=TRUE)
    df <- subset(df, Paper != "Nelson+Halpern+etal-2008")
    return(df)
}


# some code to run particular comparisons

## exotic-richnessg
## s-cover
## herb-cover
## total-richness

ex.richness <- get_var("exotic-richness")
#ex.richness <-  subset(ex.richness, Paper != "Nelson+Halpern+etal-2008")

runComparison(ex.richness, "burn", "control", mods = NULL) # no sig modifiers for this comparison
runComparison(ex.richness, "thin", "control",  mods = NULL)
runComparison(ex.richness, "burn", "thin",  mods = NULL)
forest(runComparison(ex.richness, "burn", "thin",  mods = ~ YearsSinceTreatment))

t.richness <- get_var("total-richness")
runComparison(t.richness, "burn", "control") 
runComparison(t.richness, "thin", "control")
runComparison(t.richness, "burn", "thin")
forest(runComparison(t.richness, "burn", "thin",  mods = ~ YearsSinceTreatment))
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


# examine potential modifiers


ggplot(get_var("total-richness"), aes(EastWest, burn.mean - control.mean)) +
    geom_point()

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

