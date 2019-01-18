
thm_Rwsj <- function(base_size = 10, base_family = "serif", title_family = "serif", bgcolor = "transparent",
                     title = element_text(size = rel(1.25), color = "#252525", face = "bold"),
                     axis.title = element_text(size = rel(1), face = "bold", color = "#252525"),
                     axis.text = element_text(size = rel(0.75), face = "plain"),
                     legend.position = "bottom", 
                     legend.direction = "horizontal", 
                     legend.title = element_text(size = rel(1), face = "bold.italic", color = "#252525"),
                     legend.text = element_text(size = rel(1)),
                     legend.key = element_rect(color = NA),
                     legend.key.size = unit(0.5, "cm"), 
                     strip.background = element_rect(fill = "#e3e3e6"),
                     strip.text = element_text(face = "bold"),
                     rect = element_rect(fill = "transparent", size = 0.5, linetype = 1, colour = "#252525"),
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
              rect = rect,
              # panel.background = element_rect(color = "#474747", size = 1),
              ...)
    thm
}

thm_Rwsj2 <- function() {
    thm <- thm_Rwsj(base_family = "sans", title_family = "sans", 
                    bgcolor = "transparent",
                    plot.title = element_text(color = "#252525", size = rel(1.25),
                                              face = "bold", hjust = 0.5, vjust = 1),
                    legend.title = element_text(size = rel(1), color = "#252525"),
                    legend.text = element_text(size = 12, color = "#252525"),
                    legend.key.size = unit(0.5, "cm"),
                    legend.position = "right", legend.direction = "vertical",
                    axis.text.x = element_text(size = 12, hjust = 0.5, color = "#252525"),
                    axis.text.y = element_text(size = 12, hjust = 1, color = "#252525"),
                    axis.title.x = element_text(size = 12),
                    axis.title.y = element_blank(),
                    ## ... ##
                    legend.box.margin = margin(0, 0, 0, 0, "pt"),
                    legend.margin = margin(0, 0, 0, 0, "pt"),
                    legend.background = element_blank(),
                    legend.box.background = element_blank(),
                    plot.background = element_blank(),
                    panel.border = element_blank(),
                    panel.grid.major = element_line(
                        colour = adjustcolor("lightgray", alpha.f = 0.5),
                        linetype =  "dotted", size = rel(1.5)),
                    panel.grid.minor = element_line(
                        colour = adjustcolor("lightgray", alpha.f = 0.5),
                        linetype =  "dotted", size = rel(1))) 
    thm
}
