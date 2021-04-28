## CONVENIENCE FUNCTION ##

Ryearmo <- function(x, return_integer = TRUE, sep = "", ...) {
    library(data.table)
    y0 <- format(x, paste0("%Y", sep, "%m"), ...)
    if (sep == "" & return_integer == TRUE) {
        y <- as.integer(y0)
    } else {
        y <- y0
    }
    return(y)
}

# Ryearmo(today())
# Ryearmo(today(), sep = "-")
