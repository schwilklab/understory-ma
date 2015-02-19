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

## exotic-richness
## exotic-richness
## s-cover
## herb-cover
## total-richness

ex.richness <- get_var("exotic-richness")
#ex.richness <-  subset(ex.richness, Paper != "Nelson+Halpern+etal-2008")

runComparison(ex.richness, "burn", "control", mods = NULL) # no sig modifiers for this comparison
runComparison(ex.richness, "thin", "control",  mods = NULL)
forest(runComparison(ex.richness, "burn", "thin",  mods = NULL))

runComparison(get_var("total-cover"), "burn", "control")
runComparison(get_var("total-cover"), "thin", "control")
runComparison(get_var("total-cover"), "burn", "thin")

runComparison(get_var("herb-richness"), "burn", "thin", mods = ~ YearsSinceTreatment)
forest(runComparison(get_var("herb-richness"), "burn", "thin", mods = ~ YearsSinceTreatment))
runComparison(get_var("herb-cover"), "burn", "thin",  mods = ~ EastWest)

runComparison(get_var("exotic-richness"), "burn", "control")
runComparison(get_var("exotic-richness"), "burn", "thin")

runComparison(get_var("s-cover"), "burn", "thin",  mods = ~ EastWest)






# exmaine potential modifiers


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

