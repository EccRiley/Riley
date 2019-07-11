## CONVENIENCE FUNCTION ##

Ryearmo <- function(x) {
    library(data.table)
    return(as.integer(paste0(year(x), month(x))))
}
