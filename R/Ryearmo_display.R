Ryearmo_display <- function(d, month_style = month.abb, year_style = 4,
    sep = "'", ...) {

    x <- d
    library(lubridate)
        # month.abb[month(seq(.mdf_start_date, .mdf_end_date, by = "months"))]

    x.months <- month_style[month(x)]

    if (year_style == 2) {
        x.years <- substring(as.character(year(x)), 3, 4)
    } else {
        x.years <- year(x)
    }

    res <- paste0(x.months, sep, x.years)

    return(res)
}

#' `x`: Date class object
#' `month_style`: can be one of `month.abb` or `month.name`
#' `year_style`: can be one of `2` or `4` (default = `4`).
#' `...`: Not yet implemented.
