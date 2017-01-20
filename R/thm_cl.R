#' ## **`thm_cl()`** (useful for plots involving geographic maps)
#'
#' This theme function was originally provided by [Winston Chang](https://github.com/wch) in his [_R Graphics Cookbook_](http://www.cookbook-r.com) [@chang2012rgraphics].
#'
library(ggplot2)
library(ggthemes)

thm_cl <- function(base_size = 12,
                   base_family = "ETBembo") {
    require(grid) # Needed for unit() function
    theme_grey(base_size) %+replace%
        theme(
            panel.background = element_rect(fill = "#f7f8f9"),
            panel.grid = element_blank(),
            axis.title = element_blank(),
            axis.text = element_blank(),
            axis.line = element_line(colour = "#708090", size = 0.15),
            axis.ticks = element_blank(),
            legend.title = element_text(face = "bold", size = rel(1)),
            legend.text = element_text(colour = "#3d3d3d", size = rel(.75)),
            legend.key.size = unit(0.35, "cm"),
            strip.text = element_text(colour = "#3d3d3d", size = rel(.85)),
            strip.background = element_rect(colour = "#708090", fill = "#ffffff"),
            panel.spacing = unit(0.2, "lines"),
            plot.margin = unit(c(0.2, 0.2, 0.2, 0.2), "lines"),
            complete = TRUE
        )
}

