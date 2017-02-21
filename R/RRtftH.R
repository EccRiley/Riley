RRtftH <-
    function(x, ...) {
        rmarkdown::render(x, output_format = "tufte::tufte_handout", ...)
        print(format(Sys.time(), '%n[%d %b. %I:%M%p]'))
    }
