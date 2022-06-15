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
                                            Total.Rain..mm., Total.Snow..cm.,
                                            Total.Precip..mm.)

my_column_names <- c("station.name", "date", "year", "month", "day", "max.temp", "min.temp", 
                     "mean.temp", "heat.deg.days", "cool.deg.days", "total.rain.mm", 
                     "total.snow.cm", "total.percip.mm")

colnames(temp_2002_2022) <- my_column_names
temp_2002_2022 <- clean_names(temp_2002_2022)

