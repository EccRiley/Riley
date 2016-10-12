RRword <-
    function(x, ...) {
        rmarkdown::render(x, output_format = "word_document", ...)
        print(format(Sys.time(), '%n[%d %b. %I:%M%p]'))
    }
