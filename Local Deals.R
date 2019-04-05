library(tidyverse)
library(readxl)
library(data.table)
library(writexl)


# Read csv files for local deal and add platform column -------------------

read_local_deal <- function(path){
  df <- read_csv(path,col_types = str_dup("c",25)) %>% 
    mutate(PT=str_sub(path,-6,-5))
  return(df)
}

# Extract paths for local deals files
local_deal_paths <- list.files("C:/Users/fzhang/OneDrive - Travelzoo/Report/Quarterly/LGLD/2019 Q1/Deals-List-View/",pattern = "*.csv",full.names = TRUE)

# Combine all files together and save it in an Excel

map_df(local_deal_paths,read_local_deal) %>% 
  write_xlsx("C:/Users/fzhang/OneDrive - Travelzoo/Report/Quarterly/LGLD/2019 Q1/Deals-List-View/deals.xlsx")

# Read csv files for daily revenue and add platform column -------------------

read_daily_revenue <- function(path){
  df <- read_csv(path,col_types = str_dup("c",34)) %>% 
    mutate(PT=str_sub(path,-6,-5))
  return(df[1:nrow(df)-1,])
}

# Extract paths for local deals files

dailyl_revenue_paths <- list.files("C:/Users/fzhang/OneDrive - Travelzoo/Report/Quarterly/LGLD/2019 Q1/daily-revenue/",pattern = "*.csv",full.names = TRUE)

# Combine all files together and save it in an Excel

map_df(dailyl_revenue_paths,read_daily_revenue) %>% 
  write_xlsx("C:/Users/fzhang/OneDrive - Travelzoo/Report/Quarterly/LGLD/2019 Q1/daily-revenue/daily_revenue.xlsx")

