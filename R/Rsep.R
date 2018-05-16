## Rsep(): Similar to tidyr::separate(), except more flexible for situations where you don't necessarily know how many columns need to be added ##

Rsep <- function(cl, data, sep.pre = paste0(cl, "_"), sep = ",", remove = FALSE, extra = "merge", fill = "right", ...) {
    # q <- ifelse(is.data.table(data), strsplit(data[, q, with = FALSE], ","), strsplit(data[, q], ","))
    # cl.ind <- which(names(data) == cl)
    orig.class <- class(data)
    d <- as.data.frame(data)
    spl <- strsplit(d[, cl], ",")
    max.spl <- max(unlist(lapply(spl, length)))
    d <- tidyr::separate(data = data, col = cl, into = paste0(sep.pre, 1:max.spl), sep = sep, remove = remove, extra = extra, fill = fill, ...)
    class(d) <- orig.class
    return(d)
}
