#' ## **`RvennX()`**
#'
#' This one is the most complex of the venn diagram functions I've written thus far (see **`RvennA()`** \& **`RvennAB()`**). Its defaults are highly specific to my own needs and personal style conventions.
#'
REvennA <-
    function(x,
             ffamily = "serif",
             vcol = mypal1[c(21, 22)],
             labs = rev(names(x)),
             al = 0.5,
             lcex = 1,
             ltextx = evenn$centers[, 1],
             ltexty = evenn$centers[, 2],
             ptextx = 0.4,
             ptexty = 0.45,
             pmain = NULL,
             pmcex = 0.95,
             pmfont = 3,
             keep = FALSE,
             ...) {
        library(VennDiagram)
        library(venneuler)
        palette(mypal)
        par(family = ffamily, mar = (c(0.5, 0.5, 2, 0.5) + 0.1))
        A <- x[[2]]
        AB <- x[[1]]
        evenn <- venneuler(c(A = A, "A&B" = AB))
        evenn$labels <- c("", "")
        ABperc <- round((AB / A) * 100, 0)
        ABperc <- paste0(ABperc, "%")
        plot(
            evenn,
            col = vcol,
            alpha = al,
            main = pmain,
            cex.main = pmcex,
            font.main = pmfont
        )
        box(lwd = 0.5, col = 20)
        text(
            x = ltextx,
            y = ltexty,
            labels = labs,
            col = mypal[1],
            cex = lcex
        )
        text(
            ptextx,
            ptexty,
            labels = ABperc,
            col = mypal[1],
            cex = lcex,
            font = 3
        )
        if (keep == TRUE) {
            return(evenn)
        }
    }
#'
