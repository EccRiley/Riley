R.v2na <- function(x, v = 0) {
	x <- ifelse(x == v, NA, x)
	return(x)
}
