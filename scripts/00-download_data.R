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

# Use below lines to load data sets if running for the first time
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

# Use below lines if running after the first time
temp_jan_may_2022 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/temp_jan_dec_2022.csv")
temp_jan_dec_2021 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/temp_jan_dec_2021.csv")
temp_jan_dec_2020 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/temp_jan_dec_2020.csv")
temp_jan_dec_2019 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/temp_jan_dec_2019.csv")
temp_jan_dec_2018 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/temp_jan_dec_2018.csv")
temp_jan_dec_2017 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/temp_jan_dec_2017.csv")
temp_jan_dec_2016 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/temp_jan_dec_2016.csv")
temp_jan_dec_2015 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/temp_jan_dec_2015.csv")
temp_jan_dec_2014 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/temp_jan_dec_2014.csv")
temp_jan_dec_2013 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/temp_jan_dec_2013.csv")
temp_jan_may_2012 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/temp_jan_dec_2012.csv")
temp_jan_dec_2011 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/temp_jan_dec_2011.csv")
temp_jan_dec_2010 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/temp_jan_dec_2010.csv")
temp_jan_dec_2009 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/temp_jan_dec_2009.csv")
temp_jan_dec_2008 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/temp_jan_dec_2008.csv")
temp_jan_dec_2007 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/temp_jan_dec_2007.csv")
temp_jan_dec_2006 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/temp_jan_dec_2006.csv")
temp_jan_dec_2005 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/temp_jan_dec_2005.csv")
temp_jan_dec_2004 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/temp_jan_dec_2004.csv")
temp_jan_dec_2003 <- read.csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/temp_jan_dec_2003.csv")
temp_jan_dec_2002 <- read_csv("~/Desktop/SUDS2022/inputs/data/raw_temp_data/temp_jan_dec_2002.csv")

#### Load pollution datasets ####

## 2020 Data
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

## 2019 Data
CO_2019 <- read_csv("inputs/data/raw_pollution_data/2019/CO_2019.csv", 
                    skip = 7)
NO_2019 <- read_csv("inputs/data/raw_pollution_data/2019/NO_2019.csv", 
                    skip = 7)
NO2_2019 <- read_csv("inputs/data/raw_pollution_data/2019/NO2_2019.csv", 
                     skip = 7)
O3_2019 <- read_csv("inputs/data/raw_pollution_data/2019/O3_2019.csv", 
                    skip = 7)
SO2_2019 <- read_csv("inputs/data/raw_pollution_data/2019/SO2_2019.csv", 
                     skip = 7)

## 2018 Data
CO_2018 <- read_csv("inputs/data/raw_pollution_data/2018/CO_2018.csv", 
                    skip = 7)
NO_2018 <- read_csv("inputs/data/raw_pollution_data/2018/NO_2018.csv", 
                    skip = 7)
NO2_2018 <- read_csv("inputs/data/raw_pollution_data/2018/NO2_2018.csv", 
                     skip = 7)
O3_2018 <- read_csv("inputs/data/raw_pollution_data/2018/O3_2018.csv", 
                    skip = 7)
SO2_2018 <- read_csv("inputs/data/raw_pollution_data/2018/SO2_2018.csv", 
                     skip = 7)

## 2017 Data
CO_2017 <- read_csv("inputs/data/raw_pollution_data/2017/CO_2017.csv", 
                    skip = 7)
NO_2017 <- read_csv("inputs/data/raw_pollution_data/2017/NO_2017.csv", 
                    skip = 7)
NO2_2017 <- read_csv("inputs/data/raw_pollution_data/2017/NO2_2017.csv", 
                     skip = 7)
O3_2017 <- read_csv("inputs/data/raw_pollution_data/2017/O3_2017.csv", 
                    skip = 7)
SO2_2017 <- read_csv("inputs/data/raw_pollution_data/2017/SO2_2017.csv", 
                     skip = 7)

## 2016 Data
CO_2016 <- read_csv("inputs/data/raw_pollution_data/2016/CO_2016.csv", 
                    skip = 7)
NO_2016 <- read_csv("inputs/data/raw_pollution_data/2016/NO_2016.csv", 
                    skip = 7)
NO2_2016 <- read_csv("inputs/data/raw_pollution_data/2016/NO2_2016.csv", 
                     skip = 7)
O3_2016 <- read_csv("inputs/data/raw_pollution_data/2016/O3_2016.csv", 
                    skip = 7)
SO2_2016 <- read_csv("inputs/data/raw_pollution_data/2016/SO2_2016.csv", 
                     skip = 7)

## 2015 Data
CO_2015 <- read_csv("inputs/data/raw_pollution_data/2015/CO_2015.csv", 
                    skip = 7)
NO_2015 <- read_csv("inputs/data/raw_pollution_data/2015/NO_2015.csv", 
                    skip = 7)
NO2_2015 <- read_csv("inputs/data/raw_pollution_data/2015/NO2_2015.csv", 
                     skip = 7)
O3_2015 <- read_csv("inputs/data/raw_pollution_data/2015/O3_2015.csv", 
                    skip = 7)
SO2_2015 <- read_csv("inputs/data/raw_pollution_data/2015/SO2_2015.csv", 
                     skip = 7)

## 2014 Data
CO_2014 <- read_csv("inputs/data/raw_pollution_data/2014/CO_2014.csv", 
                    skip = 7)
NO_2014 <- read_csv("inputs/data/raw_pollution_data/2014/NO_2014.csv", 
                    skip = 7)
NO2_2014 <- read_csv("inputs/data/raw_pollution_data/2014/NO2_2014.csv", 
                     skip = 7)
O3_2014 <- read_csv("inputs/data/raw_pollution_data/2014/O3_2014.csv", 
                    skip = 7)
SO2_2014 <- read_csv("inputs/data/raw_pollution_data/2014/SO2_2014.csv", 
                     skip = 7)

## 2013 Data
CO_2013 <- read_csv("inputs/data/raw_pollution_data/2013/CO_2013.csv", 
                    skip = 7)
NO_2013 <- read_csv("inputs/data/raw_pollution_data/2013/NO_2013.csv", 
                    skip = 7)
NO2_2013 <- read_csv("inputs/data/raw_pollution_data/2013/NO2_2013.csv", 
                     skip = 7)
O3_2013 <- read_csv("inputs/data/raw_pollution_data/2013/O3_2013.csv", 
                    skip = 7)
SO2_2013 <- read_csv("inputs/data/raw_pollution_data/2013/SO2_2013.csv", 
                     skip = 7)

## 2012 Data
CO_2012 <- read_csv("inputs/data/raw_pollution_data/2012/CO_2012.csv", 
                    skip = 7)
NO_2012 <- read_csv("inputs/data/raw_pollution_data/2012/NO_2012.csv", 
                    skip = 7)
NO2_2012 <- read_csv("inputs/data/raw_pollution_data/2012/NO2_2012.csv", 
                     skip = 7)
O3_2012 <- read_csv("inputs/data/raw_pollution_data/2012/O3_2012.csv", 
                    skip = 7)
SO2_2012 <- read_csv("inputs/data/raw_pollution_data/2012/SO2_2012.csv", 
                     skip = 7)

## 2011 Data
CO_2011 <- read_csv("inputs/data/raw_pollution_data/2011/CO_2011.csv", 
                    skip = 7)
NO_2011 <- read_csv("inputs/data/raw_pollution_data/2011/NO_2011.csv", 
                    skip = 7)
NO2_2011 <- read_csv("inputs/data/raw_pollution_data/2011/NO2_2011.csv", 
                     skip = 7)
O3_2011 <- read_csv("inputs/data/raw_pollution_data/2011/O3_2011.csv", 
                    skip = 7)
SO2_2011 <- read_csv("inputs/data/raw_pollution_data/2011/SO2_2011.csv", 
                     skip = 7)

## 2010 Data
CO_2010 <- read_csv("inputs/data/raw_pollution_data/2010/CO_2010.csv", 
                    skip = 7)
NO_2010 <- read_csv("inputs/data/raw_pollution_data/2010/NO_2010.csv", 
                    skip = 7)
NO2_2010 <- read_csv("inputs/data/raw_pollution_data/2010/NO2_2010.csv", 
                     skip = 7)
O3_2010 <- read_csv("inputs/data/raw_pollution_data/2010/O3_2010.csv", 
                    skip = 7)
SO2_2010 <- read_csv("inputs/data/raw_pollution_data/2010/SO2_2010.csv", 
                     skip = 7)

## 2009 Data
CO_2009 <- read_csv("inputs/data/raw_pollution_data/2009/CO_2009.csv", 
                    skip = 7)
NO_2009 <- read_csv("inputs/data/raw_pollution_data/2009/NO_2009.csv", 
                    skip = 7)
NO2_2009 <- read_csv("inputs/data/raw_pollution_data/2009/NO2_2009.csv", 
                     skip = 7)
O3_2009 <- read_csv("inputs/data/raw_pollution_data/2009/O3_2009.csv", 
                    skip = 7)
SO2_2009 <- read_csv("inputs/data/raw_pollution_data/2009/SO2_2009.csv", 
                     skip = 7)

## 2008 Data
CO_2008 <- read_csv("inputs/data/raw_pollution_data/2008/CO_2008.csv", 
                    skip = 7)
NO_2008 <- read_csv("inputs/data/raw_pollution_data/2008/NO_2008.csv", 
                    skip = 7)
NO2_2008 <- read_csv("inputs/data/raw_pollution_data/2008/NO2_2008.csv", 
                     skip = 7)
O3_2008 <- read_csv("inputs/data/raw_pollution_data/2008/O3_2008.csv", 
                    skip = 7)
SO2_2008 <- read_csv("inputs/data/raw_pollution_data/2008/SO2_2008.csv", 
                     skip = 7)

## 2007 Data
CO_2007 <- read_csv("inputs/data/raw_pollution_data/2007/CO_2007.csv", 
                    skip = 7)
NO_2007 <- read_csv("inputs/data/raw_pollution_data/2007/NO_2007.csv", 
                    skip = 7)
NO2_2007 <- read_csv("inputs/data/raw_pollution_data/2007/NO2_2007.csv", 
                     skip = 7)
O3_2007 <- read_csv("inputs/data/raw_pollution_data/2007/O3_2007.csv", 
                    skip = 7)
SO2_2007 <- read_csv("inputs/data/raw_pollution_data/2007/SO2_2007.csv", 
                     skip = 7)

## 2006 Data
CO_2006 <- read_csv("inputs/data/raw_pollution_data/2006/CO_2006.csv", 
                    skip = 7)
NO_2006 <- read_csv("inputs/data/raw_pollution_data/2006/NO_2006.csv", 
                    skip = 7)
NO2_2006 <- read_csv("inputs/data/raw_pollution_data/2006/NO2_2006.csv", 
                     skip = 7)
O3_2006 <- read_csv("inputs/data/raw_pollution_data/2006/O3_2006.csv", 
                    skip = 7)
SO2_2006 <- read_csv("inputs/data/raw_pollution_data/2006/SO2_2006.csv", 
                     skip = 7)

## 2005 Data
CO_2005 <- read_csv("inputs/data/raw_pollution_data/2005/CO_2005.csv", 
                    skip = 7)
NO_2005 <- read_csv("inputs/data/raw_pollution_data/2005/NO_2005.csv", 
                    skip = 7)
NO2_2005 <- read_csv("inputs/data/raw_pollution_data/2005/NO2_2005.csv", 
                     skip = 7)
O3_2005 <- read_csv("inputs/data/raw_pollution_data/2005/O3_2005.csv", 
                    skip = 7)
SO2_2005 <- read_csv("inputs/data/raw_pollution_data/2005/SO2_2005.csv", 
                     skip = 7)

## 2004 Data
CO_2004 <- read_csv("inputs/data/raw_pollution_data/2004/CO_2004.csv", 
                    skip = 7)
NO_2004 <- read_csv("inputs/data/raw_pollution_data/2004/NO_2004.csv", 
                    skip = 7)
NO2_2004 <- read_csv("inputs/data/raw_pollution_data/2004/NO2_2004.csv", 
                     skip = 7)
O3_2004 <- read_csv("inputs/data/raw_pollution_data/2004/O3_2004.csv", 
                    skip = 7)
SO2_2004 <- read_csv("inputs/data/raw_pollution_data/2004/SO2_2004.csv", 
                     skip = 7)

## 2003 Data
CO_2003 <- read_csv("inputs/data/raw_pollution_data/2003/CO_2003.csv", 
                    skip = 7)
NO_2003 <- read_csv("inputs/data/raw_pollution_data/2003/NO_2003.csv", 
                    skip = 7)
NO2_2003 <- read_csv("inputs/data/raw_pollution_data/2003/NO2_2003.csv", 
                     skip = 7)
O3_2003 <- read_csv("inputs/data/raw_pollution_data/2003/O3_2003.csv", 
                    skip = 7)
SO2_2003 <- read_csv("inputs/data/raw_pollution_data/2003/SO2_2003.csv", 
                     skip = 7)

## 2002 Data
CO_2002 <- read_csv("inputs/data/raw_pollution_data/2002/CO_2002.csv", 
                    skip = 7)
NO_2002 <- read_csv("inputs/data/raw_pollution_data/2002/NO_2002.csv", 
                    skip = 7)
NO2_2002 <- read_csv("inputs/data/raw_pollution_data/2002/NO2_2002.csv", 
                     skip = 7)
O3_2002 <- read_csv("inputs/data/raw_pollution_data/2002/O3_2002.csv", 
                    skip = 7)
SO2_2002 <- read_csv("inputs/data/raw_pollution_data/2002/SO2_2002.csv", 
                     skip = 7)

