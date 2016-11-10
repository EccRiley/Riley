#' ## **`R.msmm()`**
#'
#' A function for creating a quick, simple, mostly report-ready, summary table reporting `mean, sd, min, max` (hence "`msmm`") for the numeric columns in a given table, dataframe, or matrix. The returned value from `R.msmm()` can be passed to `knitr::kable()` for creating a report-ready output table.
#'
#'
#' ## **`R.msmm()`**
#'
Rmsmm <- function(x, d = 2) {
    if (is.null(ncol(x))) {
        xM <- mean(x, na.rm = TRUE)
        xSD <- sd(x, na.rm = TRUE)
        xMIN <- min(x, na.rm = TRUE)
        xMAX <- max(x, na.rm = TRUE)
        xNA <- sum(is.na(x))
        summ <- data.frame(xM, xSD, xMIN, xMAX, xNA)
        names(summ) <- c("M", "SD", "Min", "Max", "NAs")
        summ <- apply(summ, 2, round, digits = d)
        return(summ)
    } else {
        nums <- sapply(x, is.numeric)
        xn <- x[, nums]
        xM <- dplyr::summarise_each(xn, funs(mean(., na.rm = TRUE)))
        xSD <- dplyr::summarise_each(xn, funs(sd(., na.rm = TRUE)))
        xMIN <- dplyr::summarise_each(xn, funs(min(., na.rm = TRUE)))
        xMAX <- dplyr::summarise_each(xn, funs(max(., na.rm = TRUE)))
        xNA <- sapply(x, R.isna)
        summ <- rbind(xM, xSD, xMIN, xMAX, xNA)
        row.names(summ) <- c("M", "SD", "Min", "Max", "NAs")
        summ <- as.data.frame(t(summ))
        summ <- apply(summ, 2, round, digits = d)
        return(summ)
    }
}