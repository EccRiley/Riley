RRpdf <-
    function(x, ...) {
        rmarkdown::render(x, output_format = "pdf_document", ...)
        print(format(Sys.time(), '%n[%d %b. %I:%M%p]'))
    }
