
# file <- "MAP-v6 copy.Rmd"
# ex <- data.frame(
# 	a = c("`\\{\\! (.*?) \\!\\}`",
# 		"\\chisq",
# 		"\\url\\{(.*?)\\}",
# 		"\\%",
# 		"\\parindent=\\-1\\.75em",
# 		"\\setlength\\{\\parskip\\}\\{0\\.25\\baselineskip\\}",
# 		"\\doublespacing",
# 		"\\Frule"),
# 	b = c("\\1",
# 		"\\chi^{2}",
# 		"\\1",
# 		"%",
# 		" ",
# 		" ",
# 		" ",
# 		" "))

Rpregex <- function(FUN, pattern, replacement, x, perl = TRUE, ...) {
    if (FUN == "gsub" | FUN == "sub") {
        do.call(FUN, list(pattern, replacement, x, perl, ...))
    } else {
        do.call(FUN, list(pattern, x, perl = perl, ...))
    }
}

Runtex <- function(file, addlexpr = NULL, yml, ymlline, cat = TRUE, catFile = NULL, ...) {
    x <- readLines(file)[-1:-ymlline]
    xnew <- Rpregex("gsub", "\\\\\\\\", "\\\\", x)
    xnew <- Rretex(xnew, op = 2)
    xnew <- Rpregex("gsub", "\\\\newpage", "", xnew)
    xnew <- Rpregex("gsub", "\\\\tiny\\{(.*?)\\}", "\\1", xnew, ignore.case = TRUE)
    xnew <- Rpregex("gsub", "\\\\scriptsize\\{(.*?)\\}", "\\1", xnew)
    xnew <- Rpregex("gsub", "\\\\footnotesize\\{(.*?)\\}", "\\1", xnew)
    xnew <- Rpregex("gsub", "\\\\small\\{(.*?)\\}", "\\1", xnew)
    xnew <- Rpregex("gsub", "\\\\large\\{(.*?)\\}", "\\1", xnew, ignore.case = TRUE)
    xnew <- Rpregex("gsub", "\\\\huge\\{(.*?)\\}", "\\1", xnew, ignore.case = TRUE)
    xnew <- Rpregex("gsub", "\\\\singlespacing", "", xnew)
    xnew <- Rpregex("gsub", "\\\\doublespacing", "", xnew)
    xnew <- Rpregex("gsub", "\\\\onehalfspacing", "", xnew)
    if (!is.null(addlexpr))
		for (i in 1:nrow(addlexpr)) {
			xnew <- gsub(addlexpr[i, 1], addlexpr[i, 2], xnew, perl = F)
		}
    res0 <- ifelse(xnew == "", NA, xnew)
    res1 <- na.omit(res0)
    res <- c(yml, res1)
	if (cat && !is.null(catFile))
		cat(res, file = catFile, sep = "\n", ...)
	else return(res)
}

# Runtex(file = file, addlexpr = ex, cat = TRUE, catFile = "test-untex.txt")
