#' ## **`RpercTeX()`**
#'
Rperc <- function(x, n = 14) {
    if (length(x) == 0)
        return(character())
    y <- round(x / n, digits = getOption("digits"))
    paste0(comma(y * 100), "%")
}

RpercTeX <- function(x, n = 14) {
    if (length(x) == 0)
        return(character())
    y <- round(x / n, digits = getOption("digits"))
    paste0(comma(y * 100), "\\%")
}
