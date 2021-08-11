Rpostread <- function(x, lower_names = TRUE) {
    library(magrittr); library(purrr); library(data.table)
    
    y <- x %>%
        purrr::map_if(is.character, function(x) {
            ## REPLACE ANY NON UTF-8 CHRs W/ '' ##
            Encoding(x) <- "UTF-8"
            return(iconv(x, "UTF-8", "UTF-8", sub = ''))
        }) %>%
        purrr::map_if(is.character, stringr::str_trim) %>%
        purrr::map_if(is.character,
            function(x) ifelse(
                x %in% c(getOption("datatable.na.strings"), ""), 
                NA_character_, x)) %>%
        as.data.frame() %>%
        unique()
    setDT(y)
    if (lower_names == TRUE) {
        setnames(y, names(y), tolower(names(y)))
    }
    return(y)
}
