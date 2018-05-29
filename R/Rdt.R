#' ## **`Rdt()`**
#'
#' `DT::datatable()` with my usual settings.^[Thanks to `Stack-Overflow` user [\textbf{\color{dkblue}{Sven Hohenstein}}](http://stackoverflow.com/questions/14577412/how-to-convert-variable-object-name-into-string) for providing the function deparse(substitute(x)) idea to convert an Robject's name to string. Notes: `deparse()` = "Turn unevaluated expressions into character strings"; `substitute()` = "return the parse tree for the unevaluated expression, substituting any variables bound in env."]
#'
Rdt <-
    function(x,
             caption = deparse(substitute(x)),
             rownames = FALSE,
             class = c("display"),
             filter = 'none',
             extensions = 'KeyTable',
             selection = list(target = 'row'),
             columnDefs = NULL, #EXAMPLE: columnDefs = list(list(className = 'dt-center', targets = 0:4)
             options = list(
                 pageLength = 300,
                 lengthMenu = c(200, 500, 1000, 1500),
                 info = TRUE,
                 keys = 'true',
                 columnDefs = columnDefs,
                 dom = 'tip',
                 initComplete = DT::JS(
                     "function(settings, json) {",
                     "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff', 'font-family': 'serif'});",
                     "}")
             ),
             ...) {
        cap <-
            htmltools::tags$caption(style = 'caption-side: top; text-align: left; font-size: 1.5em;',
                                    htmltools::strong(htmltools::em(paste(caption))))
        DT::datatable(
            x,
            rownames = rownames,
            caption = cap,
            filter = filter,
            class = class,
            options = options,
            extensions = extensions,
            ...
        )
    }
#'


Rdt2 <- function(x, rownames = FALSE, colnames = NA, caption = deparse(substitute(x)), 
                 dt.options = NULL, kbl.format.args = NULL, kbl.align = NA, ...) {
    if (knitr:::is_html_output() || interactive()) {
        if (!is.null(dt.options)) {
            Rdt(x, rownames = rownames, colnames = colnames, caption = caption, 
                options = dt.options, ...)
        } else {
            Rdt(x, rownames = rownames, colnames = colnames, caption = caption, ...)
        }
        
    } else { 
        if (!is.null(kbl.format.args)) {
            kable(x, row.names = rownames, caption = caption, 
              col.names = colnames, align = kbl.align,
              format.args = kbl.format.args, ...)
        } else {
            kable(x, row.names = rownames, caption = caption, 
              col.names = colnames, align = kbl.align, ...)
        }
    }
}
