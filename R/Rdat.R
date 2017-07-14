#'
#' # **`Rdat()`**
#'
#' I'm lazy, so that's what this is ... A simple wrapper for `write.table()` (et al) `{Rpkg:utils}`, with the default for the "`row.names`" arg set to "`FALSE`", instead of the original FUN's default value of "`TRUE`", and for the "`sep`" arg set to "," (because I'm almost always saving tables as `.csv` files), rather than the original FUN's default value of `" ". Also added option to save as a `matrix` using `write.matrix()` from package **`MASS`**.
#'
#+ FUN_Rdat
Rdat <- function(x, file, row.names = FALSE, sep = ",", mat = FALSE, blocksize = NULL, ...) {
	if(mat) {
		MASS::write.matrix(x, file = file, blocksize = blocksize, ...)
	}
	else {
		write.table(x, file = file, row.names = row.names, sep = sep, ...)
		}
}
#'
