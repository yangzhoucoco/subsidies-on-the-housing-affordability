#### Preamble ####
# Purpose: Simple checks/testing on the data
# Author: Yang Zhou
# Date: 24 Jan 2024 
# Contact: cocoyang.zhou@mail.utoronto.ca
# License: MIT

# our tests will check if the minimum of rent or income is a positive number

#### Workspace setup ####
library(tidyverse)

#### Test data ####

checks <- function(path){
  data <- read_csv( 
    file = path,
    show_col_types = FALSE
  )
  if(data$total_income_per_month |> min() < 0){
    return(FALSE)
  }
  if(data$rent_per_month |> min() < 0){
    return(FALSE)
  }
  return(TRUE)
}

if(!checks("outputs/data/with subsidies.csv")){
  print("FAILED")
}
if(!checks("outputs/data/without subsidies, average rent.csv")){
  print("FAILED")
}
if(!checks("outputs/data/without subsidies, market rent.csv")){
  print("FAILED")
}

print("PASSED")

