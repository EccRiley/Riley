Rroll <- function(x, roll) {
	rollend <- unique(x)
	rollstart0 <- rollend - (roll - 1)
	gp <- grep("^20\\d{2}[(9\\d)(00)]$", rollstart0, perl = TRUE, value = TRUE)
	rollstart <- ifelse(rollstart0 %in% gp, rollstart0 - 88, rollstart0)
	return(list(rollstart = rollstart, rollend = rollend))
}
