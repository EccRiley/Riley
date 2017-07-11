source("Rprehtml_sn.R")
# siteFiles <- grep("^_\\w+\\-orig\\.Rmd", list.files(), value=TRUE)
# sapply(siteFiles, prehtml_sn)

Rsite <- function(...) {
    siteFiles <- grep("^_\\w+\\-orig\\.Rmd", list.files(), value=TRUE)
    sapply(siteFiles, Rprehtml_sn)
    rmarkdown::render_site(encoding = 'UTF-8', ...)
}
