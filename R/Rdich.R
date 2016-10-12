#' ## **`Rdich()`**
#'
#' Function for dichotomizing numeric data.^[This probably exists in one or more packages, but the function simple enough to define here, so I'd rather just do myself.]
#'
Rdich <- function(x,
                   min = 0,
                   values = c(0, 1)) {
    if (is.numeric(x)) {
        x[x > min] <- values[2]
        x[x <= min] <- values[1]
    }
    else
        stop('x must be numeric')
    return(x)
}
#'
