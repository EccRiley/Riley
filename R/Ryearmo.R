## CONVENIENCE FUNCTION ##

Ryearmo <- function(x) {
    library(data.table)
    return(as.integer(paste0(year(esn_limiter), month(esn_limiter))))
}
