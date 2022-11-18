# Pakker

## Install
install.packages('tidyverse')
install.packages('lubridate')

## Brug
library(ggplot2)
library(lubridate)

# ******************************************************************************

# Data
data()

## airquality
data(airquality)

head(airquality, 10)

str(airquality)

# ******************************************************************************

# Tilpasning af data

## Factor
## Konverter Month til en Factor
airquality$Month <- factor(airquality$Month)

## Weekday
## Konverter dato(dag nr.) til ugedag
airquality$Weekday <- c(wday(paste(airquality$Day, airquality$Month, '1973', sep='-'), 
                             label=TRUE, abbr=FALSE))

## NA
## Vi skal have fjernet NA værdier
## na.omit bruges til at fjerne rows med en eller flere NA værdier
airquality <- na.omit(airquality)

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
           col = MonthName)) + 
  geom_point()

## Size
ggplot(data = airquality, 
    aes(x = Ozone, y = Temp, 
        size = MonthName)) + 
  geom_point()

## Shape og Color
ggplot(data = airquality, 
       aes(x = Ozone, y = Temp, 
           col = MonthName, 
           shape = Month)) + 
  geom_point()

## Shape, Color og Size
ggplot(data = airquality, 
       aes(x = Ozone, y = Temp, 
           col = MonthName,
           size = Wind, 
           shape = Month)) + 
  geom_point()

## Histogram plot
ggplot(data = airquality, 
       aes(x = Ozone)) +
  geom_histogram(binwidth = 5)

# 4 ******************************************************************************

# Facet layer
p <- ggplot(data = airquality, 
       aes(x = Ozone, y = Temp,
           col = MonthName,
           shape = Month)) + 
  geom_point()

## Opdel i rækker efter Måned (Month)
p + facet_grid(Month ~ .)

## Opdel i koloner efter Ugedag (Weekday)
p + facet_grid(. ~ Weekday)

# 5 ******************************************************************************

# Statistics layer
ggplot(data = airquality, 
       aes(x = Ozone, y = Temp,
           col = MonthName)) +
  geom_point() +
  geom_smooth(se = T, method = lm)


ggplot(data = airquality, 
       aes(x = Ozone, y = Temp,
           col = MonthName)) +
  geom_point() +
  geom_smooth(se = T, method = lm, col = 'red')


# coord_cartesian() - xlim =
ggplot(data = airquality, 
       aes(x = Ozone, y = Temp,
           col = MonthName)) +
  geom_point() +
  geom_smooth(se = F) +
  coord_cartesian(xlim = c(10, 20))

# 6 ******************************************************************************

# Theme layer
ggplot(data = airquality, 
       aes(x = Ozone, y = Temp, 
           col = MonthName)) + 
  geom_point() + 
  geom_smooth(se = F, method = lm) +
  theme(plot.background = element_rect(fill = 'lightblue'))

# ******************************************************************************

# labs

ggplot(data = airquality, 
       aes(x = Ozone, y = Temp, 
           col = Month)) + 
  geom_point() + 
  geom_smooth(se = F, method = lm) +
  theme_light() +
  labs(title = 'New York Air Quality Measurements', subtitle = 'May - September 1973')
