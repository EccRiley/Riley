
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


## RFMT.ABBR() ABBREVIATES LARGE NUMBERS ##
## BASED ON https://gist.github.com/RadGH/84edff0cc81e6326029c#gistcomment-2095834 ##

## BASED ON https://gist.github.com/RadGH/84edff0cc81e6326029c#gistcomment-2095834 ##
Rfmt.abbr <- function(n) {
    ifelse(n < 1000, 
           floor(n),
           ifelse (n >= 1000 & n < 1000000, 
                   paste0(floor(n / 1000), "K+"),
                   ifelse (n >= 1000000 & n < 1000000000, 
                           paste0(floor(n / 1000000), "M+"),
                           ifelse (n >= 1000000000 & n < 1000000000000, 
                                   paste0(floor(n / 1000000000), "B+"),
                                   ifelse(n >= 1000000000000, 
                                          paste0(floor(n / 1000000000000), "T+"),
                                          NA
                                   )))))
}

