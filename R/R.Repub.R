RRepub <-
    function(x, ...) {
        rmarkdown::render(x, output_format = "bookdown::epub_book", ...)
        p <- gsub("\\.Rmd", "\\.epub", x)
        bookdown::kindlegen(p)
        print(format(Sys.time(), '%n[%d %b. %I:%M%p]'))
    }
