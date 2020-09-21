# FUNCTIONS FOR DARKENING/LIGHTENING COLORS -----------------------------------------
## ORIGINAL SOURCE: https://gist.github.com/Jfortin1/72ef064469d1703c6b30 ##

darken <- function(color, factor = 1.4){
    col <- col2rgb(color)
    col <- col/factor
    col <- rgb(t(col), maxColorValue = 255)
    col
}

lighten <- function(color, lfactor = 1.4){
    clr0 <- col2rgb(color)
    clr_check <- any(sapply(clr0*lfactor, function(x) x > 255))
    if (clr_check) { 
        clr <- clr0
    } else {
        clr <- clr0*lfactor
        }
    clr <- rgb(t(clr), maxColorValue = 255)
    return(clr)
}


## 'Rpals': A 'LIVING' (I.E., LIKELY TO GROW/CHANGE) COLLECTION OF COLOR PALETTES. THESE WILL BE VECTORIZED IN ANY 'OFFICIAL' PACKAGE DEPLOYMENTS/PUBLICATIONS BEYOND THIS GIT REPO ## 
### MOST OF THESE WERE ORIGINALLY COMPILED FOR USE WITH USED WITH `colorRampPalette(...)`

# BASE (CATEGORICAL) PALETTES ------------------------------------------------------
pal_rye <- c("#eef0f2", "#d1d6dc", "#da00d1", "#a700a0", "#74006f", "#dee800", "#adb500", "#00f485", "#00b965", "#006d3b", "#00d8d8", "#008b8b", "#003f3f", "#053efa", "#0434d4", "#021860", "#7a8998", "#56636f", "#2e363e", "#181C20")
options(palette = pal_rye)
pal_rye3 <- pal_rye[3:16] ## NO WHITE, GRAY, NOR BLACK ##
pal_rye2 <- pal_rye[c(4, 9, 12, 15)]
pal_rye22 <- c("#29B78B", "#0434D4", "#00E6AE", "#01AFD7", "#A700A0")
pal_rye.a75 <- sapply(pal_rye, adjustcolor, alpha.f = 0.75)
pal_rye.a50 <- sapply(pal_rye, adjustcolor, alpha.f = 0.50)
pal_fivecats <- c(orange = "#EA8A1A", yellow = "#D7C700", purple = "#B090B0", lightblue = "#7799CC", green = "#85991E")

## BRAND-SPECIFIC PALETTES ==============================================
### THESE ARE PRIMARILY SPECIFIC TO ORGS THAT I CURRENTLY OR PREVIOUSLY WORKED IN/WITH ##
pal_gsu <- c(blue = "#0039A6", red = "#CC0000", darkgray = "#666666") ## GEORGIA STATE UNIVERSITY ##
pal_pdx <- c(green = "#8b9535", white = "#ffffff", darkgray = "#373737") ## PORTLAND STATE UNIV. (dark/hunter green, white, very dark gray) ##
pal_dl <- c(deltablue = "#003366", deltared = "#C01933", passportplum = "#2E1A47", white = "#ffffff") ## DELTA AIR LINES ## 
pal_dl2 <- c(deltablue = pal_dl[[1]], ## PAL_DL2 = PAL_DL COMBINED WITH MY VERSION OF DELTA'S ANCILLARY COLOR PALETTES ##
             widgetredlite = "#E01933",
             passportplum = pal_dl[[3]],
             deltayellow = "#EAAA00",
             deltabluelite = "#7D9BC1", 
             deltaorange = "#FF6900", 
             passportplumlite = "#5A315D",
             darkdarkgray = pal_rye[20], 
             diamond = "#5a829b",
             platinum = "#35333e", silver = "#8b9191", 
             darkbcrfpink = "#d7006f", safetygreen = "#8f9a3e",
             widgetreddark = "#991933",
             basicecon = "#3b4864",
             deltabluebrite = "#0A85FF",
             bluegraymed = "#AAADB8",
             bluegraydark = "#515460",
             bluegraylite = "#CCCED4",
             bluegraylitest = "#EEEFF1")

pal_fcs <- c(green = rgb(0, 88, 64, maxColorValue = 255), ## FULTON COUNTY SCHOOLS (GA) ##
             gold = rgb(187, 152, 4, maxColorValue = 255), 
             red = rgb(146, 42, 70, maxColorValue = 255), 
             blue = rgb(0, 56, 118, maxColorValue = 255)) 

## CATEGORICAL-2-CONTINUOUS-2-CATEGORICAL PALETTES ==============================================
## (ORIG. CREATED FOR THE GENDER & VIOLENCE INTERVENTIONS RESEARCH TEAM'S (PORTLAND STATE UNIV.), NATIONAL BIP STANDARDS AND MONITORING STUDY (2014:2018) ##
pal_yn <- pal_rye[c(10, 1, 2)] ## BINARY ##
pal_cat_blue <- pal_rye[c(16, 1, 17)] ## 1 FOCAL CAT (DARK BLUE) + 2 ANCILLARY CATS (LIGHT & MEDIUM GRAY) ##
pal_cat_blue2 <- pal_rye[c(16, 18, 17)] ## 1 FOCAL CAT (DARK BLUE) + 2 ANCILLARY CATS (MEDIUM & DARK GRAY) ##
pal_cat_mag <- pal_rye[c(5, 1, 17)] ## 1 FOCAL CAT (DARK MAGENTA) + 2 ANCILLARY CATS (LIGHT & MEDIUM GRAY) ##
pal_cat_mag2 <- pal_rye[c(5, 18, 17)] ## 1 FOCAL CAT (DARK MAGENTA) + 2 ANCILLARY CATS (MEDIUM & DARK GRAY) ##
pal_cat_bluemag <- pal_rye[c(17, 16, 5)] ## 1 ANCILLARY CAT (MEDIUM GRAY) + 2 FOCAL CATS (DARK BLUE & DARK MAGENTA) ## 

## FROM THE 'HIGH-COLOR' PALETTES ==============================================
pal_HC <- c("#7cb5ec", "#434348", "#90ed7d", "#f7a35c", "#8085e9", "#f15c80", "#e4d354", "#8085e8", "#8d4653", "#91e8e1") ## 'High Color' Color palette from `{ggthemes}` ##
pal_HCd <- c("#2b908f", "#90ee7e", "#f45b5b", "#7798BF", "#aaeeee", "#ff0066", "#eeaaee", "#55BF3B", "#DF5353", "#7798BF", "#aaeeee") ## 'High Color - Dark' color palette

## FROM THE ['ARTIC'/'NORD' PALETTE(S)'](https://github.com/arcticicestudio/nord) ==============================================
pal_nord <- list(
    polar = c("#2e343f", "#3b4251", "#434c5c", "#4c5668", "#7c889f", "#8b95aa", "#9ba5b6", "#b8c0cc"),
    snow = c("#d8dee8", "#e5e9ef", "#eceff4", "#ffffff"),
    frost = c("#8fbcbb", "#88c0ce", "#81a1be", "#5e81a8"),
    aurora = c("#bf606b", "#d08674", "#ebca93", "#a3be91", "#b48eab")
)

## [TWITTER NIGHT MODE PALETTE](https://www.color-hex.com/color-palette/55334) ##
pal_twitter_night <- c("#ffffff", "#c51f5d", "#243447","#141d26", "#0E141B")

# PALETTES VIA THE ['ggsci' PKG](https://cran.r-project.org/web/packages/ggsci/vignettes/ggsci.html) ==============================================
require(ggsci)
pal_sci <- pal_aaas()(8)
pal_lz <- pal_locuszoom()(6)
pal_lancet <- pal_lancet("lanonc")(7)[-6]

## '`PP`' <- (A PALETTE FROM PALETTES) ==============================================
pp <- c(pal_sci, pal_lz, pal_lancet, pal_rye[3:16])
pp <- pp[c(20, 6, 2, 9, 10, 24, 25, 11, 17, 26, 3, 27, 29, 5, 31, 12, 18, 32, 33, 34, 13, 15, 1, 7, 19, 14, 21, 22, 23, 4, 8)]

pal_cat7 <- c("black",
              darken("darkgray", factor = 2),
              darken(pp[30]),
              darken(pp[2]),
              darken(pp[21], factor = 2),
              darken(pp[24], factor = 2),
              darken(pp[6]),
              darken(pp[14], factor = 1.7))


# COLOR RAMPS --------------------------------------------

ppal <- colorRampPalette(pp, alpha = TRUE, interpolate = "spline")
mb <- colorRampPalette(pal_rye[c(5, 16)])
colsHC <- colorRampPalette(pal_HC, alpha = T)
colsHCd <- colorRampPalette(pal_HCd, alpha = T)
mag <- colorRampPalette(pal_rye[c(1, 5)], alpha = 0.75) ## "#ffdafd" = very pale magenta ##
mag2 <- colorRampPalette(pal_rye[c(18, 5)], alpha = 0.75) ## "#ffdafd" = very pale magenta
blues <- colorRampPalette(c(pal_rye[c(1, 15)]), alpha = T) ## "#d9e1fe" = light grayish blue ##
cyans <- colorRampPalette(c(pal_rye[1], pal_rye[2], pal_rye[11]), alpha = T)
grblues <- colorRampPalette(c(pal_rye[17], pal_rye[16]), alpha = T)
grays <- colorRampPalette(pal_rye[c(2, 18, 19)], alpha = T)
grays2 <- colorRampPalette(pal_rye[c(1, 18, 20)], alpha = T)
grblues2 <- colorRampPalette(c("#d9e1fe", pal_rye[16]), alpha=T)
blues2 <- colorRampPalette(c("#ffffff", pal_rye[14]), alpha = T) ## "#d9e1fe" = light grayish blue ##
whcybl <- colorRampPalette(pal_rye[c(1, 12, 16)], alpha = T)
whblmg <- colorRampPalette(pal_rye[c(1, 16, 4)], alpha = T)
blgrmg <- colorRampPalette(pal_rye[c(16, 2, 5)], alpha = T)
cols <- colorRampPalette(pal_rye, alpha = T)
cols1 <- colorRampPalette(pal_rye[3:19], alpha = T)
cols2 <- colorRampPalette(pal_rye2, alpha = T)
cols3 <- colorRampPalette(pal_rye[3:16], alpha = T)
cols4 <- colorRampPalette(pal_rye[c(3:5, 10, 12:16)], alpha = T)
pdxcols <- colorRampPalette(pal_pdx[c(3, 1)], alpha = T)
sci <- colorRampPalette(pal_sci, alpha = T)
sci2 <- colorRampPalette(pal_sci[c(1, 7, 4, 8, 6)])
lancet <- colorRampPalette(pal_lancet, alpha = T)
nord_polar <- colorRampPalette(c(pal_nord$polar, pal_nord$snow), alpha = TRUE)
nord_snow <- colorRampPalette(pal_nord$snow, alpha = TRUE)
nord_frost <- colorRampPalette(pal_nord$frost, alpha = TRUE)
nord_aurora <- colorRampPalette(pal_nord$aurora, alpha = TRUE)
grays_nord <- colorRampPalette(pal_nord$polar[c(8, 1)])

palramp_dl2 <- colorRampPalette(pal_dl2, interpolate = "linear",
                                alpha = TRUE, bias = 0.5)
palramp_dl_base <- colorRampPalette(pal_dl2, interpolate = "linear",
                                    alpha = TRUE, bias = 0.5)

palramp_dl <- colorRampPalette(c(
    darken(pal_dl[[1]], 2),
    lighten(pal_cat7[c(-1, -2, -8)]), darken(pal_dl[c(3, 2)], 2)),
    interpolate = "linear",
    alpha = TRUE, bias = 1.25)

## REVERSE RAINBOW PALETTE BASED ON PAL_DL ##
palramp_dl3 <- c(lighten(pal_dl[[3]]), darken(pal_dl[[1]]), "#0099B4",
                 lighten(pal_dl2[[13]]), pal_dl2[[13]], "#EAAA00", "#FF6900", "#B30126") %>%
    colorRampPalette(alpha = TRUE, interpolate = "spline")

