Rpostread <- function(x) {
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
        as.data.table() %>%
        unique() %>%
        setnames(., names(.), tolower(names(.)))
    return(y)
}
