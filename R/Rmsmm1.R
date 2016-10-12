#' ## **`R.msmm()`**
#'
#' A function for creating a quick, simple, mostly report-ready, summary table reporting `mean, sd, min, max` (hence "`msmm`") for the numeric columns in a given single vector. The returned value from `R.msmm1()` can be passed to `knitr::kable()` for creating a report-ready output table.
#'
R.msmm1 <- function(x) {
    xM <- mean(x, na.rm = TRUE)
    xSD <- sd(x, na.rm = TRUE)
    xMIN <- min(x, na.rm = TRUE)
    xMAX <- max(x, na.rm = TRUE)
    xNA <- sum(is.na(x))
    summ <- data.frame(xM, xSD, xMIN, xMAX, xNA)
    names(summ) <- c("M", "SD", "Min", "Max", "NAs")
    return(summ)
}
#'
