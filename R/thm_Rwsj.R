
thm_Rwsj <- function(base_size = 10, base_family = "serif", title_family = "serif", bgcolor = "white", legend.position = "bottom", legend.direction = "horizontal", ...) {
    require(ggplot2); require(ggthemes);
    thm <- theme_wsj(base_size, base_family, title_family, color = bgcolor) %+replace% 
        theme(title = element_text(size = rel(2)), 
              axis.text = element_text(size = rel(1)), 
              legend.title = element_text(size = rel(1.15)),
              legend.text = element_text(size = rel(1)),
              legend.position = legend.position, legend.direction = legend.direction,
              ...)
    thm
}
