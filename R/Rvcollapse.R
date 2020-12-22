Rvcollapse <- function(v, collapse = "', '", open = "('", close = "')") {
    paste0(open, paste0(v, collapse = collapse), close)
}
# Rvcollapse(names(mtcars))
