RbiBars <- function(x, g, lbl = c("No", "Yes"), grid = TRUE, horiz = TRUE, ...) { ## x = a dataframe or matrix; g = the grouping variable (supplied as either the column name or the appropriate column's numeric index value (e.g., '`g = "ColA"`' or '`g = 1`')); lbl = group labels ##
    ## multi-plot setup ##
    op <- par("mfrow")
    if (grid) {
        nvar <- dim(x)[2] - 1
        nrow = ceiling(sqrt(nvar))
        ncol <- round(nvar/nrow, 0)
        par(mfrow = c(nrow, ncol))
    }
    p <- x[, -g]; 
    p <- cbind(p, x[, g]) %>% as.data.frame() ## ensure the final column is the grouping var (for the next step) ##
    d <- 1:(ncol(p)-1) ## i.e., "columns in 'p' except the last" ##
    labs <- colnames(p)
    require(psych) ## for "bi.bars()" ##
    for (i in d) {
        bi.bars(p[, g], p[, i], 
                main = paste0(labs[i]), 
                horiz = horiz,
                xlab = if (horiz) {substitute(lbl1 %<-% bold(n[x]) %->% lbl2, 
                                              list(x = labs[i], 
                                                   lbl1 = lbl[1], 
                                                   lbl2 = lbl[2])) 
                } else { NULL },
                ylab = if (!horiz) {substitute(lbl1 %<-% bold(N) %->% lbl2, 
                                               list(lbl1 = lbl[1], 
                                                    lbl2 = lbl[2])) 
                } else { NULL }, 
                ...) 
    }
    par(op)
}

## Test of "`RbiBars()`":
# set.seed(42)
# x <- matrix(c(runif(484), runif(44, min = 1, max = 4)), nrow = 44) %>% round(0)
# colnames(x) <- LETTERS[1:ncol(x)]
# RbiBars(x, g = 12)
# RbiBars(x, g = 12, grid = FALSE)
