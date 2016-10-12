#' ## **`R.idvar()`**
#'
Ridvar <- function(x) {
    x$id <- seq(length(x[, 1]))
    return(x)
}
