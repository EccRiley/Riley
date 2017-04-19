#' # `Rbinomt()`
#'
#' ## A convenience function for the binomial test.
#'
#' Combines the `prop.test()` & `binom.test()` functions (`{pkg:stats}`) because I think it's kind of ridiculous that there is not already a combined function for these. I also don't particularly enjoy the default output format for either of these functions, so I'm breaking the [function writing rule of simplicity (AKA: _"Curly's Law"_)](https://blog.codinghorror.com/curlys-law-do-one-thing/) and implementing some formatting tasks within the function as well.
#'
#' ## Arguments
#'
#' `x`. Either a 1-x-n (i.e., one-dimensional vector of "n" counts) or a `1-x-2` or `2-x-1` `table` or `matrix` containing the counts for two groups (e.g., successes vs. failures, yes vs. no, monkeys vs. pandas, etc.). See \link{prop.table()} and \link{binom.test()} in the stats package for more information basic bivariate comparisons in `R`.
#'
#' `p`.
#' :   The target proportion to be tested against the null hypothesis ($H_{0}$; $\pi_{0}$; see `pi0` below). _Synonymous Arguments:_ `x` in `prop.test()` \& `binom.test()`.
#'
#' `N`.
#' :   The size of the sample from which $`p`$ is taken. _Synonymous Arguments:_ `n` in `prop.test()` \& `binom.test()`. _Synonymous Arguments:_ `n` in `prop.test()` \& `binom.test()`. Defaults to the sum of `x`.
#'
#' `pi0`.
#' :   [Default = `0.5`]. A vector of probabilities of success corresponding to the value(s) in `p`. These probabilities represent the null hypothesis value ($H_{0}$; $\pi_{0}$) against which `p` is to be tested. _Synonymous Arguments:_ `p` \& `conf.level` (inverse) in `prop.test()` \& `binom.test()`.
#'
#' `exact`.
#' :   Logical [Default = `FALSE`]. Should the the hypothesis be tested using an [exact binomial test (i.e., `binom.test()`)](https://stat.ethz.ch/R-manual/R-patched/library/stats/html/binom.test.html). If `FALSE` (the default), a test of equal or given proportions, depending on the lengths of `p` and `pi0` is conducted using [`prop.test()`](https://stat.ethz.ch/R-manual/R-patched/library/stats/html/prop.test.html)
#'
#' `correct`.
#' :   Logical Default = `FALSE`]. Synonymous with the `correct` argument in `prop.test()`.
#'
#' `digits`.
#' :   [Default = `2`]. Number of digits to use when rounding (`round()`) the final output values (does not influence the test calculation).
#'
#' `...`.
#' :   Additional arguments to be passed to either `prop.test()` or `binom.test()`, depending on the value set for `exact` (e.g., `alternative`).
#'
#' _Value (`R.binomTest()`):_ Returns a `data.frame` object containing the values returned by either `prop.test()` or `binom.test()`, depending on the value set for `exact`.
#'


Rbinom <- function(p, N = sum(x), pi0 = 0.5, exact = FALSE, correct = FALSE,
                         digits = 2, ...){
    if (exact) { ## Hypothesis Testing
        BT <- stats::binom.test(x = p, n = N, p = pi0, ...)
        }
        else {
            BT <- stats::prop.test(x = p, n = N, p = pi0,
                                   correct = correct, ...)
        }
    ## The rest deals with formatting the output ##
        BT$data.name <- paste0(p, " out of ", N, " null probability ",
                               BT$null.value)
        ## Above, I modified the default output value for *.test$data.name
            ## to print the actual data values, rather than the object
            ## names the values are stored under (see output below) ##
        BTCI <- paste0(round(BT$conf.int[[1]], digits = digits), ", ",
                       round(BT$conf.int[[2]], digits = digits))
        BT$p.value <- round(BT$p.value, digits = 7)
        BT.df <- data.frame(c(BT[c("alternative",
                                   "null.value",
                                   "parameter",
                                   "estimate",
                                   "statistic",
                                   "p.value")],
                              BTCI))
        row.names(BT.df) <- NULL
        return(BT.df)
}
