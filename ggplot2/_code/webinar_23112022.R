# Webinar 23-11-2022
# Install
install.packages("ggplot2")
install.packages("lubridate")

# Brug
library(ggplot2)
library(lubridate)

# Data
data("airquality")
head(airquality, 10)

str(airquality)

# Data tilpasning
# Fjern NA
airquality <- na.omit(airquality)

# Monthname
airquality$Monthname <- month.abb[airquality$Month]

# Weekday
airquality$Weeday <- c(wday(paste(airquality$Day, airquality$Month, '1973', sep = '-'),
                          label =  TRUE, abbr = FALSE))

# Factor
airquality$Month <- factor(airquality$Month)


# Indlæs data
ggplot(data = airquality)

# Scatter Plot
ggplot(data = airquality, aes(x = Ozone, y = Temp)) +
  geom_point()

# Color
ggplot(data = airquality, aes(x = Ozone, y = Temp,
                              col = Monthname,
                              shape = Monthname)) +
  geom_point()

# Histogram
ggplot(data = airquality, aes(x = Temp, fill = Month)) +
  geom_histogram()

# Barplot
ggplot(data = airquality, aes(Month, Temp)) +
  geom_bar(stat = 'summary')

# Facet
p <- ggplot(data = airquality, aes(x = Ozone, y = Temp, col = Monthname)) +
  geom_point()

p + facet_grid(Month ~ .) 

p + facet_grid(. ~ Weeday)

# Statistics 
ggplot(data = airquality, aes(x = Ozone, y = Temp,
                              col = Monthname)) +
        geom_point() +
        geom_smooth(se = T, method = lm)

# Theme
ggplot(data = airquality, aes(x = Ozone, y = Temp,
                              col = Monthname)) +
  geom_point() +
  geom_smooth(se = F, method = lm) +
  theme_minimal()

# 3. part
library(ggthemes)



ggplot(data = airquality, aes(x = Ozone, y = Temp,
                              col = Monthname)) +
  geom_point() +
  geom_smooth(se = F, method = lm) +
  theme_economist()

# Labs
ggplot(data = airquality, aes(x = Ozone, y = Temp,
                              col = Monthname)) +
  geom_point() +
  geom_smooth(se = F, method = lm) +
  theme_light() + 
  theme(legend.position = "bottom", legend.direction = "horizontal") +
  labs(title = "New York Air Quality",
       subtitle = "May to September 1973",
       caption = "Data fra ggplot standard",
       x = "Ozone level",
       y = "Temp in F")

# Gem
ggsave("mit_plot.png", width = 5, height = 5)

