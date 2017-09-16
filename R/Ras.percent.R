## laziness-inspired wrapper for presenting percentages appropriately, without having to change the numeric class of the data itself (unless you want to, i suppose) ##

Ras.percent <- function(x) {
    paste0(x, "%")
}