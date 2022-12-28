## STUPID UTILITY BC I'M LAZY ##

Rcomma_usd <- function(x, prefix = "$", accuracy = 1.0, ...) {
    library(scales)
    res <- comma(x = x, prefix = prefix, accuracy = accuracy, ...)
    return(res)
}
