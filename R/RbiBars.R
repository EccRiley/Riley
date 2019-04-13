## REQUIRES [PSYCH](https://personality-project.org/r/psych) PACKAGE ##
## x = a dataframe or matrix; g = the grouping variable (supplied as either the column name or the appropriate column's numeric index value (e.g., '`g = "ColA"`' or '`g = 1`')); lbl = group labels ##

RbiBars <- function(x, g, lbl = c("No", "Yes"),
                    width = ceiling(sqrt(ncol(x))),
                    height = ceiling(ncol(x)/width),
                    horiz = TRUE, plotTitle = NULL,
                    outerTitle = TRUE, labs = colnames(x), ...) {
    ## multi-plot setup ##
    op <- par(mfrow = c(height, width))
    if (length(lbl) != 2) stop("lbl argument must be a vector of length 2")
    p <- x[, -g];
    p <- cbind(p, x[, g]) %>% as.data.frame() ## ensure the final column is the grouping var (for the next step) ##
    d <- 1:(ncol(p)-1) ## i.e., "columns in 'p' except the last" ##
    require(psych) ## for "bi.bars()" ##
    if (length(labs) < ncol(x)) {
        labs <- rep(labs, length.out = ncol(x))
    }
    for (i in d) {
        bi.bars(p[, g], p[, i],
                main = paste0(labs[i]),
                horiz = horiz,
                xlab = if (horiz) {substitute(lbl1 %<-% bold(n[x]) %->% lbl2,
                                              list(x = labs[i],
                                                   lbl1 = lbl[[1]],
                                                   lbl2 = lbl[[2]]))
                } else { NULL },
                ylab = if (!horiz) {substitute(lbl1 %<-% bold(N) %->% lbl2,
                                               list(lbl1 = lbl[1],
                                                    lbl2 = lbl[2]))
                } else { NULL },
                ...)
        if (!is.null(plotTitle)) title(plotTitle, outer = outerTitle)
    }
    on.exit(par(op))
}

## Test of "`RbiBars()`":
set.seed(42)
x <- matrix(c(runif(484), runif(44, min = 1, max = 4)), nrow = 44) %>% round(0)
colnames(x) <- LETTERS[1:ncol(x)]
RbiBars(x, g = 12)
RbiBars(x, g = 12, height = 1, width = 1)
RbiBars(x, g = 12, labs = LETTERS[1:3])
RbiBars(x, g = 12, labs = "")
