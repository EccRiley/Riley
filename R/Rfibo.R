## Rfibo() ##
#' Simple fun to produce fibonacci sequence of user-specified length and started at user-specified seed.

Rfibo <- function(n, seed = 0L) {
    if (n == 1) {
        return(seed)
    } else if (n == 2) {
        return(c(seed, seed + 1))
    } else {
    vn <- c(seed, seed + 1L, rep(0, n - 2))
    for (i in 3:n) {
        vn[i] <- vn[i - 1] + vn[i - 2]
    }
    return(vn)
    }
}

#' args:
#'
#' - n: length of output sequence (including seed)
#' - seed: integer (default == 0L) specifying the starting point of the output sequence)
