# Gem plot
Du kan gemme det sidste plot du har oprettet med.
**plot.png** bliver gemt i dit **Working Directory**

```r
ggsave('plot.png', width = 6, height = 4)
```

**ggsave** understøtter følgende filetyper:

- jpeg
- png
- tiff
- eps/ps
- pdf
- bmp
- svg
- wmf - *kun Windows*

Som *default* er størrelsen er angivet i **inches**, men det kan du ændre ved at angive **units**

```r
ggsave('plot.png', width = 6,   height = 4)
ggsave('plot.png', width = 15,  height = 10,  units = 'cm')
ggsave('plot.png', width = 150, height = 100, units = 'mm')
```