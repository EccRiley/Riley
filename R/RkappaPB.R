#' ## **`RkappaPB()`**
#'
#' Function for calculating prevalence and bias in a contingency table (for kappa/interrater reliability analysis). x: matrix object, or other object that can be coerced to a 2x2 matrix object, containing the contingency table's non-marginal cell values in clockwise order (see details), or a 2x2 matrix-like (e.g., dataframe, table, etc) object representing the contingency table's non-marginal cells. n: total number of ratings in the contingency table [@sim2005kappa]. "`stat`" = character value of length 1 specifying the supplementary statistic(s) to calculate.^["`p`" = Prevalence, "`b`" = Bias, "`pb`"  = Prevalence and Bias (`DEFAULT`)]
#'
RkappaPB <- function(x, n, stat = "pb") {
    if (length(x) != 4) {
        stop('length(x) must equal 4')
    }
    if (class(x) != "matrix") {
        if (class(x) == "data.frame") {
            x <- matrix(x, 2)
        }
        else if (class(x) == "table") {
            x <- matrix(x, 2)
        }
        else if (class(x) == "list") {
            x <- matrix(x, 2)
        }
        else {
            stop('x must be either a list of length 4 OR a 2x2 matrix, table, or dataframe')
        }
    }
    a <- x[1, 1]
    b <- x[1, 2]
    c <- x[2, 1]
    d <- x[2, 2]
    if (stat == "p") {
        Prevalence <- (abs(a - d)) / n
        return(Prevalence)
    }
    if (stat == "b") {
        Bias <- (abs(b - c)) / n
        return(Bias)
    }
    if (stat == "pb") {
        p <- (abs(a - d)) / n
        b <- (abs(b - c)) / n
        pb <- list(Prevalence = p, Bias = b)
        return(pb)
    }
}
#'
