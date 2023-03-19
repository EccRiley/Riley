# #UTILS #
# MODIFIED VERWION OF @FDRYAN'S GGPLOT FORMATTER --------------------------------------------------------
## ORIGINAL SOURCE: https://raw.githubusercontent.com/fdryan/R/master/ggplot2_formatter.r ##
require(plyr)
require(scales)

# ---------------------------------------------------------------------------------------------
# Formatting functions for ggplot  graph axis
# ---------------------------------------------------------------------------------------------

#' Human Numbers: Format numbers so they're legible for humans
#' Use this in ggplot for labels where you might use the comma or percent functions from the
#' Scales package.
#'
#' Checks whether numbers are positive or negative.
#' Allows up to 1 significant figure
#' sapply used for element-wise application of the humanity function as a vector may include
#' numbers where billions, millions or thousands are appropriate.
#'
#' @return a character vector the same length as the input vector (x)
#' @param x Numeric vector to be formatted
#' @param smbl Character (length = 1) providing the prefix symbol e.g. "$"
#' @param signif Numeric (length = 1) indicating the number of significant places to return
#' @param scale Character (length = 1) indicating the highest possible scale for the numbers - "trillions", "billions", "millions", "thousands"/"k", or ""/NULL (hundreds or lower). Fuzzy matching is attempted.
#' @examples
#' human_numbers(c(1000000 , 1500000, 10000000000))
#' human_numbers(c(1.200000e+05, -2.154660e+05, 2.387790e+05, 4.343500e+04 ,5.648675e+12), "$")
#'
#'

### RILEY'S MODIFIED HUMAN_NUMBERS() FUNCTION ####
## (ADDED 'SCALE' ARG & CORRESPONDING FUNCTIONALITY) ##

human_numbers <- function(x = NULL, smbl ="", scale = "m", signif = 1, ...){
    
    humanity <- function(y) {
        s <- switch (scale,
            "t" = 1e12,
            "b" = 1e9,
            "m" = 1e6,
            "k" = 1e3,
            "n" = 1
        )
        if (!is.na(y) & y >= 0) {
            y_is_positive <- ""
        } else {
            y_is_positive <- "-"
        }
        z <- abs(y) / s
        z <- round(z, signif)
        res <- paste0(y_is_positive, smbl,
            format(z, nsmall = signif, ...), toupper(scale))
        return(res)
    }
    sapply(x, humanity)
}



#' Human versions of large currency numbers - extensible via smbl

human_usd   <- function(x){human_numbers(x, smbl = "$", ...)}
human_usd_k <- function(x){human_numbers(x, smbl = "$", scale = "k", ...)}
human_num   <- function(x){human_numbers(x, smbl = "", ...)}
human_num_k   <- function(x){human_numbers(x, smbl = "", scale = "k", ...)}
