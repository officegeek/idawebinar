# Pakker
library(ggplot2)
# library(dplyr)

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

# NA
# Vi skal have fjernet NA værdier
# na.omit bruges tuil at fjeren rows med en eller flere NA værdier
airquality <- na.omit(airquality)


# Packages
install.packages("ggplot2")
library(ggplot2)

# Data Layer
ggplot(data = airquality)

# Aesthetic Layer
ggplot(data = airquality, aes(x = Temp, y = Ozone, col = Month))

# Geometric layer
ggplot(data = airquality, aes(x = Temp, y = Ozone, col = Month)) + geom_point()
