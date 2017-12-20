#' ## **`mpal()`**
#'
#' Random color palette generation, using palette specified from '`colorRampPalette(n)`', with '`n`' determined by length of, or number of rows in, '`x`'.
#'
mpal <- function(x, p = ppal, a = 1, ...) {
    if (class(x) == "data.frame")
        l <- nrow(x)
    else
        l <- length(x)
    # s <- sample(p(l), l, replace = F)
    s <- sample(p(l*2), l, replace = FALSE)
    adjustcolor(s, alpha.f = a)
}
#'
