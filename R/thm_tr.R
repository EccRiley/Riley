#' ## **`thm_tr()`** (useful for plots involving geographic maps)
#'
library(ggplot2)
library(ggthemes)
#'
thm_tr <- function(base_size = 12,
                   base_family = "Helvetica") {
    theme(
        axis.ticks = element_line(colour = mypal[20], size = 0.2),
        axis.text = element_text(
            size = rel(0.8),
            colour = mypal[20],
            vjust = 1
        ),
        axis.ticks = element_line(colour = mypal[20], size = 0.2),
        axis.title = element_text(colour = mypal[20], vjust = 1),
        axis.title.y = element_text(
            angle = 90,
            vjust = 0.5,
            colour = mypal[20]
        ),
        axis.ticks.length = unit(0.3, "lines"),
        legend.background = element_rect(colour = mypal[20], fill = 'transparent'),
        legend.key = element_rect(colour = mypal[20], fill = 'transparent'),
        legend.key.size = unit(1.2, "lines"),
        legend.key.height = NULL,
        legend.key.width = NULL,
        legend.text = element_text(size = rel(0.8), colour = mypal[20]),
        legend.title = element_text(
            size = rel(0.8),
            face = "bold",
            hjust = 0,
            colour = mypal[20]
        ),
        legend.position = "right",
        legend.text.align = NULL,
        legend.title.align = NULL,
        #   legend.direction = "vertical",
        legend.box = NULL,
        panel.background = element_rect(fill = "transparent", colour = mypal[20]),
        panel.border = element_rect(fill = NA, colour = mypal[20]),
        #   panel.grid.major = element_line(colour = "grey20", size = 0.2),
        #   panel.grid.minor = element_line(colour = "grey5", size = 0.5),
        #   panel.spacing = unit(0.25, "lines"),
        strip.background = element_rect(fill = mypal[20], colour = mypal[20]),
        strip.text = element_text(size = rel(0.8), colour = 'white'),
        strip.text.y = element_text(angle = -90, colour = 'white'),
        plot.background = element_rect(colour = NA, fill = 'transparent'),
        plot.title = element_text(size = base_size * 1.2),
        plot.margin = unit(c(1, 1, 0.5, 0.5), "lines"),
        complete = TRUE
    )   # denotes that this is a complete theme function
}