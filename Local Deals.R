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
local_deal_paths <- list.files("C:/Users/fzhang/Downloads/LOCALDEALS/Local Deals",pattern = "*.csv",full.names = TRUE)

# Combine all files together and save it in an Excel

map_df(local_deal_paths,read_local_deal) %>% 
  as.data.frame() %>% 
  write_xlsx("H:/Report/Quarterly/2019/Q1/Local Deals/deals.xlsx")


