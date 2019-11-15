Rnumwrd <- function(x, cap = FALSE) {
    numWords <- c("one", "two", "three", "four", "five", "six", "seven", "eight", "nine")
    if (cap == TRUE) {
        numWords <- sapply(numWords, RtCap, USE.NAMES = FALSE)
    }
    if (x > length(numWords) || (x %% 1) != 0) { stop("'x' is not a single-digit whole number") }
    res <- numWords[x]
    return(res)
}
