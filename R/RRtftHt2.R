RRtftHt2 <-
    function(x, ...) {
        rmarkdown::render(x, output_format = "bookdown::tufte_html2", ...)
        print(format(Sys.time(), '%n[%d %b. %I:%M%p]'))
    }
