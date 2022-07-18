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

# Load temperature data ----
temperature_2002_2022 <- read.csv("~/Desktop/SUDS2022/inputs/data/
                                  clean_temp_data/temperature_2002_2022.csv")
# Load pollution data ----
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

# Visualizing Pollution by Year ----

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


# Lowest and highest points and means ----

r <- pollution %>% filter((pollutant == "NO")) %>% select(mean_pollution)
range(r)
#  0.0000 150.2917
mean(as.numeric(r$mean_pollution),na.rm=TRUE)
# 13.60186

r <- pollution %>% filter((pollutant == "NO2")) %>% select(mean_pollution)
range(r)
#  0 65
mean(as.numeric(r$mean_pollution),na.rm=TRUE)
# 14.97535

r <- pollution %>% filter((pollutant == "O3")) %>% select(mean_pollution)
range(r)
# 0.00000 65.95833
mean(as.numeric(r$mean_pollution),na.rm=TRUE)
# 22.98821

r <- pollution %>% filter((pollutant == "SO2")) %>% select(mean_pollution)
range(r)
# -0.02500 22.79167
mean(as.numeric(r$mean_pollution),na.rm=TRUE)
# 1.233524

r <- pollution %>% filter((pollutant == "CO")) %>% select(mean_pollution)
range(r)
# 0.0 1762.5
mean(as.numeric(r$mean_pollution),na.rm=TRUE)
# 254.4278


# Means of each pollutant in 5 year intervals ----

# NO

r <- pollution %>% filter((pollutant == "NO") & (year == 2002 | year == 2003 |
                                                 year == 2004 | year == 2005 | 
                                                   year == 2006)) %>% select(mean_pollution)
mean(as.numeric(r$mean_pollution),na.rm=TRUE)
# 15.04657

r <- pollution %>% filter((pollutant == "NO") & (year == 2007 | year == 2008 |
                                                   year == 2009 | year == 2010 | 
                                                   year == 2011)) %>% select(mean_pollution)
mean(as.numeric(r$mean_pollution),na.rm=TRUE)
# 8.573613

r <- pollution %>% filter((pollutant == "NO") & (year == 2012 | year == 2013 |
                                                   year == 2014 | year == 2015 | 
                                                   year == 2016)) %>% select(mean_pollution)
mean(as.numeric(r$mean_pollution),na.rm=TRUE)
# 5.852171

r <- pollution %>% filter((pollutant == "NO") & (year == 2017 | year == 2018 |
                                                   year == 2019 | year == 2020)) %>% select(mean_pollution)
mean(as.numeric(r$mean_pollution),na.rm=TRUE)
# 3.250599


# NO2

r <- pollution %>% filter((pollutant == "NO2") & (year == 2002 | year == 2003 |
                                                   year == 2004 | year == 2005 | 
                                                   year == 2006)) %>% select(mean_pollution)
mean(as.numeric(r$mean_pollution),na.rm=TRUE)
# 19.87938

r <- pollution %>% filter((pollutant == "NO2") & (year == 2007 | year == 2008 |
                                                   year == 2009 | year == 2010 | 
                                                   year == 2011)) %>% select(mean_pollution)
mean(as.numeric(r$mean_pollution),na.rm=TRUE)
# 15.56782

r <- pollution %>% filter((pollutant == "NO2") & (year == 2012 | year == 2013 |
                                                   year == 2014 | year == 2015 | 
                                                   year == 2016)) %>% select(mean_pollution)
mean(as.numeric(r$mean_pollution),na.rm=TRUE)
# 13.39803

r <- pollution %>% filter((pollutant == "NO2") & (year == 2017 | year == 2018 |
                                                   year == 2019 | year == 2020)) %>% select(mean_pollution)
mean(as.numeric(r$mean_pollution),na.rm=TRUE)
# 10.07811


# O3

r <- pollution %>% filter((pollutant == "O3") & (year == 2002 | year == 2003 |
                                                    year == 2004 | year == 2005 | 
                                                    year == 2006)) %>% select(mean_pollution)
mean(as.numeric(r$mean_pollution),na.rm=TRUE)
# 20.94733

r <- pollution %>% filter((pollutant == "O3") & (year == 2007 | year == 2008 |
                                                    year == 2009 | year == 2010 | 
                                                    year == 2011)) %>% select(mean_pollution)
mean(as.numeric(r$mean_pollution),na.rm=TRUE)
# 22.5484

r <- pollution %>% filter((pollutant == "O3") & (year == 2012 | year == 2013 |
                                                    year == 2014 | year == 2015 | 
                                                    year == 2016)) %>% select(mean_pollution)
mean(as.numeric(r$mean_pollution),na.rm=TRUE)
# 23.97225

r <- pollution %>% filter((pollutant == "O3") & (year == 2017 | year == 2018 |
                                                    year == 2019 | year == 2020)) %>% select(mean_pollution)
mean(as.numeric(r$mean_pollution),na.rm=TRUE)
# 24.85809


# SO2

r <- pollution %>% filter((pollutant == "SO2") & (year == 2002 | year == 2003 |
                                                   year == 2004 | year == 2005 | 
                                                   year == 2006)) %>% select(mean_pollution)
mean(as.numeric(r$mean_pollution),na.rm=TRUE)
# 2.476657

r <- pollution %>% filter((pollutant == "SO2") & (year == 2007 | year == 2008 |
                                                   year == 2009 | year == 2010 | 
                                                   year == 2011)) %>% select(mean_pollution)
mean(as.numeric(r$mean_pollution),na.rm=TRUE)
# 1.276447

r <- pollution %>% filter((pollutant == "SO2") & (year == 2012 | year == 2013 |
                                                   year == 2014 | year == 2015 | 
                                                   year == 2016)) %>% select(mean_pollution)
mean(as.numeric(r$mean_pollution),na.rm=TRUE)
# 0.6760719

r <- pollution %>% filter((pollutant == "SO2") & (year == 2017 | year == 2018 |
                                                   year == 2019 | year == 2020)) %>% select(mean_pollution)
mean(as.numeric(r$mean_pollution),na.rm=TRUE)
# 0.3232774


# CO

r <- pollution %>% filter((pollutant == "CO") & (year == 2002 | year == 2003 |
                                                    year == 2004 | year == 2005 | 
                                                    year == 2006)) %>% select(mean_pollution)
mean(as.numeric(r$mean_pollution),na.rm=TRUE)
# 314.0882

r <- pollution %>% filter((pollutant == "CO") & (year == 2007 | year == 2008 |
                                                    year == 2009 | year == 2010 | 
                                                    year == 2011)) %>% select(mean_pollution)
mean(as.numeric(r$mean_pollution),na.rm=TRUE)
# 223.6469

r <- pollution %>% filter((pollutant == "CO") & (year == 2012 | year == 2013 |
                                                    year == 2014 | year == 2015 | 
                                                    year == 2016)) %>% select(mean_pollution)
mean(as.numeric(r$mean_pollution),na.rm=TRUE)
# 244.8328

r <- pollution %>% filter((pollutant == "CO") & (year == 2017 | year == 2018 |
                                                    year == 2019 | year == 2020)) %>% select(mean_pollution)
mean(as.numeric(r$mean_pollution),na.rm=TRUE)
# 230.332


pollutants <- c("NO", "NO", "NO", "NO", 
                "NO2", "NO2", "NO2", "NO2",
                "O3", "O3", "O3", "O3", 
                "SO2", "SO2", "SO2", "SO2", 
                "CO", "CO", "CO", "CO")
year <- c("2002 to 2006", "2007 to 2011", "2012 to 2016", "2017 to 2020", 
          "2002 to 2006", "2007 to 2011", "2012 to 2016", "2017 to 2020",
          "2002 to 2006", "2007 to 2011", "2012 to 2016", "2017 to 2020", 
          "2002 to 2006", "2007 to 2011", "2012 to 2016", "2017 to 2020", 
          "2002 to 2006", "2007 to 2011", "2012 to 2016", "2017 to 2020")
means_pollutants <- c(15.05, 8.57, 5.85, 3.25,
                      19.88, 15.57, 13.40, 10.1,
                      20.95, 22.55, 23.97, 24.86, 
                      2.48, 1.28, 0.68, 0.32, 
                      314.1, 223.65, 244.83, 230.33)

df <- data.frame(pollutants, means_pollutants, year)
df %>%
  select(pollutants, means_pollutants, year) %>%
  kable(
    col.names=c("Pollutant", "Mean Pollution Level", "5-Year Interval"),
    linesep = "", digits = 2, booktabs=TRUE) %>%
  kable_styling(latex_options = "HOLD_position", font_size = 10)



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

model1 <- lm(max_temp ~ mean_pollution , pollu_temp)
summary(model1)
anova(model1)

model2 <- lm(mean_pollution ~ max_temp , pollu_temp)
summary(model2)
anova(model2)
plot(model2$residuals, pch = 10, col = "red")

model3 <- lm(mean_pollution ~ max_temp + min_temp + mean_temp , pollu_temp)
summary(model3)
anova(model3)
plot(model3$residuals, pch = 10, col = "red")

plot(pollu_temp$max_temp, pollu_temp$mean_pollution)

### Anova Tests ----

### t-tests ----