library(tidyverse)
library(dplyr)
library(ggplot2)
library(janitor)
library(naniar)

CO_2020 <- read_csv("inputs/data/raw_pollution_data/2020/CO_2020.csv", 
                    skip = 7)
NO_2020 <- read_csv("inputs/data/raw_pollution_data/2020/NO_2020.csv", 
                    skip = 7)
NO2_2020 <- read_csv("inputs/data/raw_pollution_data/2020/NO2_2020.csv", 
                     skip = 7)
O3_2020 <- read_csv("inputs/data/raw_pollution_data/2020/O3_2020.csv", 
                                                  skip = 7)
SO2_2020 <- read_csv("inputs/data/raw_pollution_data/2020/SO2_2020.csv", 
                     skip = 7)

pollu_2020 <- rbind(CO_2020, NO_2020, NO2_2020, O3_2020, SO2_2020)
my_column_names <- c("Pollutant", "NAPS ID", "City", "Province", "Latitude", "Longitude", "Date", "H1",
                     "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12", "H13",
                     "H14", "H15", "H16", "H17", "H18", "H19", "H20", "H21", "H22", "H23", 
                     "H24")
colnames(pollu_2020) <- my_column_names
pollu_2020 <- pollu_2020 %>% select("Pollutant", "City", "Date", "H1",
                                    "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12",
                                    "H13", "H14", "H15", "H16", "H17", "H18", "H19", "H20", "H21", "H22", "H23", 
                                    "H24")

pollu_2020 <- pollu_2020 %>% filter(City == "Toronto")

pollu_2020 <- pollu_2020 %>% distinct(Date, .keep_all = TRUE)

pollu_2020 <- pollu_2020 %>% replace_with_na(replace = list(H1 = -999, H2 = -999, H3 = -999, 
                                                            H4 = -999, H5 = -999, H6 = -999,
                                                            H7 = -999, H8 = -999, H9 = -999, 
                                                            H10 = -999, H11 = -999, H12 = -999, 
                                                            H13 = -999, H14 = -999, H15 = -999,
                                                            H16 = -999, H17 = -999, H18 = -999, 
                                                            H19 = -999,  H20 = -999, H21 = -999,
                                                            H22 = -999, H23 = -999, H24 = -999))
pollu_2020 <- pollu_2020 %>% mutate(across(everything(), replace_na, 0))

pollu_2020 <- pollu_2020 %>% mutate(minimum = min(H1, H2, H3, H4, H5))
pollu_2020 <- pollu_2020 %>% mutate(maximum = max(H1, H2, H3, H4, H5))
pollu_2020 <- pollu_2020 %>% mutate(mean = mean(H1, H2, H3, H4, H5))



summary_year_max_data <- temp_2002_2022 %>% 
  group_by(year) %>% summarise(mean_max_temp = mean(max_temp))

