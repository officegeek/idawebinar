# Themes
**ggplot2** kommer med 8 indbyggede *Themes*:

- theme_gray()
- theme_bw()
- theme_linedraw()
- theme_light()
- theme_dark()
- theme_minimal()
- theme_classic()
- theme_void()

## Brug
Du angiver hvilket Theme du vil bruge på dene måde - her **theme_dark()**

```r
ggplot(data = airquality, 
       aes(x = Ozone, y = Temp, 
           col = Month)) + 
  geom_point() +
  theme_dark()
```

## Default
Default er **theme_gray()**, så hvis du vil bruge det behøver du ikke at specificere noget.

Du kan ændre default *Theme* på denne måde - her til **theme_dark()**

```r
theme_set(theme_dark())
```

## Theme pakker
Ud over de indbyggede *Themes* er det muligt at anvende forskellige 3-parts *Themes*:

- ggthemes
- hrbrthemes
- ggthemr
- ggtech
- ggdark

Du skal installere den/de Themes pakker du vil anvende - her **ggthemes**

```r
install.packages("ggthemes")
library(ggthemes)
```


## Link
- [ggthem](https://ggplot2.tidyverse.org/reference/ggtheme.html)