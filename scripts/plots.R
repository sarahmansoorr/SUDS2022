#### ggplots ####
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


#### tables ####
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


# summarising data ----
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

ggplot(pollution_2011_2020, aes(Year, January, color=Pollutant)) + geom_point()

