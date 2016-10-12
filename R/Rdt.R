#' ## **`Rdt()`**
#' 
#' `DT::datatable()` with my usual settings.^[Thanks to `Stack-Overflow` user [\textbf{\color{dkblue}{Sven Hohenstein}}](http://stackoverflow.com/questions/14577412/how-to-convert-variable-object-name-into-string) for providing the function deparse(substitute(x)) idea to convert an Robject's name to string. Notes: `deparse()` = "Turn unevaluated expressions into character strings"; `substitute()` = "return the parse tree for the unevaluated expression, substituting any variables bound in env."]
#'
Rdt <-
    function(x,
             caption = deparse(substitute(x)),
             rownames = FALSE,
             class = c("row-border"),
             filter = 'none',
             options = list(
                 pageLength = 300,
                 lengthMenu = c(200, 500, 1000, 1500),
                 info = TRUE,
                 dom = 'tip',
                 ...
             ),
             ...) {
        cap <-
            htmltools::tags$caption(style = 'caption-side: top; text-align: left;',
                                    htmltools::strong(htmltools::em(paste(caption))))
        DT::datatable(
            x,
            rownames = rownames,
            caption = cap,
            filter = filter,
            class = class,
            options = options,
            ...
        )
    }
#'
