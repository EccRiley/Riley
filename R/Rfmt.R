
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
Rfmt.abbr <- function(n) {
    if (n > 0 & n < 1000) {
        ## 1 - 999 ##
        n_format = floor(n);
        suffix = '';
    } else if (n >= 1000 & n < 1000000) {
        ## 1k-999k ##
        n_format = floor(n / 1000);
        suffix = 'K+';
    } else if (n >= 1000000 & n < 1000000000) {
        ## 1m-999m ##
        n_format = floor(n / 1000000);
        suffix = 'M+';
    } else if (n >= 1000000000 & n < 1000000000000) {
        ## 1b-999b ##
        n_format = floor(n / 1000000000);
        suffix = 'B+';
    } else if (n >= 1000000000000) {
        ## 1t+ ##
        n_format = floor(n / 1000000000000);
        suffix = 'T+';
    }
    
    res <- paste0(n_format, suffix)
    return(res)
}
