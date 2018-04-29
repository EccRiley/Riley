RdbGetQuery <- function(con, query, key = NULL, ...) {
    res <- dbGetQuery(con, query)
    setDT(res, key = key)
    return(res)
}
