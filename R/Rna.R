#' ## **`Rna()`**
#'
#' SURELY THIS ALREADY EXISTS SOMEWHERE, RIGHT???
Rna <- function(x, v = 0) {
    x <- ifelse(is.na(x), v, x)
    x
}