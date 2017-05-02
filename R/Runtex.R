# file <- "MAP-v6 copy.Rmd"
# ex <- data.frame(
# 	a = c("`\\{\\! (.*?) \\!\\}`",
# 		"\\\\chisq",
# 		"\\\\url\\{(.*?)\\}",
# 		"\\\\%",
# 		"\\\\parindent=\\-1\\.75em",
# 		"\\\\setlength\\{\\\\parskip\\}\\{0\\.25\\\\baselineskip\\}",
# 		"\\\\doublespacing",
# 		"\\\\Frule"),
# 	b = c("\\1",
# 		"\\\\chi^{2}",
# 		"\\1",
# 		"%",
# 		" ",
# 		" ",
# 		" ",
# 		" "))

Runtex <- function(file, addlexpr = NULL, cat = TRUE, catFile = NULL, ...) {
	x <- readLines(file)
	xnew <- Rretex(x, op = 2)
	xnew <- gsub("\\\\newpage", "", xnew, perl = TRUE)
	# xnew <- gsub("\\\\", "\\", xnew, perl = TRUE)
	xnew <- gsub("\\\\tiny\\{(.*?)\\}", "\\1", xnew, perl = TRUE)
	xnew <- gsub("\\\\scriptsize\\{(.*?)\\}", "\\1", xnew, perl = TRUE)
	xnew <- gsub("\\\\footnotesize\\{(.*?)\\}", "\\1", xnew, perl = TRUE)
	xnew <- gsub("\\\\small\\{(.*?)\\}", "\\1", xnew, perl = TRUE)
	xnew <- gsub("\\\\large\\{(.*?)\\}", "\\1", xnew, perl = TRUE)
	xnew <- gsub("\\\\Large\\{(.*?)\\}", "\\1", xnew, perl = TRUE)
	xnew <- gsub("\\\\LARGE\\{(.*?)\\}", "\\1", xnew, perl = TRUE)
	xnew <- gsub("\\\\huge\\{(.*?)\\}", "\\1", xnew, perl = TRUE)
	xnew <- gsub("\\\\Huge\\{(.*?)\\}", "\\1", xnew, perl = TRUE)
	xnew <- gsub("\\\\HUGE\\{(.*?)\\}", "\\1", xnew, per = TRUE)
	if (!is.null(addlexpr))
		for (i in 1:nrow(addlexpr)) {
			xnew <- gsub(addlexpr[i, 1], addlexpr[i, 2], xnew, perl = TRUE)}
	if (cat && !is.null(catFile))
		cat(xnew, file = catFile, sep = "\n", ...)
	else return(xnew)
}

# Runtex(file = file, addlexpr = ex, cat = TRUE, catFile = "MAP-v6-untex.Rmd")
