Rrdcsv <- function(x, ext = "csv", namecase = "lower", asDT = FALSE, ...) {
    if (ext == "feather") {
        y <- feather::read_feather(x, ...)
    } else {
        if (ext == "xlsx") {
            y <- readxl::read_xlsx(x, ...)
        } else {
            if (ext == "csv") {
                y <- read.csv(x, ...)
            } else {
                y <- read.table(x, ...)
            }
        }
    }
    if (namecase == "lower") {
        names(y) <- tolower(names(y))
    } else if (namescase == "upper") {
        names(y) <- toupper(names(y))
    }
    if (asDT) {
        return(data.table::as.data.table(y))
    } else {
        return(y)
    }
}
