## requires "lmtest" package ##
Rcoeftest <- function(x) { ## 'x' = a model fit object ##
    require(lmtest)
	x <- lmtest::coeftest(x)
    rn <- dimnames(x)[[1]] ## rownames ##
    cn <- c("Estimate", "_SE_", "_z-value_", "p") ## colnames ##
    summ <-
        matrix(x, nrow = dim(x)[1], dimnames = list(rn, cn)) %>% as.data.frame
    sig <-
        list(
            s1 = "$*p < 0.05$.",
            s2 = "$**p < 0.01$.",
            s3 = "$***p < 0.001$.",
            ns = "' ' = n.s."
        )
    R.sig <- function(p) {
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
        return(p)
    }
    summ$s <- sapply(summ$p, R.sig)
    return(list(coef.summ = summ, sig.codes = sig))
}
