#' ## **`Rna()`**
#'
#' SURELY THIS ALREADY EXISTS SOMEWHERE, RIGHT???
# Rna <- function(x, v = 0) {
#     x <- ifelse(is.na(x), v, x)
#     x
# }

Rna <- function (x, v = 0, include_inf = TRUE) {
    if (include_inf == TRUE) {
        x <- ifelse(is.na(x) | is.nan(x) | is.infinite(x), v, x)
    } else {
        x <- ifelse(is.na(x) | is.nan(x), v, x)
    }
    
    return(x)
}
