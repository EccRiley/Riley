## SIMPLE UTIL FOR QUERY BUILDING ##
Rqstring <- function(x, field, substring_side = NULL, substring_n = NULL, operand = "AND", ...) {
    if (!is.null(substring_n) & !is.null(substring_side)) {
        qstring <- paste0(" ", operand, " ", substring_side, "(LTRIM(RTRIM(", field, ")), ", 
            substring_n, ") IN ('",
            paste0(unique(c(as.character(unique(x)))), collapse = "','"), "')",
            ...)
    } else {
        qstring <- paste0(" ", operand, " LTRIM(RTRIM(", field, ")) IN ('",
            paste0(unique(c(as.character(unique(x)))), collapse = "','"), "')",
            ...)
    }
    return(qstring)
}

