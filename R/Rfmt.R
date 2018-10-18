
Rfmt <- function(x, digits = 2, nsmall = digits, scientific = FALSE, big.mark = ",", ...) {
    if (!is.numeric(x) | !is.integer(x) | !is.double(x)) {
        warning("Coercing non-numeric input (x) to numeric")
    }
    res <- format(round(as.numeric(x), digits = digits), ...,
                  big.mark = big.mark,
                  scientific = scientific,
                  nsmall = digits)
    res <- ifelse(is.na(as.numeric(x)), NA, res)
    return(res)
}

Rfmt.currency <- function(x, currency_symbol = "$", digits = 2, nsmall = digits,
                          scientific = FALSE, big.mark = ",", ...) {
    y <- paste0(currency_symbol,
                Rfmt(x, digits = digits, ...,
                     big.mark = big.mark,
                     scientific = scientific,
                     nsmall = digits))
    y <- ifelse(is.na(as.numeric(x)), NA, y)
    return(y)
}

