# Pakker
install.packages('tidyverse')

library(ggplot2)
# library(dplyr)
library(lubridate)

# Data
data()
data(airquality)

head(airquality, 10)

str(airquality)

airquality

# Tilpasning af data

# Factor
# Konverter Month til en Factor
airquality$Month <- factor(airquality$Month)

# Weekday
# Konverter dato(dag nr.) til ugedag
airquality$Weekday <- c(wday(paste(airquality$Day, airquality$Month, '1973', sep='-'), label=TRUE, abbr=FALSE))

# NA
# Vi skal have fjernet NA værdier
# na.omit bruges til at fjerne rows med en eller flere NA værdier
airquality <- na.omit(airquality)


# Packages
install.packages("ggplot2")
library(ggplot2)

# Data Layer
ggplot(data = airquality)

# Aesthetic Layer
ggplot(data = airquality,
    aes(x = Temp, y = Ozone, col = Temp))

# Geometric layer
ggplot(data = airquality, 
    aes(x = Ozone, y = Temp)) + 
  geom_point()

# Add til Geometric layer
# Color
ggplot(data = airquality, 
       aes(x = Ozone, y = Temp, 
           col = Month)) + 
  geom_point()

# Size
ggplot(data = airquality, 
    aes(x = Ozone, y = Temp, 
        size = Month)) + 
  geom_point()

# Shape og Color
ggplot(data = airquality, 
       aes(x = Ozone, y = Temp, 
           col = Month, 
           shape = Month)) + 
  geom_point()

# Shape, Color og Size
ggplot(data = airquality, 
       aes(x = Ozone, y = Temp, 
           col = Month,
           size = Wind, 
           shape = Month)) + 
  geom_point()

# Histogram plot
ggplot(data = airquality, 
       aes(x = Ozone)) +
  geom_histogram(binwidth = 5)

# Facet layer
p <- ggplot(data = airquality, 
       aes(x = Ozone, y = Temp,
           col = Month,
           shape = Month)) + 
  geom_point()

# Opdel i rækker efter Måned (Month)
p + facet_grid(Month ~ .)

# Opdel i koloner efter Ugedag (Weekday)
p + facet_grid(. ~ Weekday)



# Statistics layer
ggplot(data = airquality, 
       aes(x = Ozone, y = Temp,
           col = Month)) +
  geom_point() +
  geom_smooth(se = T, method = lm)


ggplot(data = airquality, 
       aes(x = Ozone, y = Temp,
           col = Month)) +
  geom_point() +
  geom_smooth(se = T, method = lm, col = 'red')


# coord_cartesian() - xlim =
ggplot(data = airquality, 
       aes(x = Ozone, y = Temp,
           col = Month)) +
  geom_point() +
  geom_smooth(se = F) +
  coord_cartesian(xlim = c(10, 20))



# Theme layer
ggplot(data = airquality, 
       aes(x = Ozone, y = Temp, 
           col = Month)) + 
  geom_point() + 
  geom_smooth(se = F, method = lm) +
  theme(plot.background = element_rect(fill = 'lightblue'))



