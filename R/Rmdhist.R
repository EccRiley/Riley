
# TODO - IMPLEMENT MARGIN OPTS -------------------------------------------------

Rmdhist <- function(x, plot = TRUE, freq = FALSE, return.res = FALSE, width = ceiling(sqrt(ncol(x))), height = ceiling(ncol(x)/width), pal = mpal(seq(1:ncol(x)), p = ppal), border = rep("#3e3e3e", ncol(x)), lwd = rep(1.5, ncol(x)), lty = rep("dotted", ncol(x)), pal.lines = rep("#000000", ncol(x)), labs = colnames(x), xlab = labs, main = NULL, ylab = rep("Density", ncol(x)), plotTitle = NULL, outerTitle = TRUE, ...) {
    x <- as.data.frame(x)
    res <- apply(x, 2, function(x) hist(x, plot = FALSE))
    if (plot) {
        opar <- par(no.readonly = TRUE)
        par(mfrow = c(height, width))
        for (i in 1:ncol(x)) {
            hist(x[, i], col = pal[i], border = border[i], freq = freq, main = main[i],
                 xlab = xlab[i], ylab = ylab[i], ...);
            if (freq == FALSE) {
                lines(density(x[, i], na.rm = TRUE),
                      lwd = lwd[i], lty = lty[i], col = pal.lines[i])
            }
        }
        if (!is.null(title)) title(plotTitle, outer = outerTitle)
        on.exit(par(opar))
    }
    if (return.res) return(res)
}


# IN PROGRESS - RMDECDF --------------------------------------------------------

Rmdecdf <- function(x, plot = TRUE, retirn.res = TRUE,
                    width = ceiling(sqrt(ncol(x))), height = ceiling(ncol(x)/width),
                    pal = mpal(seq(1:ncol(x)), p = ppal), pal.points = pal,
                    lwd = 1, lty = "solid", ...) {
    x <- as.data.frame(x)
    ## ECDF OBJECTS ##
    xq <- apply(x, 2, function(y) quantile(ecdf(y)))
    xs <- apply(x, 2, function(y) summary(ecdf(y)))
    ## PLOTTING ##
    if (plot) {
        opar <- par(no.readonly = TRUE)
        par(mfrow = c(height, width))
        for (i in 1:ncol(x)) {
            plot.ecdf(ecdf(x[, i]), col = pal[i], col.points = pal.points[i],
                      main = main[i], xlab = xlab[i], ...);
            if (!is.null(title)) title(plotTitle, outer = outerTitle)
        }
        on.exit(par(opar))
    }
}
