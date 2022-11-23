# Pakker

## Install
install.packages('tidyverse')
install.packages('lubridate')

## Brug
library(ggplot2)
library(lubridate)

# ******************************************************************************

# Sprog
#Sys.setlocale("LC_TIME", "Danish")
Sys.setlocale("LC_TIME", "English")

# ******************************************************************************

# Data
data()

## airquality
data(airquality)

head(airquality, 10)

str(airquality)

# ******************************************************************************

# Tilpasning af data

## NA
## Vi skal have fjernet NA værdier
## na.omit bruges til at fjerne rows med en eller flere NA værdier
airquality <- na.omit(airquality)

## Monthname
airquality$Monthname <- month.abb[airquality$Month]

## Weekday
airquality$Weekday <- c(weekdays(make_date(year = 1973, month = airquality$Month, day = airquality$Day)))

## Factor
## Konverter Month til en Factor
airquality$Month <- factor(airquality$Month)

## Vis data
head(airquality, 10)

# 1 ******************************************************************************

# Data Layer
ggplot(data = airquality)

# 2 ******************************************************************************

# Aesthetic Layer
ggplot(data = airquality,
    aes(x = Temp, y = Ozone, col = Temp))

# 3 ******************************************************************************

# Geometric layer
ggplot(data = airquality, 
    aes(x = Ozone, y = Temp)) + 
  geom_point()

## Add til Geometric layer
## Color
ggplot(data = airquality, 
       aes(x = Ozone, y = Temp, 
           col = Monthname)) + 
  geom_point()

## Size
ggplot(data = airquality, 
    aes(x = Ozone, y = Temp, 
        size = Monthname)) + 
  geom_point()

## Shape og Color
ggplot(data = airquality, 
       aes(x = Ozone, y = Temp, 
           col = Monthname, 
           shape = Month)) + 
  geom_point()

## Shape, Color og Size
ggplot(data = airquality, 
       aes(x = Ozone, y = Temp, 
           col = Monthname,
           size = Wind, 
           shape = Weekday)) + 
  geom_point()

## Histogram plot
ggplot(data = airquality, 
       aes(x = Ozone)) +
  geom_histogram(binwidth = 5)

# 4 ******************************************************************************

# Facet layer
p <- ggplot(data = airquality, 
       aes(x = Ozone, y = Temp,
           col = Monthname,
           shape = Month)) + 
  geom_point()

p <- ggplot(data = airquality, 
            aes(x = Ozone, y = Temp,
                col = Monthname)) + 
  geom_point()

## Opdel i rækker efter Måned (Month)
p + facet_grid(Month ~ .)

## Opdel i koloner efter Ugedag (Weekday)
p + facet_grid(. ~ Weekday)

# 5 ******************************************************************************

# Statistics layer
ggplot(data = airquality, 
       aes(x = Ozone, y = Temp,
           col = Monthname)) +
  geom_point() +
  geom_smooth(se = T, method = lm)


ggplot(data = airquality, 
       aes(x = Ozone, y = Temp,
           col = Monthname)) +
  geom_point() +
  geom_smooth(se = T, method = lm, col = 'red')


# coord_cartesian() - xlim =
ggplot(data = airquality, 
       aes(x = Ozone, y = Temp,
           col = Monthname)) +
  geom_point() +
  geom_smooth(se = F) +
  coord_cartesian(xlim = c(10, 20))

# 6 ******************************************************************************

# Theme layer
# theme_dark
ggplot(data = airquality, 
       aes(x = Ozone, y = Temp, 
           col = Monthname)) + 
  geom_point() + 
  geom_smooth(se = F, method = lm) +
  theme_dark()

# theme_minima
ggplot(data = airquality, 
       aes(x = Ozone, y = Temp, 
           col = Monthname)) + 
  geom_point() + 
  geom_smooth(se = F, method = lm) +
  theme_minimal()

# ******************************************************************************

# 3 parts Themes
install.packages("ggthemes")
library(ggthemes)

# Wall Street Journal theme
ggplot(data = airquality, 
       aes(x = Ozone, y = Temp, 
           col = Monthname)) + 
  geom_point() + 
  geom_smooth(se = F, method = lm) +
  theme_wsj()

# ******************************************************************************

# Titler - labs

ggplot(data = airquality, 
       aes(x = Ozone, y = Temp, 
           col = Month)) + 
  geom_point() + 
  geom_smooth(se = F, method = lm) +
  theme_light() +
  labs(title = 'New York Air Quality Measurements', 
       subtitle = 'May - September 1973',
       caption = 'Data from ggplot standard',
       x = 'Ozone level',
       y = 'Temp in F')

# Annotations
ggplot(data = airquality, 
       aes(x = Ozone, y = Temp, 
           col = Monthname)) + 
  geom_point() +
  geom_text(aes(label = Monthname))


ggplot(data = airquality, 
       aes(x = Ozone, y = Temp, 
           col = Monthname)) + 
  geom_point() +
  geom_label(aes(label = Monthname))

# ******************************************************************************

# legend
ggplot(data = airquality, 
       aes(x = Ozone, y = Temp, 
           col = Monthname)) + 
  geom_point() + 
  geom_smooth(se = F, method = lm) +
  theme_minimal() +
  theme(legend.position="bottom", legend.direction="horizontal")


# ******************************************************************************


# Gem Plot
# Gem sides plot i working directory
ggsave('plot.png', width = 5, height = 5)
