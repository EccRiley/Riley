#' ## **`RvennA()`**
#'
#' This is a skeletal version of the euler venn diagram function I use specifically for my stuff (see **`REvennA()`** and **`REvennA()`**)
#'
#'
RvennA <- function(x, vcol, ...) {
    library(VennDiagram)
    library(venneuler)
    evenn <- venneuler(x)
    evenn$labels <- NA
    plot(evenn, col = vcol, alpha = .75, ...)
    text(evenn$centers,
         labels = colnames(x),
         col = "#c0c0c0",
         cex = 2)
    return(evenn)
}
