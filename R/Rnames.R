#' ## **`R.names()`**
#'
#' Function for appending ("`pl='A'`") or prepending ("`pl='P'`") character string to matrix dimnames (defaults to colnames by "`dim=2`" for rownames, set "`dim=1`")
#'
Rnames <- function(x,
                    dim = 2,
                    str,
                    pl = "A",
                    sep = "_") {
    if (dim == 2)
        if (pl == "A")
            colnames(x) <- paste(str, colnames(x), sep = sep)
        else if (pl == "P")
            colnames(x) <- paste(colnames(x), str, sep = sep)
        else if (dim == 1)
            if (pl == "A")
                colnames(x) <- paste(str, colnames(x), sep = sep)
            else if (pl == "P")
                rownames(x) <- paste(rownames(x), str, sep = sep)
            else
                stop('pl must be either "A" or "P"')
            else
                stop('dim must be either "1" or "2"')
            return(x)
}
#'
