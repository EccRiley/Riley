Rnetscore <- function(x, percent = FALSE) {
    x <- na.omit(x)
    good <- length(x[x == 1])
    bad <- length(x[x == -1])
    neutral <- length(x[x == 0])
    total <- sum(good, bad, neutral)
    res <- ((good - bad) / total)
    if (percent) {
        return(res*100)
    } else
        return(res)
}

Rnet <- function(x) {
    x <- na.omit(x)
    net <- ifelse(x <= 3, -1, x)
    net <- ifelse(net == 4, 0, net)
    net <- ifelse(net == 5, 1, net)
    return(net)
}
