 
# code to create map of all sites

library(ggplot2)
library(maps)
#library(mapproj)

source("ggplot-theme.R")

ssites <- read.csv("../data/papers-used-only.csv", stringsAsFactors=FALSE)

us_states <- map_data('state')

p <- ggplot() + geom_map(data=us_states, map=us_states, aes(x=long, y=lat, map_id=region),
                         fill="gray80", color="black") +
    geom_point(data=ssites, aes(x=Long, y=Lat),
               size = 2.5, alpha = 0.65,
               position = position_jitter(w = 0.5, h = 0.5)) +
    maptheme +
    coord_map()

p
ggsave("../results/plots/fig1.pdf", plot=p, width=col2, height=col2*0.6, units="cm")
