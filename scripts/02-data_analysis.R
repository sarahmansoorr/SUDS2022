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
temp_2002_2022 %>% filter(month_name == "Dec" | month_name == "Jan"| 
               month_name == "Feb" | month_name == "Mar") %>% ggplot(
              aes(x=year, y=max_temp, color=month_name)) + 
  geom_point() + labs(color="Month") + xlab("Year") + ylab("Maximum Temperature")

temp_2002_2022 %>% filter(month_name == "Apr" | month_name == "May" | 
                            month_name == "Jun" | month_name == "Jul") %>% ggplot(
                              aes(x=year, y=max_temp, color=month_name)) + 
  geom_point() + labs(color="Month") + xlab("Year") + ylab("Maximum Temperature")

temp_2002_2022 %>% filter(month_name == "Aug" | month_name == "Sep" | 
                            month_name == "Oct" | month_name == "Nov") %>% ggplot(
                              aes(x=year, y=max_temp, color=month_name)) + 
  geom_point() + labs(color="Month") + xlab("Year") + ylab("Maximum Temperature")

""


## Pollution ----

# Visualizing Pollution by Year 

pollution %>% filter(pollutant != "CO") %>% ggplot(
  aes(x = year, y = mean_pollution, color = pollutant)) + geom_point() + 
  labs(color="Pollutant") + xlab("Year") + ylab("Mean Pollution (ppb)")

pollution %>% filter(pollutant == "CO") %>% ggplot(
  aes(x = year, y = mean_pollution, color = pollutant)) + geom_point() + 
  labs(color="Pollutant") + xlab("Year") + ylab("Mean Pollution (ppm)")

# Visualizing Pollution by Month

pollution %>% filter(pollutant != "CO") %>% ggplot(
  aes(x = month_name, y = mean_pollution, color = pollutant)) + geom_point() + 
  labs(color="Pollutant") + xlab("Month") + ylab("Mean Pollution (ppb)")

pollution %>% filter(pollutant == "CO") %>% ggplot(
  aes(x = month_name, y = mean_pollution, color = pollutant)) + geom_point() + 
  labs(color="Pollutant") + xlab("Month") + ylab("Mean Pollution (ppm)")

## Pollution and Temperature ----

pollu_temp %>% filter(pollutant != "CO") %>% ggplot(aes(max_temp, 
                                                        mean, color=pollutant)) + geom_point() + 
  labs(color="Pollutant") + xlab("Maximum Temperature") + ylab("Mean Pollution")
pollu_temp %>% filter(pollutant == "CO") %>% ggplot(aes(max_temp, 
                                                        mean, color=pollutant)) + geom_point() + 
  labs(color="Pollutant") + xlab("Maximum Temperature") + ylab("Mean Pollution")

pollu_temp %>% filter(pollutant != "CO") %>% ggplot(aes(month_name, 
                                                        max_temp, color=pollutant)) + geom_point() + 
  labs(color="Pollutant") + xlab("Month") + ylab("Maximum Temperature")
pollu_temp %>% filter(pollutant == "CO") %>% ggplot(aes(month_name, 
                                                        max_temp, color=pollutant)) + geom_point() + 
  labs(color="Pollutant") + xlab("Month") + ylab("Maximum Temperature")

### Models ----

### Anova Tests ----

### t-tests ----