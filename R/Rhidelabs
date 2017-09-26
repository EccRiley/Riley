#' # Rhidelabs
#'
#' Description: Shows or hides ggplot() labels (labs(...)) in rmarkdown/knitr output based on user-declared knitr chunk option ("hideCap=TRUE" -> hides labels, "hideCap=FALSE" -> adds labels to plots)  
#'
RhideLabs <- function(x, labs) {
    if (knitr::opts_chunk$get("hideCap") == FALSE) {
        x + labs
    } else {
        x
    }
}
