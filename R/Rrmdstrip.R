# x <- "RQDA-journal-rmsh.Rmd"
# new <- "RQDA-journal-plntxt-rmsh.txt"

Rgsub <- function(pattern, replacement, x, perl = perl) {
    gsub(pattern = pattern, replacement = replacement, x = x, perl = TRUE)
}

Rrmdstrip <- function(x, new,
                      rmYAML = FALSE,
                      YAMLfields = c("title: ", "author: ", "date: "),
                      YAMLrepl = c("", ""), ## can only be length of 2
                      rmFN = FALSE, ## remove footnotes ? ##
                      FNfmt = "\\^\\[(.*?)\\]", ## FN search string (if rmFN) ##
                      FNrepl = "(\\1)",
                      perl = TRUE) {
    bld <- "\\*\\*(.*?)\\*\\*" ## replace with "\\1" ##
    ital <- "_(.*?)_" ## replace with "\\1" ##
    tt <- "`(.*?)`" ## replace with "\\1" ##
    y <- readLines(x)
    if (rmYAML) {
        yml1 <- "^---$"
        yml2 <- paste0("^[", paste("(", YAMLfields, ")", collapse = "|"), "].*?$") ## replace with "" ##
        y <- gsub(yml1, YAMLrepl[1], y, perl = perl)
        y <- gsub(yml2, YAMLrepl[2], y, perl = perl)
    } else
        if (rmFN) {
            y <- gsub(FNfmt, FNrepl, y, perl = perl)
        } else
            x_new <- Rgsub(bld, "\\1", y)
    x_new <- Rgsub(ital, "\\1", x_new)
    x_new <- Rgsub(tt, "\\1", x_new)
    writeLines(x_new, new)
}

# Rrmdstrip(x, new)
