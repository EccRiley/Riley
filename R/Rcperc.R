#' ## **`R.cperc()`**
#'
Rcperc <- function(x, cb = 103, tex = FALSE) {
    n <- sum(x) # where `x` is a vector
    if (tex) {
    	n <- paste0(comma((n / cb) * 100), "\\%")
    } else {
    	n <- paste0(comma((n / cb) * 100), "%")
    }
    return(n)
}
#' 
