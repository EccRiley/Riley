RRtftHt <-
    function(x, ...) {
        rmarkdown::render(x, output_format = "tufte::tufte_html", ...)
        print(format(Sys.time(), '%n[%d %b. %I:%M%p]'))
    }
