## CONVENIENCE FUNCTION ##

Ryearmo <- function(x) {
    library(data.table)
    return(as.integer(format(x, "%Y%m")))
}
