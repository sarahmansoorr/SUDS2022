#### temperature ggplots ####
library(ggplot2)

ggplot(temp_2002_2022, aes(x=year, y=max_temp, color=month)) + geom_point()

ggplot(temp_2002_2022, aes(x=year, y=max_temp, color=month.name)) + geom_point()

ggplot(temp_2002_2022, aes(x=year, y=max_temp, color=month)) + geom_line()

ggplot(temp_2002_2022, aes(x=year, y=min_temp, color=month)) + geom_point()

ggplot(temp_2002_2022, aes(x=year, y=mean_temp, color=month)) + geom_point()

ggplot(temp_2002_2022, aes(x=month, y=max_temp, color=year)) + geom_point()

ggplot(temp_2002_2022, aes(x=month, y=min_temp, color=year)) + geom_point()

ggplot(temp_2002_2022, aes(x=month, y=mean_temp, color=year)) + geom_point()

ggplot(temp_2002_2022, aes(x=month_name, y=mean_temp, col=year)) + geom_col()


#### temperature tables ####
library(knitr)
install.packages("kableExtra")
library(kableExtra)

max_temp_2002_2022 <- temp_2002_2022 %>%
  select(year, month, day, max_temp)
max_temp_2002_2022 %>%
  slice(c(162, 393, 745, 1318, 1819, 2115, 3222, 4222, 5222, 6333)) %>%
  kable(
    caption = "Extracting rows from the Temperature data from 2002 - 2022 for Maximum Temperature",
    col.names=c("Year", "Month", "Day", "Max Temp"),
    linesep = "", digits = 2, booktabs=TRUE) %>%
  kable_styling(latex_options = "HOLD_position", font_size = 10)

min_temp_2002_2022 <- temp_2002_2022 %>%
  select(year, month, day, min_temp)
min_temp_2002_2022 %>%
  slice(c(162, 393, 745, 1318, 1819, 2115, 3222, 4222, 5222, 6333)) %>%
  kable(
    caption = "Extracting rows from the Temperature data from 2002 - 2022 for Minimum Temperature",
    col.names=c("Year", "Month", "Day", "Min Temp"),
    linesep = "", digits = 2, booktabs=TRUE) %>%
  kable_styling(latex_options = "HOLD_position", font_size = 10)

mean_temp_2002_2022 <- temp_2002_2022 %>%
  select(year, month, day, mean_temp)
mean_temp_2002_2022 %>%
  slice(c(162, 393, 745, 1318, 1819, 2115, 3222, 4222, 5222, 6333)) %>%
  kable(
    caption = "Extracting rows from the Temperature data from 2002 - 2022 for Mean Temperature",
    col.names=c("Year", "Month", "Day", "Mean Temp"),
    linesep = "", digits = 2, booktabs=TRUE) %>%
  kable_styling(latex_options = "HOLD_position", font_size = 10)

mean_temp_2002_2022 <- temp_2002_2022 %>%
  select(year, month, day, max_temp, min_temp, mean_temp)
mean_temp_2002_2022 %>%
  slice(c(162, 393, 745, 1318, 1819, 2115, 3222, 4222, 5222, 6333)) %>%
  kable(
    caption = "Extracting rows from the Temperature data from 2002 - 2022",
    col.names=c("Year", "Month", "Day", "Max Temp", "Min Temp", "Mean Temp"),
    linesep = "", digits = 2, booktabs=TRUE) %>%
  kable_styling(latex_options = "HOLD_position", font_size = 10)

temp_2002_2022 %>%
  select(year, month, day, max_temp, min_temp, mean_temp) %>%
  slice(c(162, 393, 745, 1318, 1819, 2115, 3222, 4222, 5222, 6333)) %>%
  kable(
    caption = "Extracting rows from the Temperature data from 2002 - 2022",
    col.names=c("Year", "Month", "Day", "Max Temp", "Min Temp", "Mean Temp"),
    linesep = "", digits = 2, booktabs=TRUE) %>%
  kable_styling(latex_options = "HOLD_position", font_size = 10)


# temperature summarising data ----
summary_max_data <- temp_2002_2022 %>%
  group_by(month_name) %>%
  summarise(mean_max_temp = mean(max_temp))

ggplot(summary_max_data) +
  geom_col(aes(x = factor(month_name), y = mean_max_temp)) +
  labs(title = "Mean Maximum Temperature by Month from 2002-2022", y = "Mean Maximum Temperature", 
       x = "Month")

summary_year_max_data <- temp_2002_2022 %>%
  group_by(year) %>%
  summarise(mean_max_temp = mean(max_temp))

ggplot(summary_year_max_data) +
  geom_col(aes(x = factor(year), y = mean_max_temp)) +
  labs(title = "Mean Maximum Temperature by Year from 2002-2022", y = "Mean Maximum Temperature", 
       x = "Year")


### winter months

winter <- temp_2002_2022 %>%
  filter(month_name == "Dec" | month_name == "Jan" | month_name == "Feb" | month_name == "Mar")

ggplot(winter, aes(x=year, y=max_temp, color=month_name)) + geom_point()

spring <- temp_2002_2022 %>%
  filter(month_name == "Apr" | month_name == "May" | month_name == "Jun" | month_name == "Jul")

ggplot(spring, aes(x=year, y=max_temp, color=month_name)) + geom_point()

summer <- temp_2002_2022 %>%
  filter(month_name == "Aug" | month_name == "Sep" | month_name == "Oct" | month_name == "Nov")

ggplot(summer, aes(x=year, y=max_temp, color=month_name)) + geom_point()


## using if else
winter_2002_2022 <- ifelse(temp_2002_2022$date < "")

"Econometrics
Check differences to a different city over time
Freedom of information
Uoft databases
Causation models
Regression models

looking at rising temperatures and deaths
looking at rising temperatures and lung diseases
looking at rising temperatures and pollen and deaths"

# pollution data ----

## ggplot ----
ggplot(pollution_2011_2020, aes(Year, January, color=Pollutant)) + geom_point()




ggplot(pollution, aes(Year, Mean, color=Pollutant)) + geom_point()

pollution %>% filter(Pollutant != "NO") %>% ggplot(aes(x = Year, 
                                                       y = Mean, 
                                                       color = Pollutant)) + geom_point()
pollution %>% filter(Pollutant != "NO" & Pollutant != "O3") %>% ggplot(aes(x = Year, 
                                                       y = Mean, 
                                                       color = Pollutant)) + geom_point()

pollution %>% filter(Pollutant != "NO" & Pollutant != "O3" & Pollutant != "NO2") %>% ggplot(
  aes(x = Year, y = Mean, color = Pollutant)) + geom_point()
# CO unit ppm
pollution %>% filter(Pollutant == "CO") %>% ggplot(
  aes(x = Year, y = Mean, color = Pollutant)) + geom_point()
pollution %>% filter(Pollutant == "CO") %>% ggplot(
  aes(x = Year, y = Mean*1000, color = Pollutant)) + geom_point()
# NO unit ppb
pollution %>% filter(Pollutant == "NO") %>% ggplot(
  aes(x = Year, y = Mean, color = Pollutant)) + geom_point()
# O3 unit ppb
pollution %>% filter(Pollutant == "O3") %>% ggplot(
  aes(x = Year, y = Mean, color = Pollutant)) + geom_point()
# NO2 unit ppb
pollution %>% filter(Pollutant == "NO2") %>% ggplot(
  aes(x = Year, y = Mean, color = Pollutant)) + geom_point()
# SO2 unit ppb
pollution %>% filter(Pollutant == "SO2") %>% ggplot(
  aes(x = Year, y = Mean, color = Pollutant)) + geom_point()

## different units for CO for the above so different axis
pollution %>% filter(Pollutant != "CO") %>% ggplot(
  aes(x = Year, y = Mean, color = Pollutant)) + geom_point()

## tables ----
pollution_2011_2020 %>%
  select(Year, Pollutant, January, February, March, April, May, June, July, August, September, October, 
         November, December) %>%
  slice(c(2, 34, 74, 91, 117, 147, 184, 223, 252, 308)) %>%
  kable(
    caption = "Extracting rows from the Pollution data from 2011 - 2020",
    col.names=c("Year", "Pollutant", "Jan", "Feb", "Mar", "Apr", "May",
                "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"),
    linesep = "", digits = 2, booktabs=TRUE) %>%
  kable_styling(latex_options = "HOLD_position", font_size = 10)




pollution %>%
  select(Pollutant, City, Date, Mean, Year) %>%
  slice(c(100, 1000, 1200, 1500, 1800, 2000, 2500, 2800, 3600, 5000, 6000, 7000, 10000, 11000, 15000)) %>%
  kable(
    caption = "Extracting rows from the Pollution data from 2010 - 2020",
    col.names=c("Pollutant", "City", "Date", "Mean", "Year"),
    linesep = "", digits = 2, booktabs=TRUE) %>%
  kable_styling(latex_options = "HOLD_position", font_size = 10)



# temperature and pollution data ----

## ggplot ----



## tables ----