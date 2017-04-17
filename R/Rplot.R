#' ## `{knitr}` Chunk Hook: **`Rplot()`**
#'
#' A chunk hook for setting plot params corresponding to '`ggthemes::theme_tufte()`' when using base graphics.
#'
knitr::knit_hooks$set(
    Rplot = function(before, options, envir) {
        if (before) {
            palette(mypal)
            par(bg = "transparent",
                font.main = 3,
                family = "serif")
        }
    }
)
