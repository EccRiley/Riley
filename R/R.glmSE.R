#' ## **`R.glmdf()`**
#'
#'
#' A function for restructuring output from "summary.glm()" as a dataframe
#'
x <- summary(lrm)
Rglmdf <- function(x){ ## "x" must be an object of class "summary.glm"...
                            ## ... currently only works for simple logistic
                            ## regression (i.e., only one predictor) ##
    se.cmpn <- x[c("dispersion", "cov.unscaled")]
        ## ^- "cmpn" = "components" abbreviated ##
        ## see "`r names(summary(<SOME GLM OBJECT>))`" ##
    se.a <- se.cmpn[[1]]
    se.b <- se.cmpn[[2]]
    se.ab <- se.a*se.b ## "covmat" ##
    se.c <- diag(se.ab) ## "var.cf" ##
    se.x <- sqrt(se.c) ## "s.err" ##
    z.a <- c(x$coefficients[[1]], x$coefficients[[2]])
    z.x <- z.a / se.x
    p.x <- 2 * pnorm(-abs(z.x))
    x.df <- data.frame(Estimate = c(x$coefficients[[1]],
                                    x$coefficients[[2]]),
                       SE = se.x,
                       Z = z.x,
                       p.value = p.x)
    return(x.df)
}
x.summ <- R.glmdf(x)
