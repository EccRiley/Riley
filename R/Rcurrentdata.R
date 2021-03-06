## Rcurrentdata(): A #UTILITY# FUNCTION TO IMPORT MOST RECENT DATAFILE FROM SPECIFIED PATH/PATTERN ##
## THIS IS CURRENTLY ONLY FUNCTIONAL WITH A PROJECT WORKFLOW THAT INVOLVES A STANDARDIZED FILENAMING CONVENTION FOR DATAFILES, WHEREIN EACH DATAFILE'S BASENAME ENDS WITH THE DATEFILE'S DATE IN THE ISO DATE FORMAT (BUT WITHOUT DASHES - E.G., "20180516") ##
## [TODO]: IMPLEMENT MORE GENERALIZABLE FUNCTIONALITY THAT IS LESS DEPENDENT ON THE USER'S WORKFLOW (I.E., SCAN FOR THE MOST RECENTLY MODIFIED/ADDED (BASED ON USER-SPECIFIED OPTIONS [TODO]) FILE(S) AND/OR FILES MODIFIED/ADDED WITHIN A PARTICULAR *DATE RANGE* BY PULLING IN THE FILE DETAILS (INSTEAD OF RELYING ON THE FILENAMES ONLY, WHICH IS CURRENTLY THE MAIN BARRIER IN THE FUNCTION'S GENERALIZABILITY) ##
## [TODO]: GENERALIZE SO THAT MORE THAN JUST '.csv' FILES CAN BE READ/SEARCHED FOR ##

Rcurrentdata <-  function(pattern, path = "data", perl = TRUE, readData = TRUE, ...) {
    path <- gsub("^(.*?)/$", "\\1", path, perl = TRUE)
    datafiles <- list.files(path = path, pattern = pattern)
    current <- max(as.integer(gsub(pattern, "\\1", datafiles,
                                   perl = perl)))
    infile <- grep(as.character(current), datafiles, value = TRUE)
    inpath <- paste0(path, "/", infile)
    if (readData) {
        if (infile %in% grep("\\.csv", infile, value = TRUE)) {
            currentdata <- Rrdcsv(inpath, ...)
        } else if (infile %in% grep("\\.xl", infile, value = TRUE)) {
            currentdata <- readxl::read_xlsx(inpath, ...)
        } else stop("Unable to read data")
        message(paste0("## CURRENT DATAFILE = \"", inpath, "\" ##"))
    } else {
        currentdata <- inpath
    }
    return(currentdata)
}

#' # Arguments
#' "...": ADDITIONAL ARGUMENTS PASSED TO 'Rrdcsv()' OR 'read.csv()'
