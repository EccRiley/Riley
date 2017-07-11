#'
#' \name{Rdat}
#'
#' \title{I'm lazy, so that's what this is...}
#'
#' \description{A simple wrapper for `write.table()` (et al) `{Rpkg:utils}`, with the default for the "`row.names`" arg set to "`FALSE`", instead of the original FUN's default value of "`TRUE`", and for the "`sep`" arg set to "," (because I'm almost always saving tables as `.csv` files), rather than the original FUN's default value of `" ". Also added option to save as a `matrix` using `write.matrix()` from package **`MASS`**}.
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
#' \usage{Rdat(x, file, row.names = FALSE, sep = ",", mat = FALSE, blocksize, ...)}
#'
#' \arguments{
#'	\item{x}{Tabular data to be written to \code{file}.}
#'	
#' \item{{file}}{Path to file to be written.}
#' 
#' \item{{row.names = FALSE}}{Logical (\code{FALSE}); whether to include a column of rownames in the written file.}
#' 
#' \item{{sep}}{Character (\code{","}); the field seperator value. }
#' 
#' \item{mat = FALSE}{Logical (\code{{FALSE}); Whether to write the data as a matrix using the \code{\link[MASS]{write.matrix}} in package \bold{\code{\link[=https://cran.r-project.org/package=MASS]{MASS}}}.}
#' 
#' \item{blocksize}{Numeric; optional size of row blocks (ignored if \code{mat = FALSE}; see \code{\link[MASS]{write.matrix}} in package \bold{\code{\link[=https://cran.r-project.org/package=MASS]{MASS}}}.}
#' 
#' \item{...}{Additional arguments to be passed to \code{\link[utils]{write.table}} in package \bold{\code{\link[=https://cran.r-project.org/package=R.utils]{utils}}}.}
#'
#' \value{NULL}
#' 
#' \author{Rachel M. Smith}
#'
#' \seealso{\code{\link[MASS]{write.matrix}} in package \bold{\code{\link[=https://cran.r-project.org/package=MASS]{MASS}}, and \code{\link[utils]{write.table}} in package \bold{\code{\link[=https://cran.r-project.org/package=R.utils]{utils}}}.}