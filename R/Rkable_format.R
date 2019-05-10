
Rkable_format <- function(interactive_format = "html") {
    if (is_html_output()) {
        res <- "html"
    } else if (is_latex_output()) {
        res <- "latex"
    } else if (interactive()) {
        res <- interactive_format
    } else {
        res <- getOption("knitr.table.format")
    }
    return(res)
}

Rkable <- function(..., format = Rkable_format(), kable_styling_args = NULL) {
    require(knitr); require(kableExtra)
    if (format == "html") {
        kable(..., format = format) %>% kable_styling(unlist(kable_styling_args))
    }
}

#' # Examples
#' 
# Rkable(mtcars, kable_styling_args = alist(bootstrap_options = "striped"))
