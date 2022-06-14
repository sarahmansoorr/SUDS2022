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

#### Load datasets ####
temp_jan_may_2022 <- read.csv("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2022_P1D")
temp_jan_dec_2021 <- read.csv("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2021_P1D.csv")
temp_jan_dec_2020 <- read.csv("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2020_P1D.csv")
temp_jan_dec_2019 <- read.csv("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2019_P1D.csv")
temp_jan_dec_2018 <- read.csv("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2018_P1D.csv")
temp_jan_dec_2017 <- read.csv("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2017_P1D.csv")
temp_jan_dec_2016 <- read.csv("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2016_P1D.csv")
temp_jan_dec_2015 <- read.csv("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2015_P1D.csv")
temp_jan_dec_2014 <- read.csv("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2014_P1D.csv")
temp_jan_dec_2013 <- read.csv("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2013_P1D.csv")
temp_jan_may_2012 <- read.csv("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2012_P1D.csv")
temp_jan_dec_2011 <- read.csv("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2011_P1D.csv")
temp_jan_dec_2010 <- read.csv("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2010_P1D.csv")
temp_jan_dec_2009 <- read.csv("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2009_P1D.csv")
temp_jan_dec_2008 <- read.csv("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2008_P1D.csv")
temp_jan_dec_2007 <- read.csv("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2007_P1D.csv")
temp_jan_dec_2006 <- read.csv("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2006_P1D.csv")
temp_jan_dec_2005 <- read.csv("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2005_P1D.csv")
temp_jan_dec_2004 <- read.csv("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2004_P1D.csv")
temp_jan_dec_2003 <- read.csv("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2003_P1D.csv")
temp_jan_dec_2002 <- read.csv("~/Desktop/SUDS2022/inputs/data/en_climate_daily_ON_6158355_2002_P1D.csv")





