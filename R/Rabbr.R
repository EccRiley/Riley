Rabbr <- function(x) {
    s0 <- strsplit(x, " ")[[1]]
    ex <- c("a", "the", "to", "at", "in", "with", "and", "but", "or", "of", "&")
    s1 <- s0[!s0 %in% ex]
    s2 <- substring(s1, 1,1)
    s <- paste(s2, sep = "", collapse = "")
    s <- toupper(s)
    return(s)
}
