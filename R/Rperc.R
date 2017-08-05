#' ## **`Rperc()`**
#'
Rperc <- function(x, n = getOption("Rperc_n"), digits = getOption("digits")) {
    if (is.null(n)) { stop("argument \"n\" is missing, with no default") }
    p <- (x / n)*100
    d <- sub("^.+[.]", "", p)
    res <- round(p, digits = digits)
    if (knitr:::is_latex_output()) {
        apprx <- if (digits < nchar(d)) "\\approx " else ""
        paste0("\\", apprx, scales::comma(res), "\\%")
    } else {
        if (knitr:::is_html_output()) {
            apprx <- if (digits < nchar(d)) "&asymp; " else ""
            paste0(apprx, scales::comma(res), "%")
        } else {
            apprx <- if (digits < nchar(d)) "~ " else ""
            paste0(apprx, scales::comma(res), "%")
        }
    }
}
