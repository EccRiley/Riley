Rmdhist <- function(x, width = ceiling(sqrt(ncol(x))), length = ceiling(ncol(x)/width), pal = mpal(seq(1:ncol(x)), p = ppal), labs = colnames(x), xlab = labs, main = NULL, plotTitle = NULL, outerTitle = TRUE, ...) {
    par(mfrow = c(length, width))
    for (i in 1:ncol(x)) {
        hist(x[, i], col = pal[i], freq = FALSE, main = main[i], xlab = xlab[i], ...);
        lines(density(x[, i], na.rm = TRUE), lwd = 1, lty = "dotted", ...)
        if (!is.null(title)) title(plotTitle, outer = outerTitle)
    }
    on.exit(par(mfrow = c(1, 1))) ## NEED TO FIX THIS ##
}
