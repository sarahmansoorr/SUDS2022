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
