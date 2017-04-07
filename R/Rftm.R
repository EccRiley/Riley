Rftm <- function(x1, x2, dnn = NULL, zero.action = NA, zero.qt = FALSE) {
    if (!is.null(dnn)) {
        tx <- Rtdf(x1, names = dnn[[1]])
        ftm <- ftable(x1, x2, row.vars = 1) %>% matrix(nrow = nrow(tx), byrow = FALSE)
        dimnames(ftm) <- list(levels(x1), dnn[[2]])
    } else {
        tx <- Rtdf(x1)
        ftm <- ftable(x1, x2, row.vars = 1) %>% matrix(nrow = nrow(tx), byrow = FALSE)
        dimnames(ftm) <- list(levels(x1))
    }
    if (!is.null(zero.action)) {
        if (zero.qt == 0 | zero.qt == 1) {
            zero.qt <- as.logical(zero.qt)
        } else {
            if (!is.logical(zero.qt)) {
                stop("'zero.qt' must be either logical ('TRUE'/'FALSE') or interpretable as logical ('0'/'1'")
            }
        }
        if (zero.qt == TRUE) {
            ftm <- ifelse(ftm == 0, quote(zero.action), ftm)
        } else {
            ftm <- ifelse(ftm == 0, noquote(zero.action), ftm)
        }
    }
    y <- list(tx, ftm)
    names(y) <- c(paste0("Tabulation of ", deparse(substitute(x1))), paste0("Cross-Tabulation of ",
        deparse(substitute(x1)), " & ", deparse(substitute(x2))))
    return(y)
}


# EXAMPLE USAGE ---------------------------------------------------------------
#
# Topic_Codes <- ctbl.m[ctbl.m$cat == "TOPIC", "code"] %>% droplevels()
# tc.dnn <- c("Topic", "$N_{Articles}$")
#
# Search_Categories <- ctbl.m[ctbl.m$cat == "TOPIC", "scat"] %>% droplevels()
# sc.dnn <- c("IPV Interventions", "LGBTQ-IPV Research")
#
# top <- Rftm(Topic_Codes, Search_Categories, dnn = list(tc.dnn, sc.dnn))
# t.top <- top[[1]]
# ftm.top <- top[[2]]
