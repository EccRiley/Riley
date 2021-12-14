Rtdfm <- function(..., row.vars = NULL, col.vars = NULL,
    useNA = "no", exclude = if (useNA == "no") c(NA, NaN)) {
    library(magrittr); library(data.table)
    ft <- as.matrix(ftable(...,
        exclude = exclude, row.vars = row.vars, col.vars = col.vars))
    rlbl <- names(dimnames(ft))[[1]]
    res <- data.table(rlbl = rownames(ft), ft)
    setnames(res, c("rlbl"), c(rlbl))
    return(res)
}

