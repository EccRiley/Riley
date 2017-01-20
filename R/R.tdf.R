#'
#' ## **`R.tdf()`**
#'
#' This is a simple convenience wrapper function to print or store `table`-class objects as `dataframes`.
#'
R.tdf <- function(x) {
	as.data.frame(table(x))
}