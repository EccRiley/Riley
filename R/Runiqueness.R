Rmissingness <- function(df, lab, ...) {
    data.frame(scales::comma(sapply(df, Risna)),
               paste0(round(100*(sapply(df, Risna)/nrow(df)), 2), "\\%")) %>%
        kable(caption = paste0("Missingness by Column in ", lab, " ($N_{rows}$ total = ",
                               scales::comma(nrow(df)), "; $N_{rows}$ with 0 missingness = ",
                               scales::comma(nrow(na.omit(df))), ")"),
              col.names = c("$N_{rows}$ Missing", "$\\%_{rows}$ Missing"),
              align = "r")
}

Runiqueness <- function(df, lab, ...) {
    data.frame(scales::comma(sapply(df, function(x) length(unique(x)))),
               paste0(round(100*(sapply(df, function(x) length(unique(x)))/nrow(df)), 2), "\\%")) %>%
        kable(caption = paste0("Uniqueness by Column in ", lab, " ($N_{rows}$ total = ",
                               scales::comma(nrow(df)), ")"),
              col.names = c("$N_{UniqueValues}$", "$%_{rows}"),
              align = "r")
}
