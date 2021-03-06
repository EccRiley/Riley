#' ## **`thm_Rtft2()`**
#'
thm_Rtft2 <-
    function(base_size = 12,
             base_family = "serif",
             lpos = "right",
             ldir = "vertical",
             ltitle = element_blank()) {
        require(grid); require(ggplot2); require(ggthemes)
        theme_tufte(base_size, base_family) %+replace%
            theme(
                plot.background = element_rect(colour = mypal[19], fill = 'transparent'),
                panel.background = element_rect(colour = mypal[19], fill = 'transparent'),
                legend.position = lpos,
                legend.direction = ldir,
                legend.title = ltitle,
                axis.text.x = element_text(size = rel(0.65), angle = 0),
                axis.text.y = element_text(size = rel(0.65), angle = 0),
                axis.title.x = element_blank(),
                axis.title.y = element_blank(),
                complete = TRUE
            )
    }
