Rdbq.rqda <- function(dbpath, tables = c("freecode", "treecode", "codecat", "cases", "caselinkage", "source", "coding")) {
	require(RSQLite); require(DBI)
	db <- dbConnect(SQLite(), dbpath)
	tbls <- list(mode = "list", length = length(tables))
	for (i in 1:length(tables)) {
		dbGetQuery(db, paste0("SELECT * FROM ", tables[i], ";")) -> tbls[[i]]
	}
	dbDisconnect(db)
	names(tbls) <- tables
	return(tbls)
}
