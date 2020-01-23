## Ras.Date.unix(): CONVENIENCE FUNCTION TO PARSE 10-DIGIT UNIX TIMESTAMP AS DATE ##

Ras.Date.unix <- function(x, origin = "1970-01-01") {
  y0 <- x/60/60/24
  res <- as.Date(y0, origin = origin)
  return(res)
}
