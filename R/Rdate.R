#' ## **`R.date()`**
#'
#' **`R.date:`** Function to format dates as "numeric day Month Year" ("`%d %b %Y`")
#'
#'
Rdate <- function(x, fmt = "%d %B %Y", ...) {
    format(as.Date(x), fmt)
}

