#' ## **`R.revcol()`**
#'
Rrevcol <- function(x) {
    y <- names(x)
    x <- x[, rev(y)]
    return(x)
}
