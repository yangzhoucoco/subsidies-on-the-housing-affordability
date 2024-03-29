#### Preamble ####
# Purpose: To simulate monthly rent and income per month
# Author: Yang Zhou
# Date: 24 Jan 2024 
# Contact: cocoyang.zhou@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
set.seed(1)


#### Simulate data ####
n_rows <- 10

# random uniform (1000,3000)
income <- runif(n = n_rows, min = 1000, max = 3000) 

# random uniform(0.3,1.3) acts like a proportion of the income
rent <- income * runif(n = n_rows, min = 0.3, max = 1.3)

my_tibble <- tibble(income_per_month = income, rent_per_month = rent)
my_tibble



