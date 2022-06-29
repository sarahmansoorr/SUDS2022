#### Preamble ----
# Purpose: Clean the tempreature and pollution data 
# Author: Sarah Mansoor
# Date: May 2022
# Contact: sarah.mansoor@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the ACS data and saved it to inputs/data
# - Don't forget to gitignore it!


#### Workspace setup ----
library(tidyverse)
library(dplyr)
library(ggplot2)
library(janitor)

#### Cleaning Temperature Data ----

# Change column names 
my_column_names <- c("Longitude (x)", "Latitude (y)", "Station Name", "Climate ID", 
                     "Date", "Year", "Month", "Day", "Data Quality", "Max Temp", 
                     "Max Temp Flag", "Min Temp", "Min Temp Flag", "Mean Temp", 
                     "Mean Temp Flag", "Heat Deg Days", "Heat Deg Days Flag", 
                     "Cool Deg Days", "Cool Deg Days Flag", "Total Rain", 
                     "Total Rain Flag", "Total Snow", "Total Snow Flag", "Total Precip", 
                     "Total Precip Flag", "Snow on Grnd", "Snow on Grnd Flag", 
                     "Dir of Max Gust", "Dir of Max Gust Flag", "Spd of Max Gust", 
                     "Spd of Max Gust Flag")

colnames(temp_jan_may_2022) <- my_column_names
colnames(temp_jan_dec_2021) <- my_column_names
colnames(temp_2002_2022) <- my_column_names
colnames(temp_2002_2022) <- my_column_names
colnames(temp_2002_2022) <- my_column_names
colnames(temp_2002_2022) <- my_column_names
colnames(temp_2002_2022) <- my_column_names
colnames(temp_2002_2022) <- my_column_names
colnames(temp_2002_2022) <- my_column_names
colnames(temp_2002_2022) <- my_column_names
colnames(temp_2002_2022) <- my_column_names
colnames(temp_2002_2022) <- my_column_names
colnames(temp_2002_2022) <- my_column_names
colnames(temp_2002_2022) <- my_column_names
colnames(temp_2002_2022) <- my_column_names
colnames(temp_2002_2022) <- my_column_names
colnames(temp_2002_2022) <- my_column_names


# Combine 2002 - 2022 data

temp_2002_2022 <- rbind(temp_jan_dec_2002, temp_jan_dec_2003, temp_jan_dec_2004, 
                        temp_jan_dec_2005, temp_jan_dec_2006, temp_jan_dec_2007,
                        temp_jan_dec_2008, temp_jan_dec_2009, temp_jan_dec_2010,
                        temp_jan_dec_2011, temp_jan_dec_2012, temp_jan_dec_2013, 
                        temp_jan_dec_2014, temp_jan_dec_2015, temp_jan_dec_2016,
                        temp_jan_dec_2017, temp_jan_dec_2018, temp_jan_dec_2019,
                        temp_jan_dec_2020, temp_jan_dec_2021, temp_jan_may_2022)

temp_2002_2022 <- temp_2002_2022 %>% select()

colnames(temp_2002_2022) <- my_column_names
temp_2002_2022 <- clean_names(temp_2002_2022)

### Add column for Month Names
temp_2002_2022 <- temp_2002_2022 %>%
  mutate(month_name = case_when(
    month == 1 ~ "Jan",
    month == 2 ~ "Feb", 
    month == 3 ~ "Mar", 
    month == 4 ~ "Apr",
    month == 5 ~ "May", 
    month == 6 ~ "Jun",
    month == 7 ~ "Jul",
    month == 8 ~ "Aug", 
    month == 9 ~ "Sep",
    month == 10 ~ "Oct",
    month == 11 ~ "Nov", 
    month == 12 ~ "Dec"
  ))

### Drop NA
temp_2002_2022 <- temp_2002_2022 %>% drop_na(max_temp)
temp_2002_2022 <- temp_2002_2022 %>% drop_na(min_temp)
temp_2002_2022 <- temp_2002_2022 %>% drop_na(mean_temp)

# Save temperature data 2002-2022
write_csv(
  x = temp_2002_2022,
  file = "~/Desktop/SUDS2022/inputs/data/clean_temp_data/temperature_2002_2022.csv"
)

#### Cleaning Pollution Data ----

## 2020 Data

# change column names
my_column_names <- c("Pollutant", "NAPS ID", "City", "Province", "Latitude", "Longitude", "Date", "H1",
                     "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12", "H13",
                     "H14", "H15", "H16", "H17", "H18", "H19", "H20", "H21", "H22", "H23", 
                     "H24")
colnames(CO_2020) <- my_column_names
colnames(NO_2020) <- my_column_names
colnames(NO2_2020) <- my_column_names
colnames(O3_2020) <- my_column_names
colnames(SO2_2020) <- my_column_names
# combine data
pollu_2020 <- rbind(CO_2020, NO_2020, NO2_2020, O3_2020, SO2_2020)
colnames(pollu_2020) <- my_column_names
# select variables
pollu_2020 <- pollu_2020 %>% select("Pollutant", "City", "Date", "H1",
                                    "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12",
                                    "H13", "H14", "H15", "H16", "H17", "H18", "H19", "H20", "H21", "H22", "H23", 
                                    "H24")
# filter for Toronto
pollu_2020 <- pollu_2020 %>% filter(City == "Toronto")
# remove duplicate dates
unique_rows <- !duplicated(pollu_2020[c("Pollutant", "Date")])
pollu_2020 <- pollu_2020[unique_rows,]
# replace -999 missing values with NA
pollu_2020 <- pollu_2020 %>% replace_with_na(replace = list(H1 = -999, H2 = -999, H3 = -999, 
                                                            H4 = -999, H5 = -999, H6 = -999,
                                                            H7 = -999, H8 = -999, H9 = -999, 
                                                            H10 = -999, H11 = -999, H12 = -999, 
                                                            H13 = -999, H14 = -999, H15 = -999,
                                                            H16 = -999, H17 = -999, H18 = -999, 
                                                            H19 = -999,  H20 = -999, H21 = -999,
                                                            H22 = -999, H23 = -999, H24 = -999))
# replace NA with 0
pollu_2020[is.na(pollu_2020)] <- 0
# Add column for average 
pollu_2020 <- pollu_2020 %>% mutate(Mean = rowMeans(pollu_2020[ ,c(4:27)], na.rm=TRUE))
# Add column for Year
pollu_2020 <- pollu_2020 %>% mutate(Year = "2020")
# Remove hourly data columns
pollu_2020 <- pollu_2020 %>% select("Pollutant", "City", "Date", "Mean", "Year")

## 2019 Data

colnames(CO_2019) <- my_column_names
colnames(NO_2019) <- my_column_names
colnames(NO2_2019) <- my_column_names
colnames(O3_2019) <- my_column_names
colnames(SO2_2019) <- my_column_names
# combine data
pollu_2019 <- rbind(CO_2019, NO_2019, NO2_2019, O3_2019, SO2_2019)
# change column names
colnames(pollu_2019) <- my_column_names
# select variables
pollu_2019 <- pollu_2019 %>% select("Pollutant", "City", "Date", "H1",
                                    "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12",
                                    "H13", "H14", "H15", "H16", "H17", "H18", "H19", "H20", "H21", "H22", "H23", 
                                    "H24")
# filter for Toronto
pollu_2019 <- pollu_2019 %>% filter(City == "Toronto")
# remove duplicate dates
unique_rows <- !duplicated(pollu_2019[c("Pollutant", "Date")])
pollu_2019 <- pollu_2019[unique_rows,]
# replace -999 missing values with NA
pollu_2019 <- pollu_2019 %>% replace_with_na(replace = list(H1 = -999, H2 = -999, H3 = -999, 
                                                            H4 = -999, H5 = -999, H6 = -999,
                                                            H7 = -999, H8 = -999, H9 = -999, 
                                                            H10 = -999, H11 = -999, H12 = -999, 
                                                            H13 = -999, H14 = -999, H15 = -999,
                                                            H16 = -999, H17 = -999, H18 = -999, 
                                                            H19 = -999,  H20 = -999, H21 = -999,
                                                            H22 = -999, H23 = -999, H24 = -999))
# replace NA with 0
pollu_2019[is.na(pollu_2019)] <- 0
# Add column for average 
pollu_2019 <- pollu_2019 %>% mutate(Mean = rowMeans(pollu_2019[ ,c(4:27)], na.rm=TRUE))
# Add column for Year
pollu_2019 <- pollu_2019 %>% mutate(Year = "2019")
# Remove hourly data columns
pollu_2019 <- pollu_2019 %>% select("Pollutant", "City", "Date", "Mean", "Year")

## 2018 Data
colnames(CO_2018) <- my_column_names
colnames(NO_2018) <- my_column_names
colnames(NO2_2018) <- my_column_names
colnames(O3_2018) <- my_column_names
colnames(SO2_2018) <- my_column_names
# combine data
pollu_2018 <- rbind(CO_2018, NO_2018, NO2_2018, O3_2018, SO2_2018)
# change column names
colnames(pollu_2018) <- my_column_names
# select variables
pollu_2018 <- pollu_2018 %>% select("Pollutant", "City", "Date", "H1",
                                    "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12",
                                    "H13", "H14", "H15", "H16", "H17", "H18", "H19", "H20", "H21", "H22", "H23", 
                                    "H24")
# filter for Toronto
pollu_2018 <- pollu_2018 %>% filter(City == "Toronto")
# remove duplicate dates
unique_rows <- !duplicated(pollu_2018[c("Pollutant", "Date")])
pollu_2018 <- pollu_2018[unique_rows,]
# replace -999 missing values with NA
pollu_2018 <- pollu_2018 %>% replace_with_na(replace = list(H1 = -999, H2 = -999, H3 = -999, 
                                                            H4 = -999, H5 = -999, H6 = -999,
                                                            H7 = -999, H8 = -999, H9 = -999, 
                                                            H10 = -999, H11 = -999, H12 = -999, 
                                                            H13 = -999, H14 = -999, H15 = -999,
                                                            H16 = -999, H17 = -999, H18 = -999, 
                                                            H19 = -999,  H20 = -999, H21 = -999,
                                                            H22 = -999, H23 = -999, H24 = -999))
# replace NA with 0
pollu_2018[is.na(pollu_2018)] <- 0
# Add column for average 
pollu_2018 <- pollu_2018 %>% mutate(Mean = rowMeans(pollu_2018[ ,c(4:27)], na.rm=TRUE))
# Add column for Year
pollu_2018 <- pollu_2018 %>% mutate(Year = "2018")
# Remove hourly data columns
pollu_2018 <- pollu_2018 %>% select("Pollutant", "City", "Date", "Mean", "Year")

## 2017 Data

colnames(CO_2017) <- my_column_names
colnames(NO_2017) <- my_column_names
colnames(NO2_2017) <- my_column_names
colnames(O3_2017) <- my_column_names
colnames(SO2_2017) <- my_column_names
# combine data
pollu_2017 <- rbind(CO_2017, NO_2017, NO2_2017, O3_2017, SO2_2017)
# change column names
colnames(pollu_2017) <- my_column_names
# select variables
pollu_2017 <- pollu_2017 %>% select("Pollutant", "City", "Date", "H1",
                                    "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12",
                                    "H13", "H14", "H15", "H16", "H17", "H18", "H19", "H20", "H21", "H22", "H23", 
                                    "H24")
# filter for Toronto
pollu_2017 <- pollu_2017 %>% filter(City == "Toronto")
# remove duplicate dates
unique_rows <- !duplicated(pollu_2017[c("Pollutant", "Date")])
pollu_2017 <- pollu_2017[unique_rows,]
# replace -999 missing values with NA
pollu_2017 <- pollu_2017 %>% replace_with_na(replace = list(H1 = -999, H2 = -999, H3 = -999, 
                                                            H4 = -999, H5 = -999, H6 = -999,
                                                            H7 = -999, H8 = -999, H9 = -999, 
                                                            H10 = -999, H11 = -999, H12 = -999, 
                                                            H13 = -999, H14 = -999, H15 = -999,
                                                            H16 = -999, H17 = -999, H18 = -999, 
                                                            H19 = -999,  H20 = -999, H21 = -999,
                                                            H22 = -999, H23 = -999, H24 = -999))
# replace NA with 0
pollu_2017[is.na(pollu_2017)] <- 0
# Add column for average 
pollu_2017 <- pollu_2017 %>% mutate(Mean = rowMeans(pollu_2017[ ,c(4:27)], na.rm=TRUE))
# Add column for Year
pollu_2017 <- pollu_2017 %>% mutate(Year = "2017")
# Remove hourly data columns
pollu_2017 <- pollu_2017 %>% select("Pollutant", "City", "Date", "Mean", "Year")

## 2016 Data

colnames(CO_2016) <- my_column_names
colnames(NO_2016) <- my_column_names
colnames(NO2_2016) <- my_column_names
colnames(O3_2016) <- my_column_names
colnames(SO2_2016) <- my_column_names
# combine data
pollu_2016 <- rbind(CO_2016, NO_2016, NO2_2016, O3_2016, SO2_2016)
# change column names
colnames(pollu_2016) <- my_column_names
# select variables
pollu_2016 <- pollu_2016 %>% select("Pollutant", "City", "Date", "H1",
                                    "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12",
                                    "H13", "H14", "H15", "H16", "H17", "H18", "H19", "H20", "H21", "H22", "H23", 
                                    "H24")
# filter for Toronto
pollu_2016 <- pollu_2016 %>% filter(City == "Toronto")
# remove duplicate dates
unique_rows <- !duplicated(pollu_2016[c("Pollutant", "Date")])
pollu_2016 <- pollu_2016[unique_rows,]
# replace -999 missing values with NA
pollu_2016 <- pollu_2016 %>% replace_with_na(replace = list(H1 = -999, H2 = -999, H3 = -999, 
                                                            H4 = -999, H5 = -999, H6 = -999,
                                                            H7 = -999, H8 = -999, H9 = -999, 
                                                            H10 = -999, H11 = -999, H12 = -999, 
                                                            H13 = -999, H14 = -999, H15 = -999,
                                                            H16 = -999, H17 = -999, H18 = -999, 
                                                            H19 = -999,  H20 = -999, H21 = -999,
                                                            H22 = -999, H23 = -999, H24 = -999))
# replace NA with 0
pollu_2016[is.na(pollu_2016)] <- 0
# Add column for average 
pollu_2016 <- pollu_2016 %>% mutate(Mean = rowMeans(pollu_2016[ ,c(4:27)], na.rm=TRUE))
# Add column for Year
pollu_2016 <- pollu_2016 %>% mutate(Year = "2016")
# Remove hourly data columns
pollu_2016 <- pollu_2016 %>% select("Pollutant", "City", "Date", "Mean", "Year")

## 2015 Data

colnames(CO_2015) <- my_column_names
colnames(NO_2015) <- my_column_names
colnames(NO2_2015) <- my_column_names
colnames(O3_2015) <- my_column_names
colnames(SO2_2015) <- my_column_names
# combine data
pollu_2015 <- rbind(CO_2015, NO_2015, NO2_2015, O3_2015, SO2_2015)
# change column names
colnames(pollu_2015) <- my_column_names
# select variables
pollu_2015 <- pollu_2015 %>% select("Pollutant", "City", "Date", "H1",
                                    "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12",
                                    "H13", "H14", "H15", "H16", "H17", "H18", "H19", "H20", "H21", "H22", "H23", 
                                    "H24")
# filter for Toronto
pollu_2015 <- pollu_2015 %>% filter(City == "Toronto")
# remove duplicate dates
unique_rows <- !duplicated(pollu_2015[c("Pollutant", "Date")])
pollu_2015 <- pollu_2015[unique_rows,]
# replace -999 missing values with NA
pollu_2015 <- pollu_2015 %>% replace_with_na(replace = list(H1 = -999, H2 = -999, H3 = -999, 
                                                            H4 = -999, H5 = -999, H6 = -999,
                                                            H7 = -999, H8 = -999, H9 = -999, 
                                                            H10 = -999, H11 = -999, H12 = -999, 
                                                            H13 = -999, H14 = -999, H15 = -999,
                                                            H16 = -999, H17 = -999, H18 = -999, 
                                                            H19 = -999,  H20 = -999, H21 = -999,
                                                            H22 = -999, H23 = -999, H24 = -999))
# replace NA with 0
pollu_2015[is.na(pollu_2015)] <- 0
# Add column for average 
pollu_2015 <- pollu_2015 %>% mutate(Mean = rowMeans(pollu_2015[ ,c(4:27)], na.rm=TRUE))
# Add column for Year
pollu_2015 <- pollu_2015 %>% mutate(Year = "2015")
# Remove hourly data columns
pollu_2015 <- pollu_2015 %>% select("Pollutant", "City", "Date", "Mean", "Year")

## 2014 Data
colnames(CO_2014) <- my_column_names
colnames(NO_2014) <- my_column_names
colnames(NO2_2014) <- my_column_names
colnames(O3_2014) <- my_column_names
colnames(SO2_2014) <- my_column_names
# combine data
pollu_2014 <- rbind(CO_2014, NO_2014, NO2_2014, O3_2014, SO2_2014)
# change column names
colnames(pollu_2014) <- my_column_names
# select variables
pollu_2014 <- pollu_2014 %>% select("Pollutant", "City", "Date", "H1",
                                    "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12",
                                    "H13", "H14", "H15", "H16", "H17", "H18", "H19", "H20", "H21", "H22", "H23", 
                                    "H24")
# filter for Toronto
pollu_2014 <- pollu_2014 %>% filter(City == "Toronto")
# remove duplicate dates
unique_rows <- !duplicated(pollu_2014[c("Pollutant", "Date")])
pollu_2014 <- pollu_2014[unique_rows,]
# replace -999 missing values with NA
pollu_2014 <- pollu_2014 %>% replace_with_na(replace = list(H1 = -999, H2 = -999, H3 = -999, 
                                                            H4 = -999, H5 = -999, H6 = -999,
                                                            H7 = -999, H8 = -999, H9 = -999, 
                                                            H10 = -999, H11 = -999, H12 = -999, 
                                                            H13 = -999, H14 = -999, H15 = -999,
                                                            H16 = -999, H17 = -999, H18 = -999, 
                                                            H19 = -999,  H20 = -999, H21 = -999,
                                                            H22 = -999, H23 = -999, H24 = -999))
# replace NA with 0
pollu_2014[is.na(pollu_2014)] <- 0
# Add column for average 
pollu_2014 <- pollu_2014 %>% mutate(Mean = rowMeans(pollu_2014[ ,c(4:27)], na.rm=TRUE))
# Add column for Year
pollu_2014 <- pollu_2014 %>% mutate(Year = "2014")
# Remove hourly data columns
pollu_2014 <- pollu_2014 %>% select("Pollutant", "City", "Date", "Mean", "Year")

## 2013 Data
colnames(CO_2013) <- my_column_names
colnames(NO_2013) <- my_column_names
colnames(NO2_2013) <- my_column_names
colnames(O3_2013) <- my_column_names
colnames(SO2_2013) <- my_column_names
# combine data
pollu_2013 <- rbind(CO_2013, NO_2013, NO2_2013, O3_2013, SO2_2013)
# change column names
colnames(pollu_2013) <- my_column_names
# select variables
pollu_2013 <- pollu_2013 %>% select("Pollutant", "City", "Date", "H1",
                                    "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12",
                                    "H13", "H14", "H15", "H16", "H17", "H18", "H19", "H20", "H21", "H22", "H23", 
                                    "H24")
# filter for Toronto
pollu_2013 <- pollu_2013 %>% filter(City == "Toronto")
# remove duplicate dates
unique_rows <- !duplicated(pollu_2013[c("Pollutant", "Date")])
pollu_2013 <- pollu_2013[unique_rows,]
# replace -999 missing values with NA
pollu_2013 <- pollu_2013 %>% replace_with_na(replace = list(H1 = -999, H2 = -999, H3 = -999, 
                                                            H4 = -999, H5 = -999, H6 = -999,
                                                            H7 = -999, H8 = -999, H9 = -999, 
                                                            H10 = -999, H11 = -999, H12 = -999, 
                                                            H13 = -999, H14 = -999, H15 = -999,
                                                            H16 = -999, H17 = -999, H18 = -999, 
                                                            H19 = -999,  H20 = -999, H21 = -999,
                                                            H22 = -999, H23 = -999, H24 = -999))
# replace NA with 0
pollu_2013[is.na(pollu_2013)] <- 0
# Add column for average 
pollu_2013 <- pollu_2013 %>% mutate(Mean = rowMeans(pollu_2013[ ,c(4:27)], na.rm=TRUE))
# Add column for Year
pollu_2013 <- pollu_2013 %>% mutate(Year = "2013")
# Remove hourly data columns
pollu_2013 <- pollu_2013 %>% select("Pollutant", "City", "Date", "Mean", "Year")

## 2012 Data
colnames(CO_2012) <- my_column_names
colnames(NO_2012) <- my_column_names
colnames(NO2_2012) <- my_column_names
colnames(O3_2012) <- my_column_names
colnames(SO2_2012) <- my_column_names
# combine data
pollu_2012 <- rbind(CO_2012, NO_2012, NO2_2012, O3_2012, SO2_2012)
# change column names
colnames(pollu_2012) <- my_column_names
# select variables
pollu_2012 <- pollu_2012 %>% select("Pollutant", "City", "Date", "H1",
                                    "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12",
                                    "H13", "H14", "H15", "H16", "H17", "H18", "H19", "H20", "H21", "H22", "H23", 
                                    "H24")
# filter for Toronto
pollu_2012 <- pollu_2012 %>% filter(City == "Toronto")
# remove duplicate dates
unique_rows <- !duplicated(pollu_2012[c("Pollutant", "Date")])
pollu_2012 <- pollu_2012[unique_rows,]
# replace -999 missing values with NA
pollu_2012 <- pollu_2012 %>% replace_with_na(replace = list(H1 = -999, H2 = -999, H3 = -999, 
                                                            H4 = -999, H5 = -999, H6 = -999,
                                                            H7 = -999, H8 = -999, H9 = -999, 
                                                            H10 = -999, H11 = -999, H12 = -999, 
                                                            H13 = -999, H14 = -999, H15 = -999,
                                                            H16 = -999, H17 = -999, H18 = -999, 
                                                            H19 = -999,  H20 = -999, H21 = -999,
                                                            H22 = -999, H23 = -999, H24 = -999))
# replace NA with 0
pollu_2012[is.na(pollu_2012)] <- 0
# Add column for average 
pollu_2012 <- pollu_2012 %>% mutate(Mean = rowMeans(pollu_2012[ ,c(4:27)], na.rm=TRUE))
# Add column for Year
pollu_2012 <- pollu_2012 %>% mutate(Year = "2012")
# Remove hourly data columns
pollu_2012 <- pollu_2012 %>% select("Pollutant", "City", "Date", "Mean", "Year")

## 2011 Data

colnames(CO_2011) <- my_column_names
colnames(NO_2011) <- my_column_names
colnames(NO2_2011) <- my_column_names
colnames(O3_2011) <- my_column_names
colnames(SO2_2011) <- my_column_names
# combine data
pollu_2011 <- rbind(CO_2011, NO_2011, NO2_2011, O3_2011, SO2_2011)
# change column names
colnames(pollu_2011) <- my_column_names
# select variables
pollu_2011 <- pollu_2011 %>% select("Pollutant", "City", "Date", "H1",
                                    "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12",
                                    "H13", "H14", "H15", "H16", "H17", "H18", "H19", "H20", "H21", "H22", "H23", 
                                    "H24")
# filter for Toronto
pollu_2011 <- pollu_2011 %>% filter(City == "Toronto")
# remove duplicate dates
unique_rows <- !duplicated(pollu_2011[c("Pollutant", "Date")])
pollu_2011 <- pollu_2011[unique_rows,]
# replace -999 missing values with NA
pollu_2011 <- pollu_2011 %>% replace_with_na(replace = list(H1 = -999, H2 = -999, H3 = -999, 
                                                            H4 = -999, H5 = -999, H6 = -999,
                                                            H7 = -999, H8 = -999, H9 = -999, 
                                                            H10 = -999, H11 = -999, H12 = -999, 
                                                            H13 = -999, H14 = -999, H15 = -999,
                                                            H16 = -999, H17 = -999, H18 = -999, 
                                                            H19 = -999,  H20 = -999, H21 = -999,
                                                            H22 = -999, H23 = -999, H24 = -999))
# replace NA with 0
pollu_2011[is.na(pollu_2011)] <- 0
# Add column for average 
pollu_2011 <- pollu_2011 %>% mutate(Mean = rowMeans(pollu_2011[ ,c(4:27)], na.rm=TRUE))
# Add column for Year
pollu_2011 <- pollu_2011 %>% mutate(Year = "2011")
# Remove hourly data columns
pollu_2011 <- pollu_2011 %>% select("Pollutant", "City", "Date", "Mean", "Year")

## 2010 Data

colnames(CO_2010) <- my_column_names
colnames(NO_2010) <- my_column_names
colnames(NO2_2010) <- my_column_names
colnames(O3_2010) <- my_column_names
colnames(SO2_2010) <- my_column_names
# combine data
pollu_2010 <- rbind(CO_2010, NO_2010, NO2_2010, O3_2010, SO2_2010)
# change column names
colnames(pollu_2010) <- my_column_names
# select variables
pollu_2010 <- pollu_2010 %>% select("Pollutant", "City", "Date", "H1",
                                    "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12",
                                    "H13", "H14", "H15", "H16", "H17", "H18", "H19", "H20", "H21", "H22", "H23", 
                                    "H24")
# filter for Toronto
pollu_2010 <- pollu_2010 %>% filter(City == "Toronto")
# remove duplicate dates
unique_rows <- !duplicated(pollu_2010[c("Pollutant", "Date")])
pollu_2010 <- pollu_2010[unique_rows,]
# replace -999 missing values with NA
pollu_2010 <- pollu_2010 %>% replace_with_na(replace = list(H1 = -999, H2 = -999, H3 = -999, 
                                                            H4 = -999, H5 = -999, H6 = -999,
                                                            H7 = -999, H8 = -999, H9 = -999, 
                                                            H10 = -999, H11 = -999, H12 = -999, 
                                                            H13 = -999, H14 = -999, H15 = -999,
                                                            H16 = -999, H17 = -999, H18 = -999, 
                                                            H19 = -999,  H20 = -999, H21 = -999,
                                                            H22 = -999, H23 = -999, H24 = -999))
# replace NA with 0
pollu_2010[is.na(pollu_2010)] <- 0
# Add column for average 
pollu_2010 <- pollu_2010 %>% mutate(Mean = rowMeans(pollu_2010[ ,c(4:27)], na.rm=TRUE))
# Add column for Year
pollu_2010 <- pollu_2010 %>% mutate(Year = "2010")
# Remove hourly data columns
pollu_2010 <- pollu_2010 %>% select("Pollutant", "City", "Date", "Mean", "Year")

## 2009 Data
colnames(CO_2009) <- my_column_names
colnames(NO_2009) <- my_column_names
colnames(NO2_2009) <- my_column_names
colnames(O3_2009) <- my_column_names
colnames(SO2_2009) <- my_column_names
# combine data
pollu_2009 <- rbind(CO_2009, NO_2009, NO2_2009, O3_2009, SO2_2009)
# change column names
colnames(pollu_2009) <- my_column_names
# select variables
pollu_2009 <- pollu_2009 %>% select("Pollutant", "City", "Date", "H1",
                                    "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12",
                                    "H13", "H14", "H15", "H16", "H17", "H18", "H19", "H20", "H21", "H22", "H23", 
                                    "H24")
# filter for Toronto
pollu_2009 <- pollu_2009 %>% filter(City == "Toronto")
# remove duplicate dates
unique_rows <- !duplicated(pollu_2009[c("Pollutant", "Date")])
pollu_2009 <- pollu_2009[unique_rows,]
# replace -999 missing values with NA
pollu_2009 <- pollu_2009 %>% replace_with_na(replace = list(H1 = -999, H2 = -999, H3 = -999, 
                                                            H4 = -999, H5 = -999, H6 = -999,
                                                            H7 = -999, H8 = -999, H9 = -999, 
                                                            H10 = -999, H11 = -999, H12 = -999, 
                                                            H13 = -999, H14 = -999, H15 = -999,
                                                            H16 = -999, H17 = -999, H18 = -999, 
                                                            H19 = -999,  H20 = -999, H21 = -999,
                                                            H22 = -999, H23 = -999, H24 = -999))
# replace NA with 0
pollu_2009[is.na(pollu_2009)] <- 0
# Add column for average 
pollu_2009 <- pollu_2009 %>% mutate(Mean = rowMeans(pollu_2009[ ,c(4:27)], na.rm=TRUE))
# Add column for Year
pollu_2009 <- pollu_2009 %>% mutate(Year = "2009")
# Remove hourly data columns
pollu_2009 <- pollu_2009 %>% select("Pollutant", "City", "Date", "Mean", "Year")

## 2008 Data

colnames(CO_2008) <- my_column_names
colnames(NO_2008) <- my_column_names
colnames(NO2_2008) <- my_column_names
colnames(O3_2008) <- my_column_names
colnames(SO2_2008) <- my_column_names
# combine data
pollu_2008 <- rbind(CO_2008, NO_2008, NO2_2008, O3_2008, SO2_2008)
# change column names
colnames(pollu_2008) <- my_column_names
# select variables
pollu_2008 <- pollu_2008 %>% select("Pollutant", "City", "Date", "H1",
                                    "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12",
                                    "H13", "H14", "H15", "H16", "H17", "H18", "H19", "H20", "H21", "H22", "H23", 
                                    "H24")
# filter for Toronto
pollu_2008 <- pollu_2008 %>% filter(City == "Toronto")
# remove duplicate dates
unique_rows <- !duplicated(pollu_2008[c("Pollutant", "Date")])
pollu_2008 <- pollu_2008[unique_rows,]
# replace -999 missing values with NA
pollu_2008 <- pollu_2008 %>% replace_with_na(replace = list(H1 = -999, H2 = -999, H3 = -999, 
                                                            H4 = -999, H5 = -999, H6 = -999,
                                                            H7 = -999, H8 = -999, H9 = -999, 
                                                            H10 = -999, H11 = -999, H12 = -999, 
                                                            H13 = -999, H14 = -999, H15 = -999,
                                                            H16 = -999, H17 = -999, H18 = -999, 
                                                            H19 = -999,  H20 = -999, H21 = -999,
                                                            H22 = -999, H23 = -999, H24 = -999))
# replace NA with 0
pollu_2008[is.na(pollu_2008)] <- 0
# Add column for average 
pollu_2008 <- pollu_2008 %>% mutate(Mean = rowMeans(pollu_2008[ ,c(4:27)], na.rm=TRUE))
# Add column for Year
pollu_2008 <- pollu_2008 %>% mutate(Year = "2008")
# Remove hourly data columns
pollu_2008 <- pollu_2008 %>% select("Pollutant", "City", "Date", "Mean", "Year")

## 2007 Data

colnames(CO_2007) <- my_column_names
colnames(NO_2007) <- my_column_names
colnames(NO2_2007) <- my_column_names
colnames(O3_2007) <- my_column_names
colnames(SO2_2007) <- my_column_names
# combine data
pollu_2007 <- rbind(CO_2007, NO_2007, NO2_2007, O3_2007, SO2_2007)
# change column names
colnames(pollu_2007) <- my_column_names
# select variables
pollu_2007 <- pollu_2007 %>% select("Pollutant", "City", "Date", "H1",
                                    "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12",
                                    "H13", "H14", "H15", "H16", "H17", "H18", "H19", "H20", "H21", "H22", "H23", 
                                    "H24")
# filter for Toronto
pollu_2007 <- pollu_2007 %>% filter(City == "Toronto")
# remove duplicate dates
unique_rows <- !duplicated(pollu_2007[c("Pollutant", "Date")])
pollu_2007 <- pollu_2007[unique_rows,]
# replace -999 missing values with NA
pollu_2007 <- pollu_2007 %>% replace_with_na(replace = list(H1 = -999, H2 = -999, H3 = -999, 
                                                            H4 = -999, H5 = -999, H6 = -999,
                                                            H7 = -999, H8 = -999, H9 = -999, 
                                                            H10 = -999, H11 = -999, H12 = -999, 
                                                            H13 = -999, H14 = -999, H15 = -999,
                                                            H16 = -999, H17 = -999, H18 = -999, 
                                                            H19 = -999,  H20 = -999, H21 = -999,
                                                            H22 = -999, H23 = -999, H24 = -999))
# replace NA with 0
pollu_2007[is.na(pollu_2007)] <- 0
# Add column for average 
pollu_2007 <- pollu_2007 %>% mutate(Mean = rowMeans(pollu_2007[ ,c(4:27)], na.rm=TRUE))
# Add column for Year
pollu_2007 <- pollu_2007 %>% mutate(Year = "2007")
# Remove hourly data columns
pollu_2007 <- pollu_2007 %>% select("Pollutant", "City", "Date", "Mean", "Year")


## 2006 Data

colnames(CO_2006) <- my_column_names
colnames(NO_2006) <- my_column_names
colnames(NO2_2006) <- my_column_names
colnames(O3_2006) <- my_column_names
colnames(SO2_2006) <- my_column_names
# combine data
pollu_2006 <- rbind(CO_2006, NO_2006, NO2_2006, O3_2006, SO2_2006)
# change column names
colnames(pollu_2006) <- my_column_names
# select variables
pollu_2006 <- pollu_2006 %>% select("Pollutant", "City", "Date", "H1",
                                    "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12",
                                    "H13", "H14", "H15", "H16", "H17", "H18", "H19", "H20", "H21", "H22", "H23", 
                                    "H24")
# filter for Toronto
pollu_2006 <- pollu_2006 %>% filter(City == "Toronto")
# remove duplicate dates
unique_rows <- !duplicated(pollu_2006[c("Pollutant", "Date")])
pollu_2006 <- pollu_2006[unique_rows,]
# replace -999 missing values with NA
pollu_2006 <- pollu_2006 %>% replace_with_na(replace = list(H1 = -999, H2 = -999, H3 = -999, 
                                                            H4 = -999, H5 = -999, H6 = -999,
                                                            H7 = -999, H8 = -999, H9 = -999, 
                                                            H10 = -999, H11 = -999, H12 = -999, 
                                                            H13 = -999, H14 = -999, H15 = -999,
                                                            H16 = -999, H17 = -999, H18 = -999, 
                                                            H19 = -999,  H20 = -999, H21 = -999,
                                                            H22 = -999, H23 = -999, H24 = -999))
# replace NA with 0
pollu_2006[is.na(pollu_2006)] <- 0
# Add column for average 
pollu_2006 <- pollu_2006 %>% mutate(Mean = rowMeans(pollu_2006[ ,c(4:27)], na.rm=TRUE))
# Add column for Year
pollu_2006 <- pollu_2006 %>% mutate(Year = "2006")
# Remove hourly data columns
pollu_2006 <- pollu_2006 %>% select("Pollutant", "City", "Date", "Mean", "Year")

## 2005 Data

colnames(CO_2005) <- my_column_names
colnames(NO_2005) <- my_column_names
colnames(NO2_2005) <- my_column_names
colnames(O3_2005) <- my_column_names
colnames(SO2_2005) <- my_column_names
# combine data
pollu_2005 <- rbind(CO_2005, NO_2005, NO2_2005, O3_2005, SO2_2005)
# change column names
colnames(pollu_2005) <- my_column_names
# select variables
pollu_2005 <- pollu_2005 %>% select("Pollutant", "City", "Date", "H1",
                                    "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12",
                                    "H13", "H14", "H15", "H16", "H17", "H18", "H19", "H20", "H21", "H22", "H23", 
                                    "H24")
# filter for Toronto
pollu_2005 <- pollu_2005 %>% filter(City == "Toronto")
# remove duplicate dates
unique_rows <- !duplicated(pollu_2005[c("Pollutant", "Date")])
pollu_2005 <- pollu_2005[unique_rows,]
# replace -999 missing values with NA
pollu_2005 <- pollu_2005 %>% replace_with_na(replace = list(H1 = -999, H2 = -999, H3 = -999, 
                                                            H4 = -999, H5 = -999, H6 = -999,
                                                            H7 = -999, H8 = -999, H9 = -999, 
                                                            H10 = -999, H11 = -999, H12 = -999, 
                                                            H13 = -999, H14 = -999, H15 = -999,
                                                            H16 = -999, H17 = -999, H18 = -999, 
                                                            H19 = -999,  H20 = -999, H21 = -999,
                                                            H22 = -999, H23 = -999, H24 = -999))
# replace NA with 0
pollu_2005[is.na(pollu_2005)] <- 0
# Add column for average 
pollu_2005 <- pollu_2005 %>% mutate(Mean = rowMeans(pollu_2005[ ,c(4:27)], na.rm=TRUE))
# Add column for Year
pollu_2005 <- pollu_2005 %>% mutate(Year = "2005")
# Remove hourly data columns
pollu_2005 <- pollu_2005 %>% select("Pollutant", "City", "Date", "Mean", "Year")

## 2004 Data

colnames(CO_2004) <- my_column_names
colnames(NO_2004) <- my_column_names
colnames(NO2_2004) <- my_column_names
colnames(O3_2004) <- my_column_names
colnames(SO2_2004) <- my_column_names
# combine data
pollu_2004 <- rbind(CO_2004, NO_2004, NO2_2004, O3_2004, SO2_2004)
# change column names
colnames(pollu_2004) <- my_column_names
# select variables
pollu_2004 <- pollu_2004 %>% select("Pollutant", "City", "Date", "H1",
                                    "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12",
                                    "H13", "H14", "H15", "H16", "H17", "H18", "H19", "H20", "H21", "H22", "H23", 
                                    "H24")
# filter for Toronto
pollu_2004 <- pollu_2004 %>% filter(City == "Toronto")
# remove duplicate dates
unique_rows <- !duplicated(pollu_2004[c("Pollutant", "Date")])
pollu_2004 <- pollu_2004[unique_rows,]
# replace -999 missing values with NA
pollu_2004 <- pollu_2004 %>% replace_with_na(replace = list(H1 = -999, H2 = -999, H3 = -999, 
                                                            H4 = -999, H5 = -999, H6 = -999,
                                                            H7 = -999, H8 = -999, H9 = -999, 
                                                            H10 = -999, H11 = -999, H12 = -999, 
                                                            H13 = -999, H14 = -999, H15 = -999,
                                                            H16 = -999, H17 = -999, H18 = -999, 
                                                            H19 = -999,  H20 = -999, H21 = -999,
                                                            H22 = -999, H23 = -999, H24 = -999))
# replace NA with 0
pollu_2004[is.na(pollu_2004)] <- 0
# Add column for average 
pollu_2004 <- pollu_2004 %>% mutate(Mean = rowMeans(pollu_2004[ ,c(4:27)], na.rm=TRUE))
# Add column for Year
pollu_2004 <- pollu_2004 %>% mutate(Year = "2004")
# Remove hourly data columns
pollu_2004 <- pollu_2004 %>% select("Pollutant", "City", "Date", "Mean", "Year")


## 2003 Data

colnames(CO_2003) <- my_column_names
colnames(NO_2003) <- my_column_names
colnames(NO2_2003) <- my_column_names
colnames(O3_2003) <- my_column_names
colnames(SO2_2003) <- my_column_names
# combine data
pollu_2003 <- rbind(CO_2003, NO_2003, NO2_2003, O3_2003, SO2_2003)
# change column names
colnames(pollu_2003) <- my_column_names
# select variables
pollu_2003 <- pollu_2003 %>% select("Pollutant", "City", "Date", "H1",
                                    "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12",
                                    "H13", "H14", "H15", "H16", "H17", "H18", "H19", "H20", "H21", "H22", "H23", 
                                    "H24")
# filter for Toronto
pollu_2003 <- pollu_2003 %>% filter(City == "Toronto")
# remove duplicate dates
unique_rows <- !duplicated(pollu_2003[c("Pollutant", "Date")])
pollu_2003 <- pollu_2003[unique_rows,]
# replace -999 missing values with NA
pollu_2003 <- pollu_2003 %>% replace_with_na(replace = list(H1 = -999, H2 = -999, H3 = -999, 
                                                            H4 = -999, H5 = -999, H6 = -999,
                                                            H7 = -999, H8 = -999, H9 = -999, 
                                                            H10 = -999, H11 = -999, H12 = -999, 
                                                            H13 = -999, H14 = -999, H15 = -999,
                                                            H16 = -999, H17 = -999, H18 = -999, 
                                                            H19 = -999,  H20 = -999, H21 = -999,
                                                            H22 = -999, H23 = -999, H24 = -999))
# replace NA with 0
pollu_2003[is.na(pollu_2003)] <- 0
# Add column for average 
pollu_2003 <- pollu_2003 %>% mutate(Mean = rowMeans(pollu_2003[ ,c(4:27)], na.rm=TRUE))
# Add column for Year
pollu_2003 <- pollu_2003 %>% mutate(Year = "2003")
# Remove hourly data columns
pollu_2003 <- pollu_2003 %>% select("Pollutant", "City", "Date", "Mean", "Year")


## 2002 Data

colnames(CO_2002) <- my_column_names
colnames(NO_2002) <- my_column_names
colnames(NO2_2002) <- my_column_names
colnames(O3_2002) <- my_column_names
colnames(SO2_2002) <- my_column_names
# combine data
pollu_2002 <- rbind(CO_2002, NO_2002, NO2_2002, O3_2002, SO2_2002)
# change column names
colnames(pollu_2002) <- my_column_names
# select variables
pollu_20032 <- pollu_2002 %>% select("Pollutant", "City", "Date", "H1",
                                     "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12",
                                     "H13", "H14", "H15", "H16", "H17", "H18", "H19", "H20", "H21", "H22", "H23", 
                                     "H24")
# filter for Toronto
pollu_2002 <- pollu_2002 %>% filter(City == "Toronto")
# remove duplicate dates
unique_rows <- !duplicated(pollu_2002[c("Pollutant", "Date")])
pollu_2002 <- pollu_2002[unique_rows,]
# replace -999 missing values with NA
pollu_2002 <- pollu_2002 %>% replace_with_na(replace = list(H1 = -999, H2 = -999, H3 = -999, 
                                                            H4 = -999, H5 = -999, H6 = -999,
                                                            H7 = -999, H8 = -999, H9 = -999, 
                                                            H10 = -999, H11 = -999, H12 = -999, 
                                                            H13 = -999, H14 = -999, H15 = -999,
                                                            H16 = -999, H17 = -999, H18 = -999, 
                                                            H19 = -999,  H20 = -999, H21 = -999,
                                                            H22 = -999, H23 = -999, H24 = -999))
# replace NA with 0
pollu_2002[is.na(pollu_2002)] <- 0
# Add column for average 
pollu_2002 <- pollu_2002 %>% mutate(Mean = rowMeans(pollu_2002[ ,c(4:27)], na.rm=TRUE))
# Add column for Year
pollu_2002 <- pollu_2002 %>% mutate(Year = "2002")
# Remove hourly data columns
pollu_2002 <- pollu_2002 %>% select("Pollutant", "City", "Date", "Mean", "Year")



## Combine pollution data
pollution <- rbind(pollu_2002, pollu_2003, pollu_2004, pollu_2005, pollu_2006, pollu_2007, pollu_2008, pollu_2009, pollu_2010, pollu_2011, pollu_2012, pollu_2013, pollu_2014, pollu_2015, pollu_2016, 
                   pollu_2017, pollu_2018, pollu_2019, pollu_2020)

# Save pollution data 2002-2020
write_csv(
  x = pollution,
  file = "~/Desktop/SUDS2022/inputs/data/clean_temp_data/pollution_2002_2020.csv"
)


#### Combine Temperature and Pollution Data ----

