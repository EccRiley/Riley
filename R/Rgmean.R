gmean <- function(x) {
    nvalues <- length(x)
    res1 <- prod(x)
    res <- res1^(1/nvalues)
    return(res)
}

gmean_n <- function(...) {
    x <- unlist(c(...))
    return(gmean(x))
}
