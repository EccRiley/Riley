R.bibdf <- function(bib) { ## WORKING ##
	bib <- readLines(bib)
	k <- bib[grep("\\@\\w+\\{.*?,", bib, perl = TRUE)]
	Etype <- gsub("\\@(.*?)\\{.*?,", "\\@\\1", k, perl = TRUE)
	keys <- gsub("\\@\\w+\\{(.*?)", "\\@\\1", k, perl = TRUE)
	fields <- c("address", "annote", "author", "booktitle", "chapter", "crossref", "edition", 
		"editor", "howpublished", "institution", "journal", "key", "month", "note", "number", 
		"organization", "pages", "publisher", "school", "series", "title", "type", "volume", 
		"year")
		f1 <- function(x) {grep(paste0(x, "=\\{.*?\\},"), bib, perl = TRUE)}
		f2 <- function(x, y) {
			gsub("[ ]+", names(x), "=\\{(.*?)\\}", "\\1"), x, perl = TRUE)
		fields1 <- sapply(fields, f)
		fields2 <- 
	}
	bib <- list(keys, Etype, fields)
	return(bib)
}

for (i in 1:length(fields)) {
	print(fields)
}