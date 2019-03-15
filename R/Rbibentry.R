#' **`Rbibentry`**: Another function for adding bibentries to a new or existing bibtex file.
#'
#' This function likely exists in similar forms via other packages already published on [_`CRAN`_](https://cran.r-project.org), but I wanted to do it my way so I'm adding it to my in-progress R package (**{Riley}**) for now.
#'
Rbibentry <- function(bibfile, type, key, fields = list(author = "", year = "", title = "", note = "")) {
    bib <- ifelse(file.exists(bibfile), bibfile, file.create(bibfile))
    entry.start <- paste0("@", type, "{", key, ",\n    ")
    fields.new <- c(fields)
    names(fields.new) <- NULL
    entry.body <- paste0(names(fields), "={", fields.new, "}", collapse = ",\n    ")
    entry.end <- "\n}"
    entry <- cat(paste0("\n\n", entry.start, entry.body, entry.end, collapse = ""), file = "temp.bib")
    file.append(bib, "temp.bib")
    file.remove("temp.bib")
}
