library(tidyverse)

# 2018-2019
players <- read_csv("C:/git repos/Fantasy-Premier-League/data/2018-19/gws/merged_gw.csv")
lengtho <- players %>% group_by(name) %>% tally


r_nest <- vector(mode="list")

for (i in 10:38) {
  temp_df <- players %>% filter(i-10 < GW, GW < i+1) %>%
    group_by(name) %>% mutate(counto = n()) %>% ungroup() %>% filter(counto == 10)
  r_nest[[i]] <- temp_df 
}

tot_df <- rbind(r_nest, "id"=.id)

