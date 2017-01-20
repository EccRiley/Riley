#' ## **`Rrrefs()`**
#'
#' Wrapper function to create list of packages using the 'R.cite_r()` function above (which is a modified version of `papaja::cite_r()`).
#'
Rrrefs <-
    function(bib_main = "REFs.bib",
             bib_r = "rrefs.bib",
             perl = TRUE) {
        r_refs(file = bib_main, append = TRUE)
        r_refs(file = bib_r, append = FALSE)
        rrefs <- R.cite_r(file = bib_r)
        rrefs <-
            gsub(" and the R-packages", ";", rrefs, perl = perl)
        rrefs <- gsub("\\], and", "\\];", rrefs, perl = perl)
        rrefs <- gsub("\\],", "\\];", rrefs, perl = perl)
        rrefs <- strsplit(rrefs, "; ", perl = perl)
        rrefs <- data.frame(rrefs)
        names(rrefs) <- "R-References"
        return(kable(rrefs, col.names = ""))
    }
#'
