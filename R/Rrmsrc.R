Rrmsrc <- function(x, ...) { ## BE CAREFUL WITH THIS!!! ##
    objs <- ls(pos = ".GlobalEnv")
    rm(list = objs, pos = ".GlobalEnv") ## REMOVE EVERYTHING FROM THE CURRENT SESSION GLOBAL ENVIRONMENT (see `?ls` & `?rm`)
    source(x)
}
