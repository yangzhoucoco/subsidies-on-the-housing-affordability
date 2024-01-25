#### Preamble ####
# Purpose: For cleaning data downloaded from opentoronto, and ready for analysis
# Author: Yang Zhou
# Date: 24 Jan 2024 
# Contact: cocoyang.zhou@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)

#### Read data ####

raw_data1 <- read_csv("inputs/data/ 2022 Income Scenario - With Subsidies .csv")
raw_data2 <- read_csv("inputs/data/ 2022 Income Scenario - Without Subsidies, Average Rent .csv")
raw_data3 <- read_csv("inputs/data/ 2022 Income Scenario - Without Subsidies, Market Rent .csv")


#### Clean function ####

clean <- function(data){
  cleaned_data <-
    data |>
    slice(13:14) |> # only keep total income and rent
    select(-1, -2, -3) |>  # no need for the first three columns
    t() |> # transpose, feature should be in the column
    as_tibble() |>
    mutate(V1 = as.numeric(str_replace_all(V1, "[$,]", "")), # remove dollar and comma
           V2 = as.numeric(str_replace_all(V2, "[$,]", "")),
           group = paste(row_number())) |>
    rename(total_income_per_month=V1, rent_per_month=V2)
  return(cleaned_data)
}


# #### Save data ####
write_csv(clean(raw_data1), "outputs/data/with subsidies.csv")
write_csv(clean(raw_data2), "outputs/data/without subsidies, average rent.csv")
write_csv(clean(raw_data3), "outputs/data/without subsidies, market rent.csv")
