#' ## **`Rsearch()`**
#'
Rsearch <- function() {
    s <- search()
    s <- gsub("package:", "", s)
    return(s)
}
#'
