#### Preamble ####
# Purpose: Download the data 
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
library(readr)


#### Load temperature datasets ####
temp_jan_may_2022 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/en_climate_daily_ON_6158355_2022_P1D.csv")
temp_jan_dec_2021 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/en_climate_daily_ON_6158355_2021_P1D.csv")
temp_jan_dec_2020 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/en_climate_daily_ON_6158355_2020_P1D.csv")
temp_jan_dec_2019 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/en_climate_daily_ON_6158355_2019_P1D.csv")
temp_jan_dec_2018 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/en_climate_daily_ON_6158355_2018_P1D.csv")
temp_jan_dec_2017 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/en_climate_daily_ON_6158355_2017_P1D.csv")
temp_jan_dec_2016 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/en_climate_daily_ON_6158355_2016_P1D.csv")
temp_jan_dec_2015 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/en_climate_daily_ON_6158355_2015_P1D.csv")
temp_jan_dec_2014 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/en_climate_daily_ON_6158355_2014_P1D.csv")
temp_jan_dec_2013 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/en_climate_daily_ON_6158355_2013_P1D.csv")
temp_jan_may_2012 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/en_climate_daily_ON_6158355_2012_P1D.csv")
temp_jan_dec_2011 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/en_climate_daily_ON_6158355_2011_P1D.csv")
temp_jan_dec_2010 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/en_climate_daily_ON_6158355_2010_P1D.csv")
temp_jan_dec_2009 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/en_climate_daily_ON_6158355_2009_P1D.csv")
temp_jan_dec_2008 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/en_climate_daily_ON_6158355_2008_P1D.csv")
temp_jan_dec_2007 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/en_climate_daily_ON_6158355_2007_P1D.csv")
temp_jan_dec_2006 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/en_climate_daily_ON_6158355_2006_P1D.csv")
temp_jan_dec_2005 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/en_climate_daily_ON_6158355_2005_P1D.csv")
temp_jan_dec_2004 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/en_climate_daily_ON_6158355_2004_P1D.csv")
temp_jan_dec_2003 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/en_climate_daily_ON_6158355_2003_P1D.csv")
temp_jan_dec_2002 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/en_climate_daily_ON_6158355_2002_P1D.csv")

# Rename files to be more readable
file.rename("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2022_P1D.csv", "~/Desktop/SUDS2022/inputs/data/temp_jan_may_2022.csv")
file.rename("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2021_P1D.csv", "~/Desktop/SUDS2022/inputs/data/temp_jan_dec_2021.csv")
file.rename("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2020_P1D.csv", "~/Desktop/SUDS2022/inputs/data/temp_jan_dec_2020.csv")
file.rename("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2019_P1D.csv", "~/Desktop/SUDS2022/inputs/data/temp_jan_dec_2019.csv")
file.rename("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2018_P1D.csv", "~/Desktop/SUDS2022/inputs/data/temp_jan_dec_2018.csv")
file.rename("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2017_P1D.csv", "~/Desktop/SUDS2022/inputs/data/temp_jan_dec_2017.csv")
file.rename("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2016_P1D.csv", "~/Desktop/SUDS2022/inputs/data/temp_jan_dec_2016.csv")
file.rename("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2015_P1D.csv", "~/Desktop/SUDS2022/inputs/data/temp_jan_dec_2015.csv")
file.rename("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2014_P1D.csv", "~/Desktop/SUDS2022/inputs/data/temp_jan_dec_2014.csv")
file.rename("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2013_P1D.csv", "~/Desktop/SUDS2022/inputs/data/temp_jan_dec_2013.csv")
file.rename("~/Desktop/SUDS2022/inputs/data/temp_jan_may_2012.csv", "~/Desktop/SUDS2022/inputs/data/temp_jan_dec_2012.csv")
file.rename("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2011_P1D.csv", "~/Desktop/SUDS2022/inputs/data/temp_jan_dec_2011.csv")
file.rename("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2010_P1D.csv", "~/Desktop/SUDS2022/inputs/data/temp_jan_dec_2010.csv")
file.rename("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2009_P1D.csv", "~/Desktop/SUDS2022/inputs/data/temp_jan_dec_2009.csv")
file.rename("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2008_P1D.csv", "~/Desktop/SUDS2022/inputs/data/temp_jan_dec_2008.csv")
file.rename("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2007_P1D.csv", "~/Desktop/SUDS2022/inputs/data/temp_jan_dec_2007.csv")
file.rename("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2006_P1D.csv", "~/Desktop/SUDS2022/inputs/data/temp_jan_dec_2006.csv")
file.rename("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2005_P1D.csv", "~/Desktop/SUDS2022/inputs/data/temp_jan_dec_2005.csv")
file.rename("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2004_P1D.csv", "~/Desktop/SUDS2022/inputs/data/temp_jan_dec_2004.csv")
file.rename("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2003_P1D.csv", "~/Desktop/SUDS2022/inputs/data/temp_jan_dec_2003.csv")
file.rename("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2002_P1D.csv", "~/Desktop/SUDS2022/inputs/data/temp_jan_dec_2002.csv")


#


#### Load pollution datasets ####


pollution_2020 <- read_csv("inputs/data/raw_pollution_data/2020_Means_EN.csv", 
                           skip = 16)
pollution_2019 <- read_csv("inputs/data/raw_pollution_data/2019_Means_EN.csv", 
                           skip = 16)
pollution_2018 <- read_csv("inputs/data/raw_pollution_data/2018_Means_EN.csv", 
                           skip = 16)
pollution_2017 <- read_csv("inputs/data/raw_pollution_data/2017_Means_EN.csv", 
                           skip = 16)
pollution_2016 <- read_csv("inputs/data/raw_pollution_data/2016_Means_EN.csv", 
                           skip = 16)
pollution_2015 <- read_excel("inputs/data/raw_pollution_data/2015_Means.xls", 
                             sheet = "Means Report")
pollution_2014 <- read_excel("inputs/data/raw_pollution_data/2014_Means.xls", 
                             sheet = "Means Report")
pollution_2013 <- read_excel("inputs/data/raw_pollution_data/2013_Means.xls", 
                             sheet = "Means Report")
pollution_2012 <- read_excel("inputs/data/raw_pollution_data/2012_Means.xls", 
                             sheet = "Means Report")
pollution_2011 <- read_excel("inputs/data/raw_pollution_data/2011_Means.xls", 
                             sheet = "Means Report")


