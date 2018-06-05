#' ## **`Rdt()` & `Rdt2()`**
#'
#' **`Rdt()`**: DT::datatable()` with my usual settings.^[Thanks to `Stack-Overflow` user [\textbf{\color{dkblue}{Sven Hohenstein}}](http://stackoverflow.com/questions/14577412/how-to-convert-variable-object-name-into-string) for providing the function deparse(substitute(x)) idea to convert an Robject's name to string. Notes: `deparse()` = "Turn unevaluated expressions into character strings"; `substitute()` = "return the parse tree for the unevaluated expression, substituting any variables bound in env."]
#'
Rdt <-
    function(x,
             caption = deparse(substitute(x)),
             rownames = FALSE,
             class = c("display"),
             height = 300,
             filter = "top",
             extensions = "KeyTable",
             selection = list(target = "row"),
             opts.columnDefs = NULL, 
             opts.pageLength = 10,
             opts.lengthMenu = c(10, 25, 50, 100, 200, 500, 1000, 1500),
             opts.info = TRUE,
             opts.keys = "true",
             opts.dom = "tip", 
             opts.initComplete = DT::JS(
                 "function(settings, json) {",
                 "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff', 'font-family': 'consolas'});",
                 "}"),
             opts.other = list(), 
             ...) {
        
        cap <- htmltools::tags$caption(style = 'caption-side: top; text-align: left; font-size: 1.25em;',
                                       htmltools::strong(htmltools::em(paste(caption)))
        )
        
        opts <- as.list(c(
            pageLength = opts.pageLength,
            lengthMenu = opts.lengthMenu,
            info = opts.info,
            keys = opts.keys,
            columnDefs = opts.columnDefs,
            dom = opts.dom,
            initComplete = opts.initComplete, 
            unlist(opts.other))
        )
        
        DT::datatable(
            x,
            rownames = rownames,
            caption = cap,
            height = height,
            filter = filter,
            class = class,
            options = opts,
            extensions = extensions,
            ...
        )
    }
#'
#' 
#' 
#' **`Rdt2()`**: (mostly a convenience function) Conditionally implement `Rdt()` (i.e., `HTML datatable` output) or knitr::kable(format = 'pandoc') depending on session mode (interactive vs. batch) and, when running `rmarkdown::render()`, the rendered document output format (i.e., `HTML` output formats will trigger implmentation of `Rdt()`, wherease non-`HTML` otuput formats will trigger `knitr::kable(...)` to be implemented).
#' 
Rdt2 <- function(x,
                 ## ARGS FOR EITHER Rdt() & kable() OUTPUTS ##
                 cnames = colnames(x), rnames = FALSE, escape = TRUE, caption = deparse(substitute(x)),
                 
                 ## ARGS SPECIFIC TO kable() OUTPUT ##
                 format = getOption("knitr.table.format"), 
                 zero.print = ".", 
                 digits = 2, 
                 nsmall = 2,
                 kable.other.f.args = list(),
                 align = NULL, 
                 table.attr = NULL,
                 
                 ## ARGS FOR Rdt() OUTPUT ##
                 height = 300,
                 filter = "top",
                 extensions = "KeyTable",
                 selection = list(target = "row"),
                 opts.columnDefs = NULL, 
                 opts.pageLength = 10,
                 opts.lengthMenu = c(10, 25, 50, 100, 200, 500, 1000, 1500),
                 opts.info = TRUE,
                 opts.keys = "true",
                 opts.dom = "tip", 
                 opts.initComplete = DT::JS(
                     "function(settings, json) {",
                     "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff', 'font-family': 'consolas'});",
                     "}"), 
                 opts.other = list(), 
                 ...) { ## '...' CURRENTLY ONLY IMPLEMENTED AS ADDL ARGS PASSED TO Rdt() TO AVOID POTENTIAL 'UNUSED ARGUMENT' ERRORS WITH 'knitr::kable()' ##
    
    format.args <- as.list(c(zero.print = zero.print,
                                   digits = digits,
                                   nsmall = nsmall,
                                   unlist(kable.other.f.args)))
    if (knitr:::is_html_output()) {
        Rdt(x, colnames = cnames, rownames = rnames, escape = escape, caption = caption,
            height = height,
            filter = filter,
            extensions = extensions,
            selection = selection,
            opts.columnDefs = opts.columnDefs,
            opts.pageLength = opts.pageLength,
            opts.lengthMenu = opts.lengthMenu,
            opts.info = opts.info,
            opts.keys = opts.keys,
            opts.dom = opts.dom,
            opts.initComplete = opts.initComplete,
            opts.other,
            ...)
    } else
        knitr::kable(x, col.names = cnames, row.names = rnames, escape = escape, caption = caption,
                     format = format,
                     format.args = format.args,
                     align = align, 
                     table.attr = table.attr)
}


# CODEDUMP (Rdt() & Rdt2()) -----------------------------------------------
# EXAMPLE COLUMNDEFS: columnDefs = list(list(className = "dt-center", targets = 0:4)
# Rdt2 <- function(x, rownames = FALSE, colnames = NA, caption = deparse(substitute(x)), 
#                  dt.options = NULL, kbl.format.args = NULL, kbl.align = NA, ...) {
#     if (knitr:::is_html_output() || interactive()) {
#         if (!is.null(dt.options)) {
#             Rdt(x, rownames = rownames, colnames = colnames, caption = caption, 
#                 options = dt.options, ...)
#         } else {
#             Rdt(x, rownames = rownames, colnames = colnames, caption = caption, ...)
#         }
#         
#     } else { 
#         if (!is.null(kbl.format.args)) {
#             kable(x, row.names = rownames, caption = caption, 
#               col.names = colnames, align = kbl.align,
#               format.args = kbl.format.args, ...)
#         } else {
#             kable(x, row.names = rownames, caption = caption, 
#               col.names = colnames, align = kbl.align, ...)
#         }
#     }
# }
