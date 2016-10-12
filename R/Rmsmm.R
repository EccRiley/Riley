#' ## **`R.msmm()`**
#'
#' A function for creating a quick, simple, mostly report-ready, summary table reporting `mean, sd, min, max` (hence "`msmm`") for the numeric columns in a given table, dataframe, or matrix. The returned value from `R.msmm()` can be passed to `knitr::kable()` for creating a report-ready output table.
#'
Rmsmm <- function(x) {
    if (is.null(ncol(x))) {
        xM <- mean(x, na.rm = TRUE)
        xSD <- sd(x, na.rm = TRUE)
        xMIN <- min(x, na.rm = TRUE)
        xMAX <- max(x, na.rm = TRUE)
        xNA <- sum(is.na(x))
        summ <- data.frame(xM, xSD, xMIN, xMAX, xNA)
        names(summ) <- c("M", "SD", "Min", "Max", "NAs")
        return(summ)
    } else {
        nums <- sapply(x, is.numeric)
        xn <- x[, nums]
        xM <- dplyr::summarise_each(xn, funs(mean(., na.rm = TRUE)))
        xSD <- dplyr::summarise_each(xn, funs(sd(., na.rm = TRUE)))
        xMIN <-
            dplyr::summarise_each(xn, funs(min(., na.rm = TRUE)))
        xMAX <-
            dplyr::summarise_each(xn, funs(max(., na.rm = TRUE)))
        summ <- rbind(xM, xSD, xMIN, xMAX)
        row.names(summ) <- c("M", "SD", "Min", "Max")
        summ <- as.data.frame(t(summ))
        return(summ)
    }
}