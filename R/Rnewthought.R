#' ## **`R.newthought()`**
#'
#' This is just an alternative implementation of _`tufte::newthought()`_. The original function `{pkg:tufte}`, manipulates the formatting of _both the font and paragraph environment_ for the `text` passed to it. So, when text is passed to `tufte::newthought()`, the `font` is set to "`small-caps`" ("`\textsc`" in \latex), and the verticle line spacing before the `text's` paragraph is set using multiple variables defined in [`tufte-css.css`](https://github.com/edwardtufte/tufte-css), [`tufte-handout.tex`](https://github.com/rstudio/tufte/blob/master/inst/rmarkdown/templates/tufte_handout/resources/tufte-handout.tex), and [`tufte-common.def`](https://github.com/edwardtufte/tufte-latex/blob/master/tufte-common.def) (the template files provided by [the `{tufte}` `R-package``](https://github.com/rstudio/tufte) and [the `{tufte-latex}` package for \latex](https://github.com/edwardtufte/tufte-latex)). This added paragraph spacing causes issues in certain paragraph environments, such lists and tables, thus the alternative implementation below allows the user to use `small-caps` font formatting across with one command that translates across formats (i.e., the same command is used for `HTML` and `PDF` (\latex)  output formats) by only specifying "`small-caps`"-formatting for the `text`, with no additional manipulation(s) to the paragraph environment of the `text` passed to the function.
#'
#' For reference, here the source-code for the original function is below:
#'
#'
#+ origNewthought
# newthought <- function (text) {
#     if (is_html_output()) {
#         sprintf("<span class=\"newthought\">%s</span>", text)
#     }
#     else if (is_latex_output()) {
#         sprintf("\\newthought{%s}", text)
#     }
#     else {
#         sprintf("<span style=\"font-variant:small-caps;\">%s</span>",
#                 text)
#     }
# }
#'
#' ... And now my alternative implementation (including import (`:::`) of two helper functions from `{knitr}` ("`is_html_output`" \& "`is_latex_output`", see [{`pkg:tufte`} source-code on github](https://github.com/rstudio/tufte/blob/master/R/utils.R)):
#'
#+

## Knitr Helpers ##
is_html_output <- function(...) knitr:::is_html_output(...)
is_latex_output <- function(...) knitr:::is_latex_output(...)

## New Newthought! ##

Rnewthought <- function(text) {
    if (is_latex_output()) {
        sprintf("\\textsc{%s}", text)
    }
    else {
        sprintf("<span style=\"font-variant:small-caps;\">%s</span>",
                text)
    }
}
#'
