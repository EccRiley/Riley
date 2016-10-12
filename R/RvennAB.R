#' ## **`RvennAB()`**
#'
#' This is a slightly more complex version of **`RvennA()`**, but is still a transferable/skeletal version of the euler venn diagram function I use specifically for my stuff (see **`REvennA()`**)
#'
#'
library(VennDiagram)
library(venneuler)


RvennAB <- function(x,
                    vcol,
                    labs = rev(names(x)),
                    al = 0.5,
                    lcex = 1,
                    adj = NULL,
                    ...) {
    A <- x[[2]]
    AB <- x[[1]]
    evenn <- venneuler(c(A = A, "A&B" = AB))
    evenn$labels <- c("", "")
    plot(evenn, col = vcol, alpha = al, ...)
    text(
        evenn$centers,
        labels = labs,
        col = mypal[1],
        cex = lcex,
        adj = adj
    )
    return(evenn)
}
