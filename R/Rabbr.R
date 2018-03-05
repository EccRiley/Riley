Rabbr <- function(x, stopwords = c("a", "the", "to", "at", "in", "with", "and", "but", "or", "of", "&"), toupper = TRUE) {
    s0 <- strsplit(as.character(x), " ")[[1]]
    s1 <- s0[!s0 %in% stopwords]
    s2 <- substring(s1, 1, 1)
    s3 <- paste(s2, sep = "", collapse = "")
    s <- ifelse(toupper == TRUE, toupper(s3), s3)
    return(s)
}

#' Examples

# x <- c("Journal of Interpersonal Violence",
         "Violence Against Women",
         "Violence and Victims",
         "Journal of Family Violence")
# sapply(x, Rabbr)
# sapply(x, Rabbr, USE.NAMES = FALSE)

# xlow <- sapply(x, tolower, USE.NAMES = FALSE)
# xlow

# sapply(xlow, Rabbr)
# sapply(xlow, Rabbr, USE.NAMES = FALSE)
