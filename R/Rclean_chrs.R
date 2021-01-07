Rclean_chrs <- function(x) {
    if (!require(magrittr)) stop("magrittr package not required but is not installed");
    if (!require(purrr)) stop("purrr package not required but is not installed");
    if (!require(stringr)) stop("stringr package not required but is not installed");

    y <- x %>%
        purrr::map_if(is.character, function(x) {
            ## REPLACE ANY NON UTF-8 CHRs W/ '' ##
            Encoding(x) <- "UTF-8"
            return(iconv(x, "UTF-8", "UTF-8", sub = ''))
        }) %>%
        purrr::map_if(is.character, stringr::str_trim) %>%
        purrr::map_if(is.character,
            function(x) ifelse(x == "", NA_character_, x)) %>%
        as.data.table()
    return(y)
}
