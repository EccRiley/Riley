Rkable_footnote_marker <- function(x, marker_type = "number", 
    format = Rkable_format(), double_escape = FALSE) {
    library(knitr);library(kableExtra)
    marker_fun <- switch(marker_type, 
        number = footnote_marker_number
        ,alphabet = footnote_marker_alphabet
        ,symbol = footnote_marker_symbol
    )
    return(marker_fun(x, format = format, double_escape = double_escape))
}
