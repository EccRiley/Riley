## SIMPLE UTIL FOR QUERY BUILDING ##
Rqstring <- function(x, field, ...) {
    qstring <- paste0("AND LTRIM(RTRIM(", field, ")) IN ('",
        paste0(unique(c(as.character(unique(x)))), collapse = "','"), "')",
        ...)
    return(qstring)
}
