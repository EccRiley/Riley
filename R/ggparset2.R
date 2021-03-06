ggparset2 <- function (vars = list(), data, weight = NULL, method = "angle",
    alpha = 0.5, width = 0.25, order = 1, ratio = NULL, asp = NULL,
    label = TRUE, label.size = 4, label.face = "bold", label.vjust = 0.5, label.hjust = 0.5,
    text.angle = 90, text.offset = NULL,
    same.level = FALSE, lbl.clr = "black", ...)
{
    require(plyr); require(reshape)
    vars <- unlist(vars)
    k = length(vars)
    if (k < 2)
        message("Error: ggparallel needs at least two variables. Use vars=list('X', 'Y')")
    data$weight <- weight
    if (is.null(weight))
        data$weight <- 1
    if (is.character(weight))
        data$weight <- data[, weight]
    if (is.null(ratio))
        ratio <- nrow(data)/sum(data$weight)
    order <- rep(order, length = length(vars))
    for (i in 1:length(vars)) {
        if (!is.factor(data[, vars[i]]))
            data[, vars[i]] <- factor(data[, vars[i]])
        if (order[i] != 0)
            data[, vars[i]] <- stats::reorder(data[, vars[i]],
                data$weight, function(x) if (order[i] > 0)
                  sum(x)
                else -sum(x))
    }
    llist <- NULL
    for (i in unique(vars)) {
        if (!same.level)
            levels(data[, i]) <- paste(i, levels(data[, i]),
                sep = ":")
        llist <- c(llist, levels(data[, i]))
    }
    if ((method == "hammock"))
        if (is.null(asp))
            asp <- 1
    getRibbons <- function(xid, yid) {
        x <- vars[xid]
        y <- vars[yid]
        xname <- x
        yname <- y
        variable <- NULL
        value <- NULL
        Freq <- NULL
        Nodeset <- NULL
        tangens <- NULL
        dx2 <- NULL
        midx <- NULL
        midy <- NULL
        ypos <- NULL
        varn <- NULL
        ymax <- NULL
        ymin <- NULL
        ymid <- NULL
        xoffset <- NULL
        dfxy <- as.data.frame(stats::xtabs(data$weight ~ data[,
            x] + data[, y]))
        dfxy <- subset(dfxy, Freq > 0)
        names(dfxy)[1:2] <- c(xname, yname)
        idx <- order(dfxy[, x], dfxy[, y], decreasing = TRUE)
        dfxy$X[idx] <- sum(dfxy$Freq[idx]) - cumsum(dfxy$Freq[idx])
        dfxy$X[idx] <- dfxy$X[idx] + dfxy$Freq[idx]
        idx <- order(dfxy[, y], dfxy[, x], decreasing = TRUE)
        dfxy$Y[idx] <- sum(dfxy$Freq[idx]) - cumsum(dfxy$Freq[idx])
        dfxy$Y[idx] <- dfxy$Y[idx] + dfxy$Freq[idx]
        dfxy$id <- 1:nrow(dfxy)
        dfm <- melt(dfxy, measure.var = c("X", "Y"))
        levels(dfm$variable) <- c(x, y)
        dfxy$XX <- dfxy[, xname]
        dfxy$YY <- dfxy[, yname]
        dfm$Nodeset <- dfm[, xname]
        dfm$Nodeset <- factor(dfm$Nodeset, levels = llist)
        dfm$xoffset <- c(width/2, -width/2)[as.numeric(dfm$variable)]
        dfm$xid <- xid - 1
        dfm$yid <- yid
        if (method == "parset") {
            r <- geom_ribbon(aes(x = as.numeric(variable) + xoffset +
                xid, ymin = value - Freq, ymax = value, group = id,
                fill = Nodeset, colour = Nodeset), alpha = alpha,
                data = dfm)
        }
        if (method == "angle") {
            dfm$x <- with(dfm, as.numeric(variable) + xoffset +
                xid)
            dfm <- ddply(dfm, .(id), transform, dx = max(x) -
                min(x), dy = max(value) - min(value))
            dfm$tangens = dfm$dy/dfm$dx
            maxslope <- 1.3 * max(dfm$tangens)
            dfm$newdx <- with(dfm, dy/maxslope)
            dfm2 <- dfm
            dfm2$xoffset <- with(dfm, (abs(xoffset) + (dx - newdx)/2) *
                sign(xoffset))
            dfm2$x <- with(dfm2, as.numeric(variable) + xoffset +
                xid)
            dfm3 <- ddply(dfm2, names(dfm2)[2], transform, dx2 = max(x[which(tangens ==
                max(tangens))]))
            dfm3 <- ddply(dfm3, .(id), transform, shiftx = max(x) -
                dx2)
            dfm3$x <- dfm3$x - dfm3$shiftx
            dfm <- rbind(dfm, dfm3[, -(16:17)])
            r <- geom_ribbon(aes(x = x, ymin = value - Freq,
                ymax = value, group = id, fill = Nodeset, colour = Nodeset),
                alpha = alpha, data = dfm)
        }
        if (method == "adj.angle") {
            dfm$x <- with(dfm, as.numeric(variable) + xoffset +
                xid)
            dfm <- ddply(dfm, .(id), transform, dx = max(x) -
                min(x), dy = max(value) - min(value))
            dfm$tangens = dfm$dy/dfm$dx
            maxslope <- 1.3 * max(dfm$tangens)
            dfm$newdx <- with(dfm, dy/maxslope)
            dfm2 <- dfm
            dfm2$xoffset <- with(dfm, (abs(xoffset) + (dx - newdx)/2) *
                sign(xoffset))
            dfm2$x <- with(dfm2, as.numeric(variable) + xoffset +
                xid)
            dfm3 <- ddply(dfm2, names(dfm2)[2], transform, dx2 = max(x[which(tangens ==
                max(tangens))]))
            dfm3 <- ddply(dfm3, .(id), transform, shiftx = max(x) -
                dx2)
            dfm3$x <- dfm3$x
            dfm <- rbind(dfm, dfm3[, -(16:17)])
            dfm <- transform(dfm, ymin = value - Freq, ymax = value)
            dfm <- transform(dfm, ymid = (ymax + ymin)/2)
            r <- list(geom_line(aes(x = x, y = ymid, group = id,
                colour = Nodeset, fill = Nodeset, size = Freq),
                alpha = alpha, data = dfm), range = c(min(dfm$Freq),
                max(dfm$Freq)))
        }
        if (method == "hammock") {
            maxwidth = ratio/2 * sum(data$weight)
            xtab <- ddply(dfxy, xname, summarise, value = sum(Freq))
            xtab$midx <- with(xtab, cumsum(value) - value/2)
            dfm <- merge(dfm, xtab[, c(xname, "midx")], by = xname)
            ytab <- ddply(dfxy, yname, summarise, value = sum(Freq))
            ytab$midy <- with(ytab, cumsum(value) - value/2)
            dfm <- merge(dfm, ytab[, c(yname, "midy")], by = yname)
            plot.asp <- length(vars)/(1.1 * sum(data$weight)) *
                asp
            dfm$varn <- as.numeric(dfm$variable)
            dfm <- transform(dfm, x = min(varn + xoffset + xid),
                xend = max(varn + xoffset + xid))
            dfm <- ddply(dfm, .(id), transform, tangens = max(midy) -
                min(midx))
            dfm$tangens <- with(dfm, tangens/max(xend - x) *
                plot.asp)
            dfm$width <- with(dfm, Freq/cos(atan(tangens)))
            dfm$width <- with(dfm, width * maxwidth/max(width))
            dfm <- ddply(dfm, .(id), transform, y = c(midx[1],
                midy[1])[varn])
            r <- geom_ribbon(aes(x = as.numeric(variable) + xoffset +
                xid, ymin = y - width, ymax = y + width, group = id,
                fill = Nodeset, colour = Nodeset), alpha = alpha,
                data = dfm)
        }
        r
    }
    variable <- NULL
    Freq <- NULL
    Nodeset <- NULL
    ypos <- NULL
    gr <- list()
    for (i in 1:(length(vars) - 1)) gr[[i]] <- getRibbons(i,
        i + 1)
    if (method == "adj.angle") {
        prange <- c(NA, NA)
        for (i in 1:(length(vars) - 1)) {
            prange <- range(c(prange, gr[[i]][[2]]), na.rm = T)
            gr[[i]] <- gr[[i]][[1]]
        }
        gr[[1]] <- list(gr[[1]], scale_size(guide = "none", range = ratio *
            prange))
    }
    subdata <- data[, c("weight", unlist(vars))]
    for (i in unlist(vars)) subdata[, i] <- as.character(subdata[,
        i])
    dfm <- melt(subdata, id.var = "weight")
    names(dfm)[3] <- "Nodeset"
    dfm$Nodeset <- factor(dfm$Nodeset, levels = llist)
    llabels <- NULL
    if (label) {
        label.stats <- ddply(dfm, .(variable, Nodeset), summarize,
            n = length(weight), weight = sum(weight))
        maxWeight <- sum(label.stats$weight)/length(unique(label.stats$variable))
        label.stats$ypos <- cumsum(label.stats$weight) - (as.numeric(label.stats$variable) -
            1) * maxWeight
        label.stats$ypos <- label.stats$ypos - label.stats$weight/2
        if (is.null(text.offset))
            text.offset <- 0
        label.stats$text.offset <- rep(text.offset, length = nrow(label.stats))
        varnames <- paste(unlist(vars), sep = "|", collapse = "|")
        label.stats$labels <- gsub(sprintf("(%s):(.*)", varnames),
            "\\2", as.character(label.stats$Nodeset))
        llabels <- list(geom_text(aes(x = as.numeric(variable) + 0.01 + text.offset,
                y = ypos - 0.01, label = labels, fontface = label.face), colour = lbl.clr,
                data = label.stats, angle = text.angle, size = label.size, hjust = label.hjust, vjust = label.vjust))
    }
    theme.layer <- NULL
    if (!is.null(asp))
        theme.layer <- theme(aspect.ratio = asp)
    dfm$Nodeset <- factor(dfm$Nodeset, levels = rev(levels(dfm$Nodeset)))
    ggplot() + xlab("") + gr + theme.layer + geom_bar(aes(weight = weight,
        x = variable, fill = Nodeset, colour = Nodeset, ...), width = width,
        data = dfm) + llabels + scale_x_discrete(expand = c(0.1,
        0.1))
}
