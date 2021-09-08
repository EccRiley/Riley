Rrescale_mm <- function(x, inverse = FALSE, na.rm = TRUE) {
    minx <- min(x, na.rm = na.rm)
    maxx <- max(x, na.rm = na.rm)
    if (inverse == TRUE) {
        y_top <- abs(minx - x)
        y_botm <- abs(minx - maxx)
    } else {
        y_top <- x - minx
        y_botm <- maxx - minx
    }

    y0 <- y_top/y_botm
    if (inverse == TRUE) {
        y <- 1 - y0
    } else {
        y <- y0
    }
    return(y)
}
