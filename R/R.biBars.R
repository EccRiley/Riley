RbiBars <- function(x, g, lbl = c("No", "Yes"), grid = TRUE, clr = c("#7a8998", "#74006f")) { ## x = a dataframe or matrix; g = the grouping variable (supplied as either the column name or the appropriate column's numeric index value (e.g., '`g = "ColA"`' or '`g = 1`')); lbl = group labels ##
	## multi-plot setup ##
	op <- par(no.readonly = TRUE)
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
	library(psych) ## for "bi.bars()" ##
	for (i in d) {
		bi.bars(p[, g], p[, i], main = paste0(labs[i]), ylab = "Cluster", xlab = substitute(lbl1 %<-% bold(n[x]) %->% lbl2, list(x = labs[i], lbl1 = lbl[1], lbl2 = lbl[2])), color = clr) 
	}
	on.exit(par(op))
}
## Test of "`R.biBars()`":
# set.seed(42)
# x <- matrix(c(runif(484), runif(44, min = 1, max = 4)), nrow = 44) %>% round(0)
# colnames(x) <- LETTERS[1:ncol(x)]
# R.biBars(x, g = 12)
# R.biBars(x, g = 12, grid = FALSE)
