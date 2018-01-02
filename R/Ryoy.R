Ryoy <- function (x, n = 1) { ## computes univariate year-over-year or month-over-month diff given single numeric data ##
    n2 <- n+1
    if (is.null(dim(x))) {
        for (i in n:length(x)) {
            x.ind <- x[n2:i]
            z.ind <- x[n:i - n]
        }
        yoy <- c(rep(NA, n - 1), x.ind - z.ind)
    }
    else {
        for (i in n:nrow(X)) {
            x.ind <- X[n2:i, ]
            z.ind <- X[n:i - n, ]
        }
        yoy <- rbind(rep(NA, n - 1), x.ind - z.ind)
    }
    #yoy <- x.ind - z.ind
    return(yoy)
}
