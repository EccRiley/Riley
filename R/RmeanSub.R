RmeanSub <- function(v, dich = TRUE) {
	mu.v <- mean(v, na.rm = TRUE)
	if (dich) {
		mu.v <- round(mu.v, 0)
	}
	v <- ifelse(is.na(v), mu.v, v)
	return(v)
}