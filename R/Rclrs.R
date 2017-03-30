mypal <- c("#eef0f2", "#d1d6dc", "#da00d1", "#a700a0", "#74006f", "#dee800", "#adb500", "#00f485", "#00b965", "#006d3b", "#00d8d8", "#008b8b", "#003f3f", "#053efa", "#0434d4", "#021860", "#7a8998", "#56636f", "#2e363e", "#181C20")
options(palette = mypal)
mypal3 <- mypal[3:16] ## NO WHITE, GRAY, NOR BLACK ##
mypal2 <- mypal[c(4, 9, 12, 15)]
mypal22 <- c("#29B78B", "#0434D4", "#00E6AE", "#01AFD7", "#A700A0")
mypal.a75 <- sapply(mypal, adjustcolor, alpha.f = 0.75)
mypal.a50 <- sapply(mypal, adjustcolor, alpha.f = 0.50)
pdxpal <- c("#8b9535", "#ffffff", "#373737") ## dark/hunter green, white, very dark gray
ynpal <- mypal[c(10, 1, 2)]
bmon_pal <- mypal[c(16, 1, 17)]
bmon_pal2 <- mypal[c(16, 18, 17)]
bstds_pal <- mypal[c(5, 1, 17)]
bstds_pal2 <- mypal[c(5, 18, 17)]
stmon_pal <- mypal[c(17, 16, 5)]
bmon_palX <- mypal[c(17, 16)]
bstds_palX <- mypal[c(17, 5)]
pal_HC <- c("#7cb5ec", "#434348", "#90ed7d", "#f7a35c", "#8085e9", "#f15c80", "#e4d354", "#8085e8", "#8d4653", "#91e8e1") ## 'High Color' Color palette from `{ggthemes}` ##
pal_HCd <- c("#2b908f", "#90ee7e", "#f45b5b", "#7798BF", "#aaeeee", "#ff0066", "#eeaaee", "#55BF3B", "#DF5353", "#7798BF", "#aaeeee") ## 'High Color - Dark' color palette
clrs <- c("#882e72", "#b178a6", "#d6c1de", "#1965b0", "#5289c7", "#7bafde", "#4eb265", "#90c987", "#cae9ab", "#f7ee55", "#114477", "#77aadd", "#117755", "#44aa88", "#99ccbb", "#771111", "#771144", "#aa4477", "#dd77aa")


mb <- colorRampPalette(mypal[c(5, 16)])
colsHC <- colorRampPalette(pal_HC, alpha = T)
colsHCd <- colorRampPalette(pal_HCd, alpha = T)
mag <- colorRampPalette(mypal[c(1, 5)], alpha = 0.75) ## "#ffdafd" = very pale magenta ##
mag2 <- colorRampPalette(mypal[c(18, 5)], alpha = 0.75) ## "#ffdafd" = very pale magenta
blues <- colorRampPalette(c(mypal[c(1, 15)]), alpha = T) ## "#d9e1fe" = light grayish blue ##
cyans <- colorRampPalette(c(mypal[1], mypal[2], mypal[11]), alpha = T)
grblues <- colorRampPalette(c(mypal[17], mypal[16]), alpha = T)
grays <- colorRampPalette(mypal[c(2, 18, 19)], alpha = T)
grays2 <- colorRampPalette(mypal[c(1, 18, 20)], alpha = T)
grblues2 <- colorRampPalette(c("#d9e1fe", mypal[16]), alpha=T)
blues2 <- colorRampPalette(c("#ffffff", mypal[14]), alpha = T) ## "#d9e1fe" = light grayish blue ##
whcybl <- colorRampPalette(mypal[c(1, 12, 16)], alpha = T)
whblmg <- colorRampPalette(mypal[c(1, 16, 4)], alpha = T)
blgrmg <- colorRampPalette(mypal[c(16, 2, 5)], alpha = T)
cols <- colorRampPalette(mypal, alpha = T)
cols1 <- colorRampPalette(mypal[3:19], alpha = T)
cols2 <- colorRampPalette(mypal2, alpha = T)
cols3 <- colorRampPalette(mypal[3:16], alpha = T)
cols4 <- colorRampPalette(mypal[c(3:5, 10, 12:16)], alpha = T)
pdxcols <- colorRampPalette(pdxpal[c(3, 1)], alpha = T)

clr <- colorRampPalette(clrs, alpha = T)
