#' ## **`Rperc()`**
#'
Rperc <- function(x, n = 14, tex = FALSE) {
    if (length(x) == 0)
        return(character())
    y <- round(x / n, digits = getOption("digits"))
    if (tex) {
    	paste0(comma(y * 100), "\\%")
    } else {
    	paste0(comma(y * 100), "%")
    }
}
