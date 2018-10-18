
Rfmt_currency <- function(x, currency_symbol = "$", digits = 2, ...) {
    y <- paste0(currency_symbol,
                format(round(x, digits = digits), ...,
                       big.mark = ",",
                       scientific = FALSE,
                       nsmall = digits))
    return(y)
}
