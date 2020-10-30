
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

Rkable <- function(x, format = Rkable_format(), ...,
    full_width = FALSE,
    bootstrap_options = c("condensed", "responsive"),
    latex_options = NULL,
    fixed_thead = list(enabled = T/F,
        background = pal_dl2[["bluegraylitest"]]),
    protect_latex = TRUE) {
    library(knitr); library(kableExtra)
    kable_styling(kable(x, format = format, ...),
        full_width = full_width,
        bootstrap_options = bootstrap_options,
        latex_options = latex_options,
        fixed_thead = fixed_thead,
        protect_latex = protect_latex)
}

#' # Examples
#' 
# Rkable(mtcars, kable_styling_args = alist(bootstrap_options = "striped"))
