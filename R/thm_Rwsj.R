
thm_Rwsj <- function(base_size = 10, base_family = "serif", title_family = "serif", bgcolor = "white",
                     title = element_text(size = rel(1.25), color = "#474747", face = "bold"),
                     axis.title = element_text(size = rel(1), face = "bold", color = "#474747"),
                     axis.text = element_text(size = rel(0.75), face = "plain"),
                     legend.position = "bottom", 
                     legend.direction = "horizontal", 
                     legend.title = element_text(size = rel(1), face = "bold.italic", color = "#474747"),
                     legend.text = element_text(size = rel(1)),
                     legend.key = element_rect(color = NA),
                     legend.key.size = unit(0.5, "cm"), 
                     strip.background = element_rect(fill = "#e3e3e6"),
                     strip.text = element_text(face = "bold"),
                     ...) {
    require(ggplot2); require(ggthemes);
    thm <- theme_wsj(base_size, base_family, title_family, color = bgcolor) %+replace% 
        theme(title = title, 
              axis.title = axis.title,
              axis.text = axis.text, 
              legend.position = legend.position, 
              legend.direction = legend.direction,
              legend.title = legend.title, 
              legend.text = legend.text,
              legend.key = legend.key,
              legend.key.size = legend.key.size,
              strip.background = strip.background,
              strip.text = strip.text,
              rect = element_rect(linetype = 1, colour = "#474747"),
              # panel.background = element_rect(color = "#474747", size = 1),
              ...)
    thm
}
