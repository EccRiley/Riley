#' ## **`show_colR()`**
#'
Rshow_col <-
    function(colours,
             labels = TRUE,
             borders = NULL,
             ...) {
        ## modified version of `scales::show_col()` ##
        n <- length(colours)
        ncol <- ceiling(sqrt(n))
        nrow <- ceiling(n / ncol)
        colours <-
            c(colours, rep(NA, nrow * ncol - length(colours)))
        colours <- matrix(colours, ncol = ncol, byrow = TRUE)
        old <- par(pty = "s", mar = c(0, 0, 0, 0))
        on.exit(par(old))
        size <- max(dim(colours))
        if (length(colours >= 40))
            t.size <- 0.75
        else
            t.size <- 0.85
        plot(
            c(0, size),
            c(0, -size),
            type = "n",
            xlab = "",
            ylab = "",
            axes = FALSE,
            cex = t.size,
            ...
        )
        rect(
            col(colours) - 1,
            -row(colours) + 1,
            col(colours),
            -row(colours),
            col = colours,
            border = borders,
            ...
        )
        if (labels) {
            text(
                col(colours) - 0.5,
                -row(colours) + 0.75,
                matrix(seq(1:length(colours)), nrow = nrow, byrow = TRUE),
                cex = t.size,
                ...
            )
            text(col(colours) - 0.5,
                 -row(colours) + 0.25,
                 colours,
                 cex = t.size,
                 ...)
        }
    }
#'
