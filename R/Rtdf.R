#'
#' ## **`R.tdf()`**
#'
#' This is a simple convenience wrapper function to print or store `table`-class objects as `dataframes`. Currently only implemented for one object interpretable as a factor, since `stats::ftable()` exists for multi-object tabulation.
#'
#' "..." == additional vectors to table against 'x'
#'
Rtdf <- function(x, ..., names = c(deparse(substitute(x)), "Freq"), cls = "dt") {
	d <- c("dt", "data.table", "data.frame", "df")
	m <- c("matrix", "mat")
	l <- c("list", "ls")
	if (cls %in% d) {
		require(data.table)
		t <- as.data.table(table(x, ...))
		names(t) <- names
	} else if (cls %in% m) {
		t <- as.matrix(table(x, ...))
		colnames(t) <- names
	} else if (cls %in% l) {
		t <- as.list(table(x, ...))
	} else 
	stop("cls must be either 'data.table'/'data.frame'/'dt'/'df', 'matrix'/'mat', or 'list'/'ls'")
	return(t)
}
