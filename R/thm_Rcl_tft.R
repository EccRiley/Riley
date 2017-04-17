#' ## thm_Rcl_tft()
#'
#' A ggtheme useful for plots involving geographic maps, or any other data visualization situation requiring a minimal, "clean" [@winston2012rgraphics], theme. **`Rthm_cl_tft()`** combines @chang2012rgraphics's "clean" `ggtheme` (see **`thm_cl()`** with my implementation of the "`tufte`" theme available in the `{ggthemes}` package [@R-ggthemes; @R-ggplot2].
#'
#'
thm_Rcl_tft <-
    function(base_size = 11,
             base_family = "serif",
             lpos = "right",
             ldir = "vertical",
             ltitle = FALSE,
             ptitle = FALSE) {
        require(grid); require(ggthemes)
        thm <- theme_tufte(base_size, base_family) %+replace%
            theme(
                plot.background = element_rect(colour = "transparent", fill = 'transparent'),
                panel.background = element_blank(),
                legend.position = lpos,
                legend.direction = ldir,
                legend.text = element_text(size = rel(0.65), colour = mypal[20]),
                legend.key.width = unit(0.15, "cm"),
                legend.key.height = unit(0.25, "cm"),
                legend.title = element_text(face = "italic", colour = mypal[19]),
                plot.title = element_text(
                    face = "italic",
                    colour = mypal[19],
                    size = rel(1)
                ),
                panel.grid = element_blank(),
                axis.title = element_blank(),
                axis.text = element_blank(),
                axis.ticks = element_blank(),
                complete = TRUE
            )
        if (!ltitle) {
            thm <- thm + theme(legend.title = element_blank())
        }
        if (!ptitle) {
            thm <- thm + theme(plot.title = element_blank())
        }
        thm
    }

