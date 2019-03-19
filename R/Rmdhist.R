
# TODO - IMPLEMENT MARGIN OPTS -------------------------------------------------

Rmdhist <- function(x, plot = TRUE, freq = FALSE, return.res = FALSE, width = ceiling(sqrt(ncol(x))), height = ceiling(ncol(x)/width), pal = mpal(seq(1:ncol(x)), p = ppal), border = rep("#3e3e3e", ncol(x)), lwd = rep(1.5, ncol(x)), lty = rep("dotted", ncol(x)), pal.lines = rep("#000000", ncol(x)), labs = colnames(x), xlab = labs, main = NULL, ylab = rep("Density", ncol(x)), plotTitle = NULL, outerTitle = TRUE, ...) {
    x <- as.data.frame(x)
    res <- apply(x, 2, function(x) hist(x, plot = FALSE))
    if (plot) {
        opar <- par(mfrow = c(height, width))
        # par(mfrow = c(height, width))
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

Rmdecdf <- function(x, plot = TRUE, return.res = TRUE,
                    width = ceiling(sqrt(ncol(x))), height = ceiling(ncol(x)/width),
                    pal = mpal(seq(1:ncol(x)), p = ppal), pal.points = pal,
                    lwd = rep(1, ncol(x)), lty = rep("solid", ncol(x)),
                    pch = rep(19, ncol(x)), cex.points = rep(0.5, ncol(x)),
                    labs = colnames(x), xlab = labs, main = NULL,
                    ylab = rep("Density", ncol(x)), plotTitle = NULL, outerTitle = TRUE,
                    human_numbers = TRUE, human_numbers_symbol = "$",
                    human_numbers_scale = "m", human_numbers_signif = 1,
                    ...) {

    x <- as.data.frame(x)
    ## ECDF OBJECTS ##
    xq <- apply(x, 2, function(y) quantile(ecdf(y)))
    xs <- apply(x, 2, function(y) summary(ecdf(y)))
    ## PLOTTING ##
    if (plot) {
        mar.mdhist <- c(4.1, 2.1, 1.5, 1.1)
        oma.ptitle <- c(0, 0, 3, 0)
        # opar <- par(no.readonly = TRUE)

        if (!is.null(plotTitle)) {
            opar <- par(mfrow = c(height, width), mar = mar.mdhist, oma = oma.ptitle)
        } else {
            opar <- par(mfrow = c(height, width), mar = mar.mdhist)
        }

        for (i in 1:ncol(x)) {
            plot.ecdf(ecdf(x[, i]), col = pal[i], col.points = pal.points[i],
                      lwd = lwd, lty = lty, cex.points = cex.points,
                      main = main[i], xlab = xlab[i], xaxt = "n", ...);
            if (human_numbers) {
                axis(1, at = pretty(x[, i]),
                     labels = human_numbers(pretty(x[, i]),
                                            smbl = human_numbers_symbol,
                                            scale = human_numbers_scale,
                                            signif = human_numbers_signif))
            } else {
                axis(1, at = pretty(x[, i]), labels = pretty(x[, i]))
            }
            if (!is.null(plotTitle)) title(plotTitle, outer = outerTitle)
        }
        on.exit(par(opar))
    }
}
