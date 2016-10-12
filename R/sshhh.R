#' ## **`sshhh()`**
#' 
#' Suppress package warnings `r tufte::margin_note("\\rhref{https://www.r-bloggers.com/fun-with-rprofile-and-customizing-r-startup/}{Original Source}")`
#'
sshhh <-
    function(a.package) {
        suppressWarnings(
            suppressPackageStartupMessages(
                library(
                    a.package, character.only = TRUE)))
    }