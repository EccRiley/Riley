RRnb <-
    function(x, ...) {
        rmarkdown::render(x, output_format = "html_notebook", ...)
        print(format(Sys.time(), '%n[%d %b. %I:%M%p]'))
    }
