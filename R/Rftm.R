## Rftm(): TOPIC FREQUENCY TABULATION (FOR QUALITATIVE DATA ANALYSIS) ##

Rftm <- function(x1, x2, dnn = NULL, zero.action = NA, zero.quote = FALSE,
                 names.out = c(paste0("Tabulation of ",
                                      deparse(substitute(x1))),
                               paste0("Cross-Tabulation of ",
                                      deparse(substitute(x1)), " & ",
                                      deparse(substitute(x2))))) {
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
        if (zero.quote == 1) {
            ftm <- ifelse(ftm == 0, quote(zero.action), ftm)
        } else {
            ftm <- ifelse(ftm == 0, noquote(zero.action), ftm)
        }
    }
    y <- list(tx, ftm)
    names(y) <- names.out
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
