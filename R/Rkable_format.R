
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

Rkable <- function (x, format = Rkable_format(), 
    fixed_thead_enabled = TRUE, fixed_thead_bg = "#EEEFF1", ..., 
    full_width = FALSE, 
    condensed = TRUE, 
    responsive = TRUE, 
    hover = TRUE,
    latex_options = NULL, 
    protect_latex = TRUE) 
{
    library(knitr)
    library(kableExtra)
    bo <- names(which(
        c("condensed" = condensed, "responsive" = responsive, "hover" = hover)
    ))
    
    kable_styling(kable(x, format = format, ...), full_width = full_width, 
        bootstrap_options = bo, 
        latex_options = latex_options, 
        fixed_thead = list(enabled = fixed_thead_enabled, background = fixed_thead_bg), 
        protect_latex = protect_latex)
}



#' # Examples
#' 
# Rkable(mtcars, condensed = FALSE)
# Rkable(mtcars, hover = TRUE)
