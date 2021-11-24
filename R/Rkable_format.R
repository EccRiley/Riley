
Rkable_format <- function(interactive_format = "html") {
    if (is_latex_output()) {
        res <- "latex"
    } else if (is_html_output()) {
        res <- "html"
    } else if (interactive() & !is_latex_output()) {
        res <- interactive_format
    } else {
        res <- getOption("knitr.table.format")
    }
    return(res)
}

#' # Examples
#' 
# Rkable(mtcars, condensed = FALSE)
# Rkable(mtcars, hover = TRUE)
