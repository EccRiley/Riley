Rkpand <- function(x, o = "kable", align = rep('l', ncol(x)+1), row.names = TRUE, caption = NULL, ...) {
    require(pander); require(car); require(knitr)
    jrec <- c("'l' = 'left'; 'r' = 'right'; 'c' = 'centre'")
    if (o == "pander") {
        if (!is.null(align) && nchar(align) == 1) {
            justify <- car::recode(align, jrec)
        } else {
            justify <- align
        }
        if (is.null(rownames(x))) {
            justify <- justify[-1]
        }
        out <- pander::pander(x, justify = justify, caption = caption, ...)
    } else {
        if (!is.null(align) && nchar(align) > 1) {
            align <- substring(align, 1, 1)
        }
        if (!row.names | is.null(rownames(x))) {
            align <- align[-1]
        }
        out <- knitr::kable(x, align = align, caption = caption, row.names = row.names, ...)
    }
    return(out)
}
