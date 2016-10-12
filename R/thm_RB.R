#' ## **`thm_RB()`**
#'
#'
library(ggplot2)
library(ggthemes)

thm_RB <- function(base_size = 12,
                  base_family = "Helvetica") {
    require(grid) # Needed for unit() function
    thm_A <- theme_grey(base_size) %+replace%
        theme(
            plot.background = element_rect(colour = mypal[20], fill = 'transparent'),
            panel.background = element_rect(colour = mypal[20], fill = 'transparent'),
            panel.grid.minor = element_blank(),
            panel.grid.major.y = element_line(
                colour = mypal[20],
                size = 0.1,
                linetype = "dashed"
            ),
            panel.grid.major.x = element_blank(),
            axis.title = element_text(
                colour = mypal[20],
                size = rel(.8),
                margin = margin(0, 0, 5, 0),
                face = "bold"
            ),
            axis.text.x = element_blank(),
            axis.text.y = element_text(colour = mypal[20], size = rel(.7)),
            axis.line = element_line(colour = mypal[20], size = 0.15),
            axis.ticks.length = unit(0.1, "cm"),
            axis.ticks = element_line(size = 0.1, colour = mypal[20]),
            legend.title = element_text(face = "bold", size = rel(0.8)),
            legend.text = element_text(colour = mypal[20], size = rel(0.6)),
            legend.key.size = unit(0.35, "cm"),
            legend.background = element_rect(
                colour = mypal[20],
                size = 0.25,
                linetype = "dotted",
                fill = 'transparent'
            ),
            legend.position = "right",
            strip.background = element_rect(fill = mypal[20], colour = mypal[20]),
            strip.text.x = element_text(
                colour = mypal[1],
                size = rel(0.85),
                margin = margin(1, 0, 1, 0),
                face = 'bold'
            ),
            strip.text.y = element_text(
                angle = -90,
                colour = mypal[1],
                size = rel(0.85),
                margin = margin(1, 0, 1, 0),
                face = 'bold'
            ),
            panel.margin = unit(0.2, "lines"),
            plot.margin = unit(c(0.75, 0.5, 0, 0.5), "lines"),
            #top, right, bottom, left
            plot.title = element_text(
                size = rel(1),
                colour = mypal[20],
                margin = margin(0, 0, 10, 0),
                face = "bold"
            ),
            complete = TRUE
        )
    thm <- thm_A(base_size) %+replace%
        theme(axis.text.x = element_text(colour = mypal[20], size = rel(.75)))#,)
        return(thm)
}
