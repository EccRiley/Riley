## [ORIGINAL INSPIRATION FOR THIS FUNCTION](https://stackoverflow.com/a/25962138/9101370) ##
Ralternate <- function(x, y) {
    z <- vector(mode = class(x), length = length(c(x, y)))
    xi <- 1:length(x)
    yi <- 1:length(y)
    if (length(x) %% 2 == 0) {
    xi <- ifelse(xi %% 2 != 0, TRUE, FALSE) ## START 'X1' WITH TRUE
    yi <- ifelse(yi %% 2 != 0, TRUE, FALSE) ## START 'YI' WITH ALTERNATE VALUE TO END OF 'XI' ##
    } else {
        xi <- ifelse(xi %% 2 != 0, TRUE, FALSE) ## START 'X1' WITH TRUE
        yi <- ifelse(yi %% 2 != 0, FALSE, TRUE) ## START 'YI' WITH ALTERNATE VALUE TO END OF 'XI' ##
    }
    z[which(c(xi, yi))] <- x ## PRODUCES WARNING BC X & Y ARE DIFFERENT LENGTHS ##
    z[which(!c(xi, yi))] <- y
    return(z)
}
