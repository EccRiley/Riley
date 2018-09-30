#' ## **`Rgrad_*()`**
#'
#'
#' Polychromatic gradient generation, using palette specified from '`colorRampPalette(n)`', with '`n`' determined by length of, or number of rows in, '`x`'
Rgrad_poly <- function(x, p = cols1, alpha = 1) {
    if (class(x) == "data.frame")
        l <- nrow(x)
    else
        l <- length(x)
    adjustcolor(p(l), alpha.f = alpha)
}

#' Monochromatic gradient generation
Rgrad_mono <- function(x, start = 0.25, col = pp[20]) {
    if (is.null(dim(x))) { 
        sapply(seq(start, 1, length.out = length(x)), 
                   function(z) adjustcolor(col, alpha.f = z))
    } else {
        sapply(seq(start, 1, length.out = dim(x)[[1]]), 
                   function(z) adjustcolor(col, alpha.f = z))
    }
}

#'
