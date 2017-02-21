RRhtml <-
    function(x, ...) {
        rmarkdown::render(x, output_format = "html_document", ...)
        print(format(Sys.time(), '%n[%d %b. %I:%M%p]'))
    }
