Rmdhist <- function(x, width = ceiling(sqrt(ncol(x))), length = ceiling(ncol(x)/width), pal = mpal(seq(1:ncol(x)), p = cols3), labs = colnames(x), xlab = labs, main = paste0("Histogram of ", labs), ...) {
    origPar <- par("mfrow")
    par(mfrow = c(length, width))
    for (i in 1:ncol(x)) {
        hist(x[, i], col = pal[i], freq = FALSE, main = main[i], xlab = xlab[i], ...);
        lines(density(x[, i], na.rm = TRUE), lwd = 1, lty = "dotted", ...)
    }
    on.exit(par(mfrow = origPar))
}
