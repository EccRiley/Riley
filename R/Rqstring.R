## SIMPLE UTIL FOR QUERY BUILDING ##
Rqstring <- function(x, field, substring_side = NULL, substring_n = NULL, ...) {
    if (!is.null(substring_n) & substring_side %in% c("LEFT", "RIGHT")) {
        qstring <- paste0("AND ", substring_side, "(LTRIM(RTRIM(", field, ")), ", 
            substring_n, ") IN ('",
            paste0(unique(c(as.character(unique(x)))), collapse = "','"), "')",
            ...)
    } else {
        qstring <- paste0("AND LTRIM(RTRIM(", field, ")) IN ('",
            paste0(unique(c(as.character(unique(x)))), collapse = "','"), "')",
            ...)
    }
    return(qstring)
}

