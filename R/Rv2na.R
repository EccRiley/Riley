Rv2na <- function(x, v = 0, alt_replacement = NULL) {
    y <- x
    if (is.null(alt_replacement)) {
        res <- ifelse(is.character(y) & y == v, NA_character_, 
            ifelse(!is.character(y) & y == v, NA, y))
    } else {
        res <- ifelse(y == v, alt_replacement, y)
    }
    
    return(res)
}
