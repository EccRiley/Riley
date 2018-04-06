RisBinary <- function(x) {
    ifelse(base::setequal(unique(na.omit(x)), c(0, 1)),
           TRUE, FALSE)
}
