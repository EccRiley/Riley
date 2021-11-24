Rkable <- function (x, ..., format = Rkable_format(), 
    fixed_thead_enabled = TRUE, fixed_thead_bg = "#EEEFF1", 
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
    
    kable_styling(kbl(x, format = format, ...), full_width = full_width, 
        bootstrap_options = bo, 
        latex_options = latex_options, 
        fixed_thead = list(enabled = fixed_thead_enabled, background = fixed_thead_bg), 
        protect_latex = protect_latex)
}
