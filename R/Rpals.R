
# BASE PALETTES ------------------------------------------------------


pal_my <- c("#eef0f2", "#d1d6dc", "#da00d1", "#a700a0", "#74006f", "#dee800", "#adb500", "#00f485", "#00b965", "#006d3b", "#00d8d8", "#008b8b", "#003f3f", "#053efa", "#0434d4", "#021860", "#7a8998", "#56636f", "#2e363e", "#181C20")
options(palette = pal_my)
pal_my3 <- pal_my[3:16] ## NO WHITE, GRAY, NOR BLACK ##
pal_my2 <- pal_my[c(4, 9, 12, 15)]
pal_my22 <- c("#29B78B", "#0434D4", "#00E6AE", "#01AFD7", "#A700A0")
pal_my.a75 <- sapply(pal_my, adjustcolor, alpha.f = 0.75)
pal_my.a50 <- sapply(pal_my, adjustcolor, alpha.f = 0.50)
pal_pdx <- c("#8b9535", "#ffffff", "#373737") ## dark/hunter green, white, very dark gray ##
pal_yn <- pal_my[c(10, 1, 2)]
pal_bmon <- pal_my[c(16, 1, 17)]
pal_bmon2 <- pal_my[c(16, 18, 17)]
pal_bstds <- pal_my[c(5, 1, 17)]
pal_bstds2 <- pal_my[c(5, 18, 17)]
pal_stmon <- pal_my[c(17, 16, 5)]
pal_bmonX <- pal_my[c(17, 16)]
pal_bstdsX <- pal_my[c(17, 5)]
pal_HC <- c("#7cb5ec", "#434348", "#90ed7d", "#f7a35c", "#8085e9", "#f15c80", "#e4d354", "#8085e8", "#8d4653", "#91e8e1") ## 'High Color' Color palette from `{ggthemes}` ##
pal_HCd <- c("#2b908f", "#90ee7e", "#f45b5b", "#7798BF", "#aaeeee", "#ff0066", "#eeaaee", "#55BF3B", "#DF5353", "#7798BF", "#aaeeee") ## 'High Color - Dark' color palette
pal_nord <- list( ## arctic palette based on the [Nord color palette](https://github.com/arcticicestudio/nord) ##
    polar = c("#2e343f", "#3b4251", "#434c5c", "#4c5668", "#7c889f", "#8b95aa", "#9ba5b6", "#b8c0cc"),
    snow = c("#d8dee8", "#e5e9ef", "#eceff4", "#ffffff"),
    frost = c("#8fbcbb", "#88c0ce", "#81a1be", "#5e81a8"),
    aurora = c("#bf606b", "#d08674", "#ebca93", "#a3be91", "#b48eab")
)

# BASE PALETTES - ggsci ----------------------------------------------


require(ggsci)
pal_sci <- pal_aaas("default")(8)
pal_lancet <- pal_lancet("lanonc")(7)[-6]


# FUNS - colorRampPalette --------------------------------------------


mb <- colorRampPalette(pal_my[c(5, 16)])
colsHC <- colorRampPalette(pal_HC, alpha = T)
colsHCd <- colorRampPalette(pal_HCd, alpha = T)
mag <- colorRampPalette(pal_my[c(1, 5)], alpha = 0.75) ## "#ffdafd" = very pale magenta ##
mag2 <- colorRampPalette(pal_my[c(18, 5)], alpha = 0.75) ## "#ffdafd" = very pale magenta
blues <- colorRampPalette(c(pal_my[c(1, 15)]), alpha = T) ## "#d9e1fe" = light grayish blue ##
cyans <- colorRampPalette(c(pal_my[1], pal_my[2], pal_my[11]), alpha = T)
grblues <- colorRampPalette(c(pal_my[17], pal_my[16]), alpha = T)
grays <- colorRampPalette(pal_my[c(2, 18, 19)], alpha = T)
grays2 <- colorRampPalette(pal_my[c(1, 18, 20)], alpha = T)
grblues2 <- colorRampPalette(c("#d9e1fe", pal_my[16]), alpha=T)
blues2 <- colorRampPalette(c("#ffffff", pal_my[14]), alpha = T) ## "#d9e1fe" = light grayish blue ##
whcybl <- colorRampPalette(pal_my[c(1, 12, 16)], alpha = T)
whblmg <- colorRampPalette(pal_my[c(1, 16, 4)], alpha = T)
blgrmg <- colorRampPalette(pal_my[c(16, 2, 5)], alpha = T)
cols <- colorRampPalette(pal_my, alpha = T)
cols1 <- colorRampPalette(pal_my[3:19], alpha = T)
cols2 <- colorRampPalette(pal_my2, alpha = T)
cols3 <- colorRampPalette(pal_my[3:16], alpha = T)
cols4 <- colorRampPalette(pal_my[c(3:5, 10, 12:16)], alpha = T)
pdxcols <- colorRampPalette(pal_pdx[c(3, 1)], alpha = T)
sci <- colorRampPalette(pal_sci, alpha = T)
lancet <- colorRampPalette(pal_lancet, alpha = T)
nord_polar <- colorRampPalette(c(pal_nord$polar, pal_nord$snow), alpha = TRUE)
nord_snow <- colorRampPalette(pal_nord$snow, alpha = TRUE)
nord_frost <- colorRampPalette(pal_nord$frost, alpha = TRUE)
nord_aurora <- colorRampPalette(pal_nord$aurora, alpha = TRUE)
grays_nord <- colorRampPalette(pal_nord$polar[c(8, 1)])
