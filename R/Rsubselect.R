Rsubselect <- function(x, select_vars, deselect = FALSE, ...) {
    
    ### GET VALID VARNAMES FROM SELECT_VARS: ####
    
    vars_valid <- intersect(select_vars, names(x))
    
    ### WARN ABOUT INVALID SELECT VARS: ####
    if (any(!select_vars %in% names(x))) {
        warning(paste0("The following varnames do not exist in x:\n'",
            paste0(setdiff(select_vars, names(x)), collapse = "'\n'"), "'"))
    }
    
    ### CREATE SELECT SNIPPET: ####
    if (deselect == TRUE) {
        select_prefix <- "-c("
    } else {
        select_prefix <- "c("
    }
    snippet_c <- paste0(select_prefix,
        paste0(vars_valid, collapse = ", "), ")")
    
    res <- subset(x, select = eval(parse(text = snippet_c)),
        ...)
    
    return(res)
    
}
