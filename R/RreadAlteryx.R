RreadAlteryx <- function(input_id = "#1", inmode = "data.frame") {
    library(AlteryxRDataX)
    library(data.table)

    dat0 <- read.Alteryx(input_id, mode = inmode)

    names(dat0) <- tolower(names(dat0))

    setDT(dat0)
    str(dat0)

    vars_chr <- c(names(which(sapply(dat0, is.factor))))
    vars_chr
    str(dat0[, .SD, .SDcols = vars_chr])

    dat0[, (vars_chr) := lapply(.SD, as.character), .SDcols = c(vars_chr)]
    dat0[, (vars_chr) := lapply(.SD, stringr::str_trim), .SDcols = c(vars_chr)]
    dat0[, (vars_chr) := lapply(.SD, function(x) ifelse(x == "", NA, as.character(x))),
        .SDcols = c(vars_chr)]

    return(dat0)
}

RreadAlteryx2 <- function(dat) {
    library(data.table)
    dat0 <- as.data.table(dat)
    str(dat0)

    vars_chr <- c(names(which(sapply(dat0, is.factor))))
    vars_chr
    str(dat0[, .SD, .SDcols = vars_chr])

    dat0[, (vars_chr) := lapply(.SD, as.character), .SDcols = c(vars_chr)]
    dat0[, (vars_chr) := lapply(.SD, stringr::str_trim), .SDcols = c(vars_chr)]
    dat0[, (vars_chr) := lapply(.SD, function(x) ifelse(x == "", NA, as.character(x))),
        .SDcols = c(vars_chr)]
    str(dat0)

    return(dat0)
}
