#' ## **`Rna()`**
#'
Rna <-
    function(x) {
        ## SURELY THIS ALREADY EXISTS SOMEWHERE, RIGHT??? ###
        x <- ifelse(is.na(x), 0, x)
        return(x)
    }
