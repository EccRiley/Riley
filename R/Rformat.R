## UTILITARIAN CONVENIENCE FUNCTION - WILL NOT BE INCLUDED IN PUBLISHED PACKAGE(s) ##

Rformat <- function(x, digits = 2, nsmall = 2, big.mark = ",", zero.print = "-", na.encode = TRUE, scientific = getOption("scipen"), ...)
{
    format(x, digits = digits, nsmall = nsmall, big.mark = big.mark, zero.print = zero.print, na.encode = na.encode, scientific = scientific, ...)
}
