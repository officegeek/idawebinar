# The Grammar of Graphics
Opret et plot i **ggplot2** i forhold til de 7 lag i "*The Grammar of Graphics*"

# Data Layer
I **datalaget** definerer du det data der skal bruges til oprettelsen af dit plot.

Til dette plot er det et af de *indbyggede* datasæt vi brugere - **airquality**

Dette dataset viser daglige målinger af luftkvaliteten i New York. I perioden maj til september 1973.

Datasættet består af 6 kolonner og 153 rækker

| Navn    | Datatype | Beskrivelse               |
|---------|----------|---------------------------|
| Ozone   | int      | Ozone (ppb)               |
| Solar.R | int      | Solar                     |
| Wind    | num      | Vind hastighed (mph)      |
| Temp    | int      | Temperatur i Fahrenheit   |
| Month   | int      | Måneder vist som 1 til 12 |
| Day     | int      | Dage vist som 1 til 31    |

Du indlæser datasættet **airquality** med denne R kode:

```r
ggplot(data = airquality)
```

# Aesthetic Layer

```r
ggplot(data = airquality,
    aes(x = Temp, y = Ozone, col = Temp))
```

# Geometric layer

```r
ggplot(data = airquality, 
    aes(x = Ozone, y = Temp)) + 
  geom_point()
```

## Tilføj Color til Geometric layer

```r
ggplot(data = airquality, 
       aes(x = Ozone, y = Temp, 
           col = Month)) + 
  geom_point()
```

## Tilføj Size til Geometric layer

```r
ggplot(data = airquality, 
    aes(x = Ozone, y = Temp, 
        size = Month)) + 
  geom_point()
```

## Tilføj Shape og Color til Geometric layer

```r
ggplot(data = airquality, 
       aes(x = Ozone, y = Temp, 
           col = Month, 
           shape = Month)) + 
  geom_point()
```

## Shape, Color og Size

```r
ggplot(data = airquality, 
       aes(x = Ozone, y = Temp, 
           col = Month,
           size = Wind, 
           shape = Month)) + 
  geom_point()
```

# Facet layer

```r
p <- ggplot(data = airquality, 
       aes(x = Ozone, y = Temp,
           col = Month,
           shape = Month)) + 
  geom_point()
```

## Opdel i rækker efter Måned (Month)

```r
p + facet_grid(Month ~ .)
```

## Opdel i koloner efter Ugedag (Weekday)

```r
p + facet_grid(. ~ Weekday)
```

# Statistics



# Coordinates


# Themes