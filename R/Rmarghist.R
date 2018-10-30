## RMARGHIST() DEF ##
## ORIG SOURCE: https://www.r-bloggers.com/example-8-41-scatterplot-with-marginal-histograms/ ##

Rmarghist <- function(x, y,
                      layoutMat =  matrix(c(2, 0, 1, 3), ncol = 2, byrow = TRUE),
                      respectMat = TRUE, widths = c(4/5, 1/5), heights = c(1/5, 4/5),
                      type.main = "p", col.symbol = par("col"),
                      col.hist = list(x = par("col"),
                                      y = adjustcolor(par("col"), alpha.f = 0.5)),
                      mar.main = c(5.1, 4.1, 1, 1),
                      mar.xhist = c(0, 4.1, 1, 1),
                      mar.yhist = c(5.1, 0, 1, 1),
                      ...) {

    ## SAVE USER'S ORIGINAL PLOT PARAMS ##
    opar <- par(no.readonly = TRUE)

    ## PLOTTING AREA / CANVAS LAYOUT ##
    layout(mat = layoutMat,
           widths = widths,
           heights = heights,
           respect = respectMat)

    ## MAIN PLOT ##
    par(mar = mar.main)
    plot(x, y,
         col = col.symbol,
         type = type.main,
         ...)

    ## MARGINAL HISTOGRAMS ##
    xhist <- hist(x, plot = FALSE)
    yhist <- hist(y, plot = FALSE)
    top <- max(c(xhist$counts, yhist$counts))

    ### TOP (X) MARGINAL HIST ###
    par(mar = mar.xhist)
    barplot(xhist$counts, axes = FALSE, ylim = c(0, top), space = 0,
            col = ifelse("x" %in% tolower(names(col.hist)), col.hist$x, col.hist))

    ### RIGHT (Y) MARGINAL HIST ###
    par(mar = mar.yhist)
    barplot(yhist$counts, axes = FALSE, xlim = c(0, top), space = 0,
            col = ifelse("y" %in% tolower(names(col.hist)), col.hist$y, col.hist),
            horiz = TRUE)

    ## RESTORE USER'S ORIG PLOT PARAMS ##
    on.exit(par(opar))
}


# EXAMPLES -----------------------------------------------------------

# ## TEST DATA ##
# y <- runif(100000, min = 0.0, max = 0.2)
# x <- rbinom(100000, size = 100, prob = y)
#
# ## TEST PLOT LAYOUT ##
# widths <- c(4/5, 1/5)
# heights <- c(1/5, 4/5)
#
# ## TEST PLOT AESTHETICS ##
# col.symbol1 <- adjustcolor(darken(pal_dl[[1]]), alpha.f = 0.25)
# col.symbol2 <- adjustcolor(mpal(1:100), alpha.f = 0.25)
#
# col.hist1 <- list(x = darken(pal_dl[[1]]), y = darken("darkgray"))
# col.hist2 <- mpal(1:100)
#
# Rmarghist(x, y, col.hist = col.hist1,
#           col.symbol = col.symbol1)
# Rmarghist(x, y, col.hist = col.hist1,
#           col.symbol = col.symbol2)
