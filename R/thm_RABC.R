#' ## **`thm_RABC()`** (combines thm_A(), thm_B(), \& thm_C())
#'
#'
library(ggplot2)
library(ggthemes)

thm_RABC <- function(base_size = 12,
                    base_family = "Helvetica",
                    th = "A") {
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
            panel.spacing = unit(0.2, "lines"),
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
    if (th == "A") {
        thm <- thm_A
    } else if (th == "B") {
        thm <- function(base_size = 12) {
            ## thm_B() ##
            thm_A(base_size) %+replace%
                theme(axis.text.x = element_text(colour = mypal[20], size = rel(.75)))#,)
        }
    } else if (th == "C") {
        thm <- function(base_size = 12) {
            ## thm_C() ##
            thm_A(base_size) %+replace%
                theme(
                    axis.text.x = element_text(colour = mypal[20], size = rel(.65)),
                    legend.title = element_blank(),
                    legend.text = element_text(colour = mypal[20], size = rel(0.65)),
                    legend.key.size = unit(0.25, "cm"),
                    legend.position = "bottom",
                    legend.direction = "vertical"
                )
        }
    }
    return(thm)
}
