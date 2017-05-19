RgetFigs <- function(f, figPath = "graphics/inputs/", ext = '.pdf', cap = NULL) { ## only works when the figure labels used in the text match the base filenames of the figures, and the figure files can all be found via the same base file path ##
    x <- readLines(f)
    p <- "\\{\\+@fig\\:.*?\\}"
    m <- regexpr(p, x)
    figRefs <- regmatches(x, m)
    figPath <- rep(figPath, length(figRefs))
    ext <- rep(ext, length(figRefs))
    # figRefs <- figRefs[!duplicated(figRefs)]
    figLabs <- gsub("\\+@", "#", figRefs)
    figFiles <- gsub("\\{#fig\\:(.*?)\\}", "\\1", figLabs)
    y <- vector()
    if (!is.null(cap)) {
        for (i in 1:length(figLabs)) {
            y[i] <- paste0("![", cap[i], "](", figPath[i], figFiles[i], ext[i], ")", figLabs[i])
        }
        }
        else {
            for (i in 1:length(figLabs)) {
                y[i] <- paste0("![](", figPath[i], figFiles[i], ext[i], ")", figLabs[i])
        }
    }
    return(y)
}

