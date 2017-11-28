Ryoy <- function(x) { ## computes univariate year-over-year or month-over-month diff given single numeric data ##
    if (is.null(dim(x))) {
        for (i in 1:length(x)) {
            x.ind <- x[2:i]
            z.ind <- x[1:i - 1]
        }
      }
    else {
        for (i in 1:nrow(X)) {
            x.ind <- X[2:i, ]
            z.ind <- X[1:i - 1, ]
        }
    }
    yoy <- x.ind - z.ind
    return(yoy)
}
