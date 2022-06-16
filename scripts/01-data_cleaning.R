#### Preamble ####
# Purpose: Clean the data downloaded
# Author: Sarah Mansoor
# Date: May 2022
# Contact: sarah.mansoor@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the ACS data and saved it to inputs/data
# - Don't forget to gitignore it!


#### Workspace setup ####
# Use R Projects, not setwd().
library(tidyverse)
library(dplyr)
library(ggplot2)
library(janitor)

#### Cleaning Data ####

### Attach data
attach(temp_jan_dec_2002)
attach(temp_jan_dec_2003)
attach(temp_jan_dec_2004)
attach(temp_jan_dec_2005)
attach(temp_jan_dec_2006)
attach(temp_jan_dec_2007)
attach(temp_jan_dec_2008)
attach(temp_jan_dec_2009)
attach(temp_jan_dec_2010)
attach(temp_jan_dec_2011)
attach(temp_jan_dec_2012)
attach(temp_jan_dec_2013)
attach(temp_jan_dec_2014)
attach(temp_jan_dec_2015)
attach(temp_jan_dec_2016)
attach(temp_jan_dec_2017)
attach(temp_jan_dec_2018)
attach(temp_jan_dec_2019)
attach(temp_jan_dec_2020)
attach(temp_jan_dec_2021)
attach(temp_jan_may_2022)

# Combine 2002 - 2022 data
temp_2002_2022 <- rbind(temp_jan_dec_2002, temp_jan_dec_2003, temp_jan_dec_2004, 
                        temp_jan_dec_2005, temp_jan_dec_2006, temp_jan_dec_2007,
                        temp_jan_dec_2008, temp_jan_dec_2009, temp_jan_dec_2010,
                        temp_jan_dec_2011, temp_jan_dec_2012, temp_jan_dec_2013, 
                        temp_jan_dec_2014, temp_jan_dec_2015, temp_jan_dec_2016,
                        temp_jan_dec_2017, temp_jan_dec_2018, temp_jan_dec_2019,
                        temp_jan_dec_2020, temp_jan_dec_2021, temp_jan_may_2022)

temp_2012_2022 <- rbind(temp_jan_dec_2012, temp_jan_dec_2013, 
                        temp_jan_dec_2014, temp_jan_dec_2015, temp_jan_dec_2016,
                        temp_jan_dec_2017, temp_jan_dec_2018, temp_jan_dec_2019,
                        temp_jan_dec_2020, temp_jan_dec_2021, temp_jan_may_2022)


temp_2002_2022_5yr_interval <- rbind(temp_jan_dec_2002, temp_jan_dec_2007, 
                                     temp_jan_dec_2012, temp_jan_dec_2017, 
                                     temp_jan_may_2022)

temp_2002_2022_10yr_interval <- rbind(temp_jan_dec_2002,
                                     temp_jan_dec_2012,
                                     temp_jan_may_2022)

temp_2002_2022 <- temp_2002_2022 %>% select(Station.Name, Date.Time, Year, 
                                            Month, Day, Max.Temp...C., 
                                            Min.Temp...C., Mean.Temp...C., 
                                            Heat.Deg.Days...C., Cool.Deg.Days...C., 
                                            Total.Precip..mm.)

my_column_names <- c("station.name", "date", "year", "month", "day", "max.temp", "min.temp", 
                     "mean.temp", "heat.deg.days", "cool.deg.days", "total.percip.mm")

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

### Drop NA for max_temp
df <- temp_2002_2022
df <- df %>% drop_na(max_temp)
df <- df %>% drop_na(min_temp)
df <- df %>% drop_na(mean_temp)
df <- df %>% drop_na(total_percip_mm)

