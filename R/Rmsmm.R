#' ## **`R.msmm()`**
#'
#' A function for creating a quick, simple, mostly report-ready, summary table reporting `mean, sd, min, max` (hence "`msmm`") for the numeric columns in a given table, dataframe, or matrix. The returned value from `R.msmm()` can be passed to `knitr::kable()` for creating a report-ready output table.
#'
#'
#' ## **`Rmsmm()`**
#'
Rmsmm <- function(x, d = 2) {
	require(dplyr)#, quietly = TRUE, warn.conflicts = FALSE) ## tempted to make totally quiet, but worried this could cause users issues if not aware of dplyr package loading & corresponding potential conflicts ## 
    if (is.null(ncol(x))) {
        if (!is.numeric(x)) stop("x must be numeric.");
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
        if (all(sapply(x, is.numeric) == FALSE)) stop("No numeric columns in the data.");
        if (is.matrix(x)) {
            x <- as.data.frame(x)
        }
        xM <- dplyr::summarise_if(x, is.numeric, funs(mean(., na.rm = TRUE)))
        xSD <- dplyr::summarise_if(x, is.numeric, funs(sd(., na.rm = TRUE)))
        xMIN <- dplyr::summarise_if(x, is.numeric, funs(min(., na.rm = TRUE)))
        xMAX <- dplyr::summarise_if(x, is.numeric, funs(max(., na.rm = TRUE)))
	XNA <- dplyr::summarise_if(x, is.numeric, funs(Risna(., na.rm = TRUE)))
        #xNA <- sapply(x, Riley::Risna)
        summ <- rbind(xM, xSD, xMIN, xMAX, xNA)
        row.names(summ) <- c("M", "SD", "Min", "Max", "NAs")
        summ <- as.data.frame(t(summ))
        summ <- apply(summ, 2, round, digits = d)
        return(summ)
    }
}

x <- matrix(letters[1:9], nrow = 3) ## causes error ##
x <- c(letters[1:9]) ## causes error ##
x <- matrix(1:9, nrow = 3) ## runs just fine ##
