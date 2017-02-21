#' ## **`RstrIndex()`**
#'
#' Assign NA to specified string value within dataframe. This function is written primarily for use with '`apply()`', '`sapply()`', '`vapply()`', and/or '`lapply()`' (`{pkg:base}`).
#'
RstrIndex <- function(x, str) {
    is.na(x) <- which(x == str)
    return(x)
}
