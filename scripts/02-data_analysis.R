#### Preamble ####
# Purpose: Clean the tempreature and pollution data 
# Author: Sarah Mansoor
# Date: May 2022
# Contact: sarah.mansoor@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the ACS data and saved it to inputs/data
# - Don't forget to gitignore it!


#### Workspace setup ####
library(tidyverse)
library(knitr)
library(kableExtra)
library(ggplot2)
library(dplyr)

# Load temperature data
temperature_2002_2022 <- read.csv("~/Desktop/SUDS2022/inputs/data/
                                  clean_temp_data/temperature_2002_2022.csv")
# Load pollution data
poll_2011_2020 <- read.csv("~/Desktop/SUDS2022/inputs/data/
                           clean_pollution_data/pollution_2011_2020.csv")

### Plots ----

## Temperature ----

# Visualizing Temperature by Months
dec_mar <- temperature_2002_2022 %>%
  filter(month_name == "Dec" | month_name == "Jan" | month_name == "Feb" | month_name == "Mar")

ggplot(dec_mar, aes(x=year, y=max_temp, color=month_name)) + geom_point() + 
  labs(color="Month") + xlab("Year") + ylab("Maximum Temperature")

apr_jul <- temperature_2002_2022 %>%
  filter(month_name == "Apr" | month_name == "May" | month_name == "Jun" | month_name == "Jul")

ggplot(apr_jul, aes(x=year, y=max_temp, color=month_name)) + geom_point() + 
  labs(color="Month") + xlab("Year") + ylab("Maximum Temperature")

aug_nov <- temperature_2002_2022 %>%
  filter(month_name == "Aug" | month_name == "Sep" | month_name == "Oct" | month_name == "Nov")

ggplot(aug_nov, aes(x=year, y=max_temp, color=month_name)) + geom_point() + 
  labs(color="Month") + xlab("Year") + ylab("Maximum Temperature")


### Models ----

### Anova Tests ----

### t-tests ----