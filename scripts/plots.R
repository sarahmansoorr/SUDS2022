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
