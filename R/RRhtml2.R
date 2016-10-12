RRhtml2 <-
    function(x, ...) {
        rmarkdown::render(x, output_format = "bookdown::html_document2", ...)
        print(format(Sys.time(), '%n[%d %b. %I:%M%p]'))
    }
