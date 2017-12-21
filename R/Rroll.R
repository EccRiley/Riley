Rroll <- function(x, roll, keeprolls = FALSE) {
	rollend <- unique(x)
	rollstart0 <- rollend - (roll - 1)
	gp <- grep("^20\\d{2}(9\\d)|(00)$", rollstart0, perl = TRUE, value = TRUE)
	rollstart <- ifelse(rollstart0 %in% gp, rollstart0 - 88, rollstart0)
	rolls <- data.frame(rollstart = rollstart, rollend = rollend)
	f <- function(x) { 
		x[1]:x[2]
	}
	rollsrng <- apply(rolls, 1, f)
	if (keeprolls) {
		lrolls <- list(rollstart = rollstart, rollend = rollend)
		return(list(rolls = lrolls, rollsrng = rollsrng))
	} else if (!keeprolls) {
		return(rollsrng)
	}
}
