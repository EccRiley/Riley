## original source == https://csgillespie.github.io/efficientR/3-3-r-startup.html#r-startup ##
## i added transparent background and italic main font, and i removed the mfrow specification (bc I use this function as part of a knitr chunk hook, and don't want it messing anything up for in those cases ##
Rpar <- function(mar = c(3, 3, 2, 1), mgp = c(2, 0.4, 0), 
                      bg = "transparent", tck = -.01, 
                      font.main = 3, cex.axis = 0.9,
                      las = 1, ...) { #mfrow = c(1, 1), 
    par(mar = mar, mgp = mgp, tck = tck,
        cex.axis = cex.axis, las = las, ...) #mfrow = mfrow
}
