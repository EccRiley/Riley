# Rprehtml_sn <- function(x) {
#     # xnew0 <- gsub("(.*?)\\.Rmd", "\\1", x)
#     # xnew <- paste0(xnew0, "_preht.Rmd")
#     x1 <- readLines(x)
#     writeLines(x1, paste0(gsub("(.*?)\\.Rmd", "\\1", x), "-orig.Rmd"))
#     p <- '\\^\\[(.*?)\\]'#
#     m <- regexpr(p, x1)
#     notes0 <- regmatches(x1, m)
#     notes <- gsub("\\^|\\[|\\]", "", notes0)
#     n <- seq(1:length(notes))
#     # replace footnotes with sidenotes
#     for (i in 1:length(fn)) {
#         con = sprintf(
#             '<label for="sn-%d" class="margin-toggle sidenote-number"></label></span><input type="checkbox" id="sn-%d" class="margin-toggle"/><span class="sidenote">%s</span>',
#             n[i], n[i], notes[i])
#         x2 <- gsub(p, con, x1)
#     }
#     writeLines(x2, x)
# }

# Rhtout <- function() {
#     htouts <- list.files(pattern = "\\.html")
#     htouts_in <- sapply(htouts, readLines, encoding = "UTF-8")
#     for (i in 1:length(htouts_in)){
#         htouts_in[[i]] <- gsub("about_files/tufte\\-css\\-2015\\.12\\.29/tufte\\.css",
#                                "auxDocs/riley.css", htouts_in[[i]],
#                                fixed = FALSE, perl = TRUE, useBytes = TRUE)
#         htouts_in[[i]] <- gsub("about_files",
#                                "auxDocs", htouts_in[[i]],
#                                fixed = FALSE, perl = TRUE, useBytes = TRUE)
#
#         writeLines(htouts_in[[i]], htouts[i], useBytes = TRUE)
#     }
# }


Rprehtml_sn <- function(x) {
    xnew1 <- gsub("_", "", x)
    xnew <- gsub("\\-orig", "", xnew1)
    x1 <- readLines(x)
    # writeLines(x1, paste0(gsub("(.*?)\\.Rmd", "\\1", x), "-orig.Rmd"))
    x2 <- gsub('([^?<\\^])\\[(.*?)\\]\\((.*?)\\)', "\\1<a href='\\3'>\\2</a>", noquote(x1), useBytes = FALSE)
    p <- '\\^\\[(.*?)\\]'
    # y <- gsub(p, '<label for="sn-%d" class="margin-toggle sidenote-number"></label></span><input type="checkbox" id="sn-%d" class="margin-toggle"/><span class="sidenote">\\1</span', x2)
    m <- gregexpr(p, noquote(x2))
    notes1 <- regmatches(x2, m)
    notes2 <- unlist(notes1)
    notes <- gsub("\\^|\\[|\\]", "", notes2)
    n <- seq(1:length(notes))
    for (i in 1:length(n)) { ## replace footnotes with sidenotes ##
        con = sprintf(
            "<label for='sn-%d' class='margin-toggle sidenote-number'></label></span><input type='checkbox' id='sn-%d' class='margin-toggle'/><span class='sidenote'>%s</span>",
            n[i], n[i], notes[i])
        x3 <- gsub(p, con, x2)
    }
    writeLines(x3, xnew)
}

# siteFiles <- grep("^_\\w+\\-orig\\.Rmd", list.files(), value=TRUE)
# sapply(siteFiles, prehtml_sn)
