#' Compute robust standard errors from lm object

Rrse <- function(lmobj) {
    X <- model.matrix(lmobj)
    u2 <- residuals(lmobj)^2
    XDX <- 0
    for (i in 1:nrow(X)) {
        XDX <- XDX + u2[i]*X[i, ] %*%
            t(X[i,])
    }
    XX1 <- solve(t(X) %*% X, tol = 1e-100)
    vcov <- XX1 %*% XDX %*% XX1 ## BREAD x MEAT x BREAD ##
    dfr <- sqrt(nrow(X)) / sqrt(nrow(X) - ncol(X))
    rse <- dfr*sqrt(diag(vcov))
    return(list(X = X, u2 = u2, XDX = XDX, XX1 = XX1, vcov = vcov, dfr = dfr, rse = rse))
}
