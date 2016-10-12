#' ## **`Rsedit()`** (function for my laziness)
#'
#'
Rsedit <- function(x) {
    ## open and source a file ##
    file.edit(x)
    source(x)
}
