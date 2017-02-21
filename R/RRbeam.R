RRbeam <-
    function(x, ...) {
        rmarkdown::render(x, output_format = "beamer_presentation", ...)
        print(format(Sys.time(), '%n[%d %b. %I:%M%p]'))
    }
