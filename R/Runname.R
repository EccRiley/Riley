## SUPER SIMPLE CONVENIENCE FUN TO RM() THE NAMES OF A NMAED OBJECT (USEFUL FOR ON-THE-FLY/TEMPORARY NAME REMOVAL WHEN HAVING NAMED UNITS CAUSES MINOR CONFLICTS (E.G., IN 'ggplot2::scale_manual(values = ...)'

Runname <- function(x) {
    y <- x; 
    names(y) <- NULL; 
    return(y)
}

