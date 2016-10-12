#' ## **`Rgrad()`**
#'
#' Gradient generation, using palette specified from '`colorRampPalette(n)`', with '`n`' determined by length of, or number of rows in, '`x`'
#'
Rgrad <- function(x, p = cols1, alpha = 1) {
    if (class(x) == "data.frame")
        l <- nrow(x)
    else
        l <- length(x)
    adjustcolor(p(l), alpha.f = alpha)
}
#'
