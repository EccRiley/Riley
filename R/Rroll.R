Rroll <- function(x, roll) {
	rollend <- unique(x)
	_rollstart <- rollend - (roll - 1)
	_gp <- grep("^20\\d{2}[(9\\d)(00)]$", _rollstart, perl = TRUE, value = TRUE)
	rollstart <- ifelse(_rollstart %in% _gp, _rollstart - 88, _rollstart)
	return(list(rollstart = rollstart, rollend = rollend)
}
