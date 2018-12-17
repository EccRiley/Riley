tail.chr <- function(x, n = 1000){
    substr(x, nchar(x) - n + 1, nchar(x))
}
