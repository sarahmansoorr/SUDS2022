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

# Lowest and highest points
r <- temp_2002_2022 %>% filter((month_name == "Dec" | month_name == "Jan"| 
                            month_name == "Feb" | month_name == "Mar") & year == 2015) %>% select(max_temp)
range(r)
"-19.2  14.4"

r <- temp_2002_2022 %>% filter((month_name == "Dec" | month_name == "Jan"| 
                                  month_name == "Feb" | month_name == "Mar") & year == 2012) %>% select(max_temp)
range(r)
"-10.4  24.3"

r <- temp_2002_2022 %>% filter((month_name == "Apr" | month_name == "May" | 
                                  month_name == "Jun" | month_name == "Jul") & year == 2003) %>% select(max_temp)
range(r)
"-2.4 33.6"

r <- temp_2002_2022 %>% filter((month_name == "Apr" | month_name == "May" | 
                                  month_name == "Jun" | month_name == "Jul") & year == 2011) %>% select(max_temp)
range(r)
"3.3 38.2"

r <- temp_2002_2022 %>% filter((month_name == "Aug" | month_name == "Sep" | 
                                  month_name == "Oct" | month_name == "Nov") & year == 2018) %>% select(max_temp)
range(r)
"-5.1 32.3"

r <- temp_2002_2022 %>% filter((month_name == "Aug" | month_name == "Sep" | 
                                  month_name == "Oct" | month_name == "Nov") & year == 2006) %>% select(max_temp)
range(r)
"2.0 36.8"

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

pollution1 <- pollution %>%
  mutate(month_name = factor(month_name, levels = c("Jan", "Feb","Mar", 
                                                    "Apr", "May", "Jun", "Jul", 
                                                    "Aug","Sep", "Oct", 
                                                    "Nov",  "Dec")))


# Lowest and highest points
r <- pollution %>% filter((pollutant == "NO")) %>% select(mean_pollution)
range(r)
#  0.0000 150.2917

r <- pollution %>% filter((pollutant == "NO2")) %>% select(mean_pollution)
range(r)
#  0 65

r <- pollution %>% filter((pollutant == "O3")) %>% select(mean_pollution)
range(r)
# 0.00000 65.95833

r <- pollution %>% filter((pollutant == "SO2")) %>% select(mean_pollution)
range(r)
# -0.02500 22.79167

r <- pollution %>% filter((pollutant == "CO")) %>% select(mean_pollution)
range(r)
0.0000 1.7625

## Pollution and Temperature ----

#Visualizing Mean pollution by temperature and pollutant and month

pollu_temp %>% filter(pollutant != "CO" & pollutant != "SO2" & 
  (month_name == "Dec" | month_name == "Jan"| month_name == "Feb" | 
  month_name == "Mar")) %>% ggplot(aes(max_temp, mean_pollution, 
  color=month_name)) + geom_point() + facet_grid(. ~ pollutant) + 
  labs(color="Month") + xlab("Maximum Temperature") + 
  ylab("Mean Pollution")

pollu_temp %>% filter((pollutant == "CO" | pollutant == "SO2") & 
  (month_name == "Dec" | month_name == "Jan"| month_name == "Feb" | 
  month_name == "Mar")) %>% ggplot(aes(max_temp, mean_pollution, 
  color=month_name)) + geom_point() + facet_grid(. ~ pollutant) + 
  labs(color="Month") + xlab("Maximum Temperature") + 
  ylab("Mean Pollution")

pollu_temp %>% filter(pollutant != "CO" & pollutant != "SO2" & 
                        (month_name == "Apr" | month_name == "May" | 
                           month_name == "Jun" | month_name == "Jul")) %>% ggplot(aes(max_temp, mean_pollution, 
                                                                color=month_name)) + geom_point() + facet_grid(. ~ pollutant) + 
  labs(color="Month") + xlab("Maximum Temperature") + 
  ylab("Mean Pollution")

pollu_temp %>% filter((pollutant == "CO" | pollutant == "SO2") & 
                        (month_name == "Apr" | month_name == "May" | 
                           month_name == "Jun" | month_name == "Jul")) %>% ggplot(aes(max_temp, mean_pollution, 
                                                                color=month_name)) + geom_point() + facet_grid(. ~ pollutant) + 
  labs(color="Month") + xlab("Maximum Temperature") + 
  ylab("Mean Pollution")


pollu_temp %>% filter(pollutant != "CO" & pollutant != "SO2" & 
                        (month_name == "Aug" | month_name == "Sep" | 
                           month_name == "Oct" | month_name == "Nov")) %>% ggplot(aes(max_temp, mean_pollution, 
                                                                                      color=month_name)) + geom_point() + facet_grid(. ~ pollutant) + 
  labs(color="Month") + xlab("Maximum Temperature") + 
  ylab("Mean Pollution")

pollu_temp %>% filter((pollutant == "CO" | pollutant == "SO2") & 
                        (month_name == "Aug" | month_name == "Sep" | 
                           month_name == "Oct" | month_name == "Nov")) %>% ggplot(aes(max_temp, mean_pollution, 
                                                                                      color=month_name)) + geom_point() + facet_grid(. ~ pollutant) + 
  labs(color="Month") + xlab("Maximum Temperature") + 
  ylab("Mean Pollution")

### Models ----



### Anova Tests ----

### t-tests ----