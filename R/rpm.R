#' ## [**`rpm()`**][^rpm] (Replace Print Methods)
#'
#' The below function essentially wraps `pander::pander()` around all default print methods (thanks to [this source][^rpm] for the original `'replace.print.methods()'` function defintion code)
#'
#' Here's the breakdown of the steps taken in the `'rpm()'` function below:
#'
#' 1. Get a character list (`'as.character()'`) of available generic, S3, and S4 usage methods (`'methods()'`) for the function `'pander()'`.
#' 2. Substitute (`'gsub()'`) the pattern "pander" (`'PKG'`) with "`print`" in the character list created above (`'PKG_methods'`).
#' 3. For each item (`'i'`) in the character list created and manipulated in the last two steps (`'seq_along(PKG_methods)'`), assign the new function `'f()'` (`'eval(parse(text = paste(PKG,":::", PKG_methods[i], sep = "")))'`) to use for print to each print_method in `'PKG_methods'`.
#'
#' [^rpm]: \rurl{http://www.r-statistics.com/2013/03/write-ms-word-document-using-r-with-as-little-overhead-as-possible/}
#'
#'
library(pander)
rpm <-
    function(PKG = "pander") {
        ## Replace print methods with pander printing methods ##
        PKG_methods <- as.character(methods(PKG))
        print_methods <- gsub(PKG, "print", PKG_methods)
        for (i in seq_along(PKG_methods)) {
            f <- eval(parse(text = paste(PKG, ":::", PKG_methods[i], sep = "")))
            assign(print_methods[i], f, ".GlobalEnv")
        }
    }
