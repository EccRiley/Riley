#' ## **`R.r2var()`**
#'
Rr2var <- function(x) {
    x$CID <- rownames(x)
    return(x)
}
#'
