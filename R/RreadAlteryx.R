RreadAlteryx <- function(input_id = "#1", inmode = "data.frame",
    outmode = "data.table", trimchr = TRUE) {
    library(AlteryxRDataX)
    library(data.table)

    dat0 <- read.Alteryx(input_id, mode = inmode)

    names(dat0) <- tolower(names(dat0))

    setDT(dat0)
    str(dat0)

    vars_chr <- c(names(which(sapply(dat0, is.factor))))
    dat01[, (vars_chr) := lapply(.SD, as.character), .SDcols = c(vars_chr)]

    str(dat01[, .SD, .SDcols = c(vars_chr)])
    str(dat0[, .SD, .SDcols = c(vars_chr)])

    if (trimchars == TRUE) {
        dat01[, (vars_chr) := lapply(.SD, stringr::str_trim), .SDcols = c(vars_chr)]
        dat01[, (vars_chr) := lapply(.SD, function(x) ifelse(x == "", NA, as.character(x))),
            .SDcols = c(vars_chr)]
    }
    return(dat0)
}

