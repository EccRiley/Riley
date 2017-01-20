Rsig <- function(p) { ## "p" = a vector of p-values from a fitted model ##
    stars <- list(
        s1 = "$*$",
        s2 = "$**$",
        s3 = "$***$",
        ns = " "
    )
    p <- ifelse(p > 0.05,
                stars$ns,
                ## else...
                ifelse(
                    p < 0.05 & p > 0.01,
                    stars$s1,
                    ## else...
                    ifelse(p < 0.01 &
                               p > 0.001, stars$s2, stars$s3)
                ))
    sig <- list(s1 = "$*p < 0.05$.", s2 = "$**p < 0.01$.", s3 = "$***p < 0.001$.", ns = "' ' = n.s.")
    return(list(pstars = p, sig.codes = sig))
}
