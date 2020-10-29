Rndigits <- function(x, nums_only = TRUE) {
    suppressWarnings(
        if (nums_only) {
            y <- ifelse(
                is.na(as.numeric(x)) | (!is.na(as.numeric(x)) & !grepl("\\.", x)), 0,
                nchar(sub("^.+[.]","", sub("0+$","", as.character(x))))
            )
        } else {
            y <- ifelse(
                is.na(as.numeric(x)) | (is.na(as.numeric(x)) & !grepl("\\.", x)),
                nchar(x),
                nchar(sub("^.+[.]","", sub("0+$","", as.character(x))))
            )
        }
    )
    return(y)
}
