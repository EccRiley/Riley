R.tdef <- function(x, def, ...) { ## "x" = a vector of terms, "def" = a vector of definitions corresponding to the terms in "x" ##
    y <- paste0("\\tdef{", x, "}{", def, "}")
    return(as.data.frame(y))
}
