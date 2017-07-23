#' ## **`thm_Rftf()`**
#'
thm_Rtft <-
    function(base_size = 12,
             base_family = "serif",
             lpos = "right",
             ldir = "vertical",
             ticks = TRUE,
             xticks = ticks,
             yticks = ticks,
             ltitle = FALSE,
             xline = FALSE,
             yline = FALSE,
             frame = FALSE,
             framecol = pal_my[19],
             framefill = "transparent",
             xtext = TRUE,
             ytext = TRUE,
             xtitle = TRUE,
             ytitle = TRUE,
             ptitle = TRUE,
             psubtitle = TRUE,
             pcaption = TRUE) {
        require(grid); require(ggplot2); require(ggthemes)
        thm <- theme_grey(base_size, base_family) %+replace%
            theme(
                plot.title = element_text(
                    size = rel(1.25),
                    face = "bold.italic",
                    colour = pal_my[19],
                    margin = margin(0, 0, 5, 0)),
                plot.subtitle = element_text(face = "italic",
                                             size = rel(1.15),
                                             hjust = 0.5,
                                             colour = pal_my[19],
                                             margin = margin(0, 0, 5, 0)),
                plot.caption = element_text(face = "italic",
                                            size = rel(1),
                                            hjust = 0.5,
                                            colour = pal_my[19],
                                            margin = margin(5, 0, 0, 0)),
                plot.margin = unit(rep(0.15, 4), "cm"),
                panel.spacing = unit(0.15, "cm"),
                panel.background = element_blank(),
                panel.border = element_blank(),
                strip.text = element_text(size = rel(0.7), colour = pal_my[20]),
                legend.position = lpos,
                legend.direction = ldir,
                legend.key.width = unit(0.15, "cm"),
                legend.key.height = unit(0.25, "cm"),
                legend.text = element_text(size = rel(0.75), colour = pal_my[20]),
                legend.title = element_text(face = "italic", colour = pal_my[19]),
                axis.ticks = element_line(size = 0.25, colour = pal_my[20]),
                axis.title.x = element_text(
                    size = rel(1),
                    face = "italic",
                    margin = margin(t = 10),
                    colour = pal_my[20]
                ),
                axis.title.y = element_text(
                    size = rel(1),
                    face = "italic",
                    angle = 90,
                    margin = margin(r = 10),
                    colour = pal_my[20],
                    vjust = 1
                ),
                axis.text.y = element_text(
                    size = rel(1),
                    hjust = 1,
                    margin = margin(r = 2),
                    colour = pal_my[20]
                ),
                axis.text.x = element_text(size = rel(1), colour = pal_my[20]),
                #, margin = margin(t = 2)
                axis.line.x = element_line(size = 0.1, colour = pal_my[20]),
                axis.line.y = element_line(size = 0.1, colour = pal_my[20]),
                complete = TRUE
            )
        if (frame) {
            thm <- thm + theme(plot.background =
                                   element_rect(colour = framecol,
                                                fill = framefill))
        } else {
            thm <- thm + theme(plot.background =
                                   element_rect(colour = "transparent",
                                                fill = 'transparent'))
        }
        if (!ticks) {
            thm <- thm + theme(axis.ticks = element_blank())
        }
        if (!xticks) {
            thm <- thm + theme(axis.ticks.x = element_blank())
        }
        if (!yticks) {
            thm <- thm + theme(axis.ticks.y = element_blank())
        }
        if (!xtext) {
            thm <- thm + theme(axis.text.x = element_blank())
        }
        if (!ytext) {
            thm <- thm + theme(axis.text.y = element_blank())
        }
        if (!xtitle) {
            thm <- thm + theme(axis.title.x = element_blank())
        }
        if (!ytitle) {
            thm <- thm + theme(axis.title.y = element_blank())
        }
        if (!xline) {
            thm <- thm + theme(axis.line.x = element_blank())
        }
        if (!yline) {
            thm <- thm + theme(axis.line.y = element_blank())
        }
        if (!ltitle) {
            thm <- thm + theme(legend.title = element_blank())
        }
        if (!ptitle) {
            thm <- thm + theme(plot.title = element_blank())
        }
        if (!psubtitle) {
            thm <- thm + theme(plot.subtitle = element_blank())
        }
        if (!pcaption) {
            thm <- thm + theme(plot.caption = element_blank())
        }
        thm
    }
