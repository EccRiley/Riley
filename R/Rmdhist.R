Rmdhist <- function(x, width = ceiling(sqrt(ncol(x))), height = ceiling(ncol(x)/width), pal = mpal(seq(1:ncol(x)), p = ppal), border = "#3e3e3e", lwd = 1, lty = "dotted", col.lines = "#000000", labs = colnames(x), xlab = labs, main = NULL, plotTitle = NULL, outerTitle = TRUE, ...) {
    opar <- par(no.readonly = TRUE) 
    par(mfrow = c(height, width))
    for (i in 1:ncol(x)) {
        hist(x[, i], col = pal[i], border = border, freq = FALSE, main = main[i], xlab = xlab[i], ...);
        lines(density(x[, i], na.rm = TRUE), lwd = lwd, lty = lty, col = col.lines)
        if (!is.null(title)) title(plotTitle, outer = outerTitle)
    }
    on.exit(par(opar))
}
