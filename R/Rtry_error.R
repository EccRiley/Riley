Rtry_error <- function(fun) {
    tryCatch(
        expr = {
            fun
        },
        error = function(cond) {
            # message(paste("URL could not be parsed\n"))
            return(NA)
        },
        warning = function(cond) {
            # message(paste("Value caused a warning\n"))
        },
        finally = {}
    )
}
