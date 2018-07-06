#'
#' ## **`R.tdf()`**
#'
#' This is a simple convenience wrapper function to print or store `table`-class objects as `dataframes`. Currently only implemented for one object interpretable as a factor, since `stats::ftable()` exists for multi-object tabulation.
#'
#' "..." == additional vectors to table against 'x'
#'

Rtdf <- function(x, ..., names = c(deparse(substitute(x)), "Freq"), outclass = "dt", 
                 exclude = if (useNA == "no") c(NA, NaN), useNA = "no") {
    dt <- c("dt", "data.table")
    df <- c("data.frame", "df")
    m <- c("matrix", "mat")
    l <- c("list", "ls")
    if (outclass %in% dt) {
        require(data.table)
        t <- as.data.table(table(x, ..., exclude = exclude, useNA = useNA))
        names(t) <- names
    } else if (outclass %in% df) {
        t <- as.data.frame(table(x, ..., exclude = exclude, useNA = useNA))
        names(t) <- names
    } else if (outclass %in% m) {
        t <- as.matrix(table(x, ..., exclude = exclude, useNA = useNA))
        colnames(t) <- names
    } else if (outclass %in% l) {
        t <- as.list(table(x, ..., exclude = exclude, useNA = useNA))
    } else 
        stop("'outclass' must be either 'data.table'/'data.frame'/'dt'/'df', 'matrix'/'mat', or 'list'/'ls'")
    return(t)
}
