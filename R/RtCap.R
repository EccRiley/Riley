RtCap <- function(x) {
    s0 <- strsplit(x, " ")[[1]]
    nocap <- c("a", "the", "to", "at", "in", "with", "and", "but", "or", "of")
    s1 <- ifelse(!s0 %in% nocap, toupper(substring(s0, 1,1)), s0)
    # s2 <- toupper(substring(s[!s %in% nocap], 1,1))
    s2 <- ifelse(!s0 %in% nocap, substring(s0, 2), "")
    s <- paste(s1, s2, sep="", collapse=" ")
    return(s)
}
