rrpm <- function() { ## Re-Replace pander printing methods with default print methods after running "rpm()" ##
    l <- ls()
    l.gr <- grepl("print\\..*?", l, perl = TRUE)
    l.rm <- as.character(l[l.gr == 1])
    on.exit(rm(list = l.rm))
}
