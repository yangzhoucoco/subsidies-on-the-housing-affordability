#### Preamble ####
# Purpose: Downloads and saves the data from "open data toronto, cost of living"
# Author: Yang Zhou
# Date: Jan 22. 2023
# Contact: cocoyang.zhou@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

#### Download data ####
data <- search_packages("cost-of-living-in-toronto-for-low-income-households")
res <- list_package_resources(data)

#### Save data ####
for(i in 1:nrow(res)){
  write.csv(
    get_resource(res[i,]), 
    file = paste("inputs/data/", res[i,]$name, ".csv") # paste() will combine strings
    ) 
}


         
