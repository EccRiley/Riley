# RnoMarkdown <- function(x) {
#
# }

xr <- readLines(x)
xr <- within(xr, {
    gsub("\\*\\*(.*?)\\*\\*")
})
