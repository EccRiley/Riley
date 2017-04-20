Rabbr <- function(x) {
    s0 <- strsplit(x, " ")[[1]]
    ex <- c("a", "the", "to", "at", "in", "with", "and", "but", "or", "of", "&")
    s1 <- s0[!s0 %in% ex]
    s2 <- substring(s1, 1,1)
    s <- paste(s2, sep = "", collapse = "")
    s <- toupper(s)
    return(s)
}

#' Examples

x <- c("Journal of Interpersonal Violence",
         "Violence Against Women",
         "Violence and Victims",
         "Journal of Family Violence")
sapply(x, Rabbr)
sapply(x, Rabbr, USE.NAMES = FALSE)

xlow <- sapply(x, tolower, USE.NAMES = FALSE)
xlow

sapply(xlow, Rabbr)
sapply(xlow, Rabbr, USE.NAMES = FALSE)
