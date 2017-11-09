Rrdcsv <- function(x, namecase = "lower", ...) {
    y <- read.csv(x, ...)
    if (namecase == "lower") {
        names(y) <- tolower(names(y))
    } else if (namescase == "upper") {
        names(y) <- toupper(names(y))
    }
    return(y)
}
