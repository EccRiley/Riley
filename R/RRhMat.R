RRhMat <-
    function(x, ...) {
        rmarkdown::render(x, output_format = "rmdformats::material", ...)
        print(format(Sys.time(), '%n[%d %b. %I:%M%p]'))
    }
