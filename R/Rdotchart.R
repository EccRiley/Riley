#' # `Rdotchart()`
#'
#' Exactly the same as "`dotchart()`" in base-graphics, but with an added option to set the font graphical parameter (see "`?par`") for the group and point labels separately ("gfont" (lines 86:87 below) and lfont" (lines 76:77 below), respectively), as well as an added option to set the group label "cex" ("gcex"). I'd like to do more with this function to make it a bit more versatile.

Rdotchart <- function (x, labels = NULL, groups = NULL, gdata = NULL, gfont = par("font"),
                       lfont = par("font"), cex = par("cex"), gcex = par("cex"),
                       pt.cex = cex, pch = 21, gpch = 21, bg = par("bg"), color = par("fg"),
                       gcolor = par("fg"), lcolor = "gray", xlim = range(x[is.finite(x)]),
                       main = NULL, xlab = NULL, ylab = NULL, ...)
{
    opar <- par("mai", "mar", "cex", "yaxs")
    on.exit(par(opar))
    par(cex = cex, yaxs = "i")
    if (!is.numeric(x))
        stop("'x' must be a numeric vector or matrix")
    n <- length(x)
    if (is.matrix(x)) {
        if (is.null(labels))
            labels <- rownames(x)
        if (is.null(labels))
            labels <- as.character(1L:nrow(x))
        labels <- rep_len(labels, n)
        if (is.null(groups))
            groups <- col(x, as.factor = TRUE)
        glabels <- levels(groups)
    }
    else {
        if (is.null(labels))
            labels <- names(x)
        glabels <- if (!is.null(groups))
            levels(groups)
        if (!is.vector(x)) {
            warning("'x' is neither a vector nor a matrix: using as.numeric(x)")
            x <- as.numeric(x)
        }
    }
    plot.new()
    linch <- if (!is.null(labels))
        max(strwidth(labels, "inch"), na.rm = TRUE)
    else 0
    if (is.null(glabels)) {
        ginch <- 0
        goffset <- 0
    }
    else {
        ginch <- max(strwidth(glabels, "inch"), na.rm = TRUE)
        goffset <- 0.4
    }
    if (!(is.null(labels) && is.null(glabels))) {
        nmai <- par("mai")
        nmai[2L] <- nmai[4L] + max(linch + goffset, ginch) +
            0.1
        par(mai = nmai)
    }
    if (is.null(groups)) {
        o <- 1L:n
        y <- o
        ylim <- c(0, n + 1)
    }
    else {
        o <- sort.list(as.numeric(groups), decreasing = TRUE)
        x <- x[o]
        groups <- groups[o]
        color <- rep_len(color, length(groups))[o]
        lcolor <- rep_len(lcolor, length(groups))[o]
        offset <- cumsum(c(0, diff(as.numeric(groups)) != 0))
        y <- 1L:n + 2 * offset
        ylim <- range(0, y + 2)
    }
    plot.window(xlim = xlim, ylim = ylim, log = "")
    lheight <- par("csi")
    if (!is.null(labels)) {
        linch <- max(strwidth(labels, "inch"), na.rm = TRUE)
        loffset <- (linch + 0.1)/lheight
        labs <- labels[o]
        mtext(labs, side = 2, line = loffset, at = y, adj = 0,
              col = color, las = 2, cex = cex, font = lfont, ...)
    }
    abline(h = y, lty = "dotted", col = lcolor, ...)
    segments(x0 = 0, y0 = y, x1 = x, y1 = y, lty = "solid", col = lcolor, lwd = 2)
    points(x, y, pch = pch, col = color, bg = bg, cex = pt.cex/cex, ...)
    if (!is.null(groups)) {
        gpos <- rev(cumsum(rev(tapply(groups, groups, length)) +
                               2) - 1)
        ginch <- max(strwidth(glabels, "inch"), na.rm = TRUE)
        goffset <- (max(linch + 0.2, ginch, na.rm = TRUE) + 0.1)/lheight
        mtext(glabels, side = 2, line = goffset, at = gpos, adj = 0,
              col = gcolor, las = 2, cex = gcex, font = gfont, ...)
        if (!is.null(gdata)) {
            abline(h = gpos, lty = "dotted", ...)
            points(gdata, gpos, pch = gpch, col = gcolor, bg = bg,
                   cex = pt.cex/cex, ...)
        }
    }
    axis(1, ...)
    box(...)
    title(main = main, xlab = xlab, ylab = ylab, ...)
    invisible()
}
