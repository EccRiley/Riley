## laziness-inspired wrapper for presenting percentages appropriately, without having to change the numeric class of the data itself (unless you want to, i suppose) ##

Ras.percent <- function(x, compute = FALSE, smbl = "\\%") {
    if (compute) {
        y <- x*100
        res <- paste0(y, smbl)
    } else
        res <- paste0(x, smbl)
    return(res)
}
