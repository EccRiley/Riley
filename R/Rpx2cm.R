#' Dpi == dots-per-inch (i.e., pixel density using an inch scale), so 300 dpi means there are 300 pixels per inch)

px2cm <- function(px_x, px_y = NULL, dpi = 96) {
    inch_cm <- 2.54 ## 1 INCH == 2.54 CM ##
    px_cm <- dpi / inch_cm ## SO, CM == PIXEL DENSITY PER INCH DIVIDED BY INCHES IN CM ##
    px_cm
    cm_x <- px_cm*px_x
    cm_y <- px_cm*px_y
    return(c(cm_x = cm_x, cm_y = cm_y))
}
