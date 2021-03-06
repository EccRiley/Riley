## THIS IS A CONVENIENCE WRAPPER FOR 'psych::pairs.panels()', WITH A FEW ADDED OPTIONS FOR BETTER PLOT CUSTOMIZATION ##

## MODIFIED DEFAULTS: 
## scale = TRUE, 
## ellipses = FALSE,
## pch = "."
## stars = TRUE 
## ALSO: WTF ARE 'MAGIC' ASTERICKS ??
## I LIKE TO THINK THIS IS W. REVELLE SHARING A LITTLE SIDE-COMMENTARY 
## ON ACADEMIC PUBLICATIONS' OBSESSION OVER SIGNIFICANCE STARS, MAYBE ? :) ##

Rpairs <- function (x, smooth = TRUE, scale = TRUE, density = TRUE, ellipses = FALSE, 
                    digits = 2, method = "pearson", pch = ".", lm = FALSE, cor = TRUE, 
                    jiggle = FALSE, factor = 2, hist.col = "gray", show.points = TRUE, 
                    rug = TRUE, breaks = "Sturges", cex.cor = 1, wt = NULL, smoother = FALSE, 
                    stars = TRUE, ci = FALSE, alpha = 0.05, 
                    ## ADDED OPTIONS WITH DEFAULTS ARE BELOW ##
                    hist.border = "darkgray", density.col = "black", density.lwd = 1, 
                    col.smooth = pp[18], lwd.smooth = density.lwd, 
                    col.points = adjustcolor("black", alpha.f = .25), bg.points = NULL, 
                    smoother.colramp = colorRampPalette(c("white", blues9)), ...) {
    
    "panel.hist.density" <- function(x, ...) {## ORIGINALLY FROM 'psych::pairs.panels()'
        usr <- par("usr")
        on.exit(par(usr))
        par(usr = c(usr[1], usr[2], 0, 1.5))
        tax <- table(x)
        if (length(tax) < 11) {
            breaks <- as.numeric(names(tax))
            y <- tax/max(tax)
            interbreak <- min(diff(breaks)) * (length(tax) -
                                                   1)/41
            rect(breaks - interbreak, 0, breaks + interbreak,
                 y, col = hist.col, border = hist.border)
        }
        else {
            h <- hist(x, breaks = breaks, plot = FALSE)
            breaks <- h$breaks
            nB <- length(breaks)
            y <- h$counts
            y <- y/max(y)
            rect(breaks[-nB], 0, breaks[-1], y, col = hist.col, border = hist.border)
        }
        if (density) {
            tryd <- try(d <- density(x, na.rm = TRUE, bw = "nrd",
                                     adjust = 1.2), silent = TRUE)
            if (class(tryd) != "try-error") {
                d$y <- d$y/max(d$y)
                lines(d, col = density.col, lwd = density.lwd)
            }
        }
        if (rug)
            rug(x)
    }
    "panel.cor" <- function(x, y, digits = 2, prefix = "", ...) { ## ORIGINALLY FROM 'psych::pairs.panels()'
        usr <- par("usr")
        on.exit(par(usr))
        par(usr = c(0, 1, 0, 1))
        if (is.null(wt)) {
            r <- cor(x, y, use = "pairwise", method = method)
        }
        else {
            r <- cor.wt(data.frame(x, y), w = wt[, c(1:2)])$r[1,
                                                              2]
        }
        txt <- format(c(round(r, digits), 0.123456789), digits = digits)[1]
        txt <- paste(prefix, txt, sep = "")
        if (stars) {
            pval <- psych::r.test(sum(!is.na(x * y)), r)$p
            symp <- symnum(pval, corr = FALSE, cutpoints = c(0,
                                                             0.001, 0.01, 0.05, 1), symbols = c("***", "**",
                                                                                                "*", " "), legend = FALSE)
            txt <- paste0(txt, symp)
        }
        cex <- cex.cor * 0.8/(max(strwidth("0.12***"), strwidth(txt)))
        if (scale) {
            cex1 <- cex * abs(r)
            if (cex1 < 0.25)
                cex1 <- 0.25
            text(0.5, 0.5, txt, cex = cex1)
        }
        else {
            text(0.5, 0.5, txt, cex = cex)
        }
    }
    "panel.smoother" <- function(x, y, pch = par("pch"), #col.smooth = col.smooth,
                                 span = 2/3, iter = 3, ...) {
        xm <- mean(x, na.rm = TRUE)
        ym <- mean(y, na.rm = TRUE)
        xs <- sd(x, na.rm = TRUE)
        ys <- sd(y, na.rm = TRUE)
        r = cor(x, y, use = "pairwise", method = method)
        if (jiggle) {
            x <- jitter(x, factor = factor)
            y <- jitter(y, factor = factor)
        }
        if (smoother) {
            smoothScatter(x, y, add = TRUE, nrpoints = 0, colramp = smoother.colramp)
        }
        else {
            if (show.points)
                points(x, y, pch = pch, col = col.points, bg = bg.points, ...)
        }
        ok <- is.finite(x) & is.finite(y)
        if (any(ok)) {
            if (smooth & ci) {
                lml <- loess(y ~ x, degree = 1, family = "symmetric")
                tempx <- data.frame(x = seq(min(x, na.rm = TRUE),
                                            max(x, na.rm = TRUE), length.out = 47))
                pred <- predict(lml, newdata = tempx, se = TRUE)
                if (ci) {
                    upperci <- pred$fit + confid * pred$se.fit
                    lowerci <- pred$fit - confid * pred$se.fit
                    polygon(c(tempx$x, rev(tempx$x)), c(lowerci,
                                                        rev(upperci)), col = adjustcolor("light grey",
                                                                                         alpha.f = 0.8), border = NA)
                }
                lines(tempx$x, pred$fit, col = col.smooth, lwd = lwd.smooth, ...)
            }
            else {
                if (smooth)
                    lines(stats::lowess(x[ok], y[ok], f = span,
                                        iter = iter), col = col.smooth, lwd = lwd.smooth)
            }
        }
        if (ellipses)
            draw.ellipse(xm, ym, xs, ys, r, #col.smooth = col.smooth, 
                         lwd = lwd.smooth,
                         ...)
    }
    "panel.lm" <- function(x, y, pch = par("pch"), col.lm = col.smooth,
                           ...) {
        ymin <- min(y)
        ymax <- max(y)
        xmin <- min(x)
        xmax <- max(x)
        ylim <- c(min(ymin, xmin), max(ymax, xmax))
        xlim <- ylim
        if (jiggle) {
            x <- jitter(x, factor = factor)
            y <- jitter(y, factor = factor)
        }
        if (smoother) {
            smoothScatter(x, y, add = TRUE, nrpoints = 0)
        }
        else {
            if (show.points) {
                points(x, y, pch = pch, ylim = ylim, xlim = xlim, col = col.points, bg = bg.points,
                       ...)
            }
        }
        ok <- is.finite(x) & is.finite(y)
        if (any(ok)) {
            lml <- lm(y ~ x)
            if (ci) {
                tempx <- data.frame(x = seq(min(x, na.rm = TRUE),
                                            max(x, na.rm = TRUE), length.out = 47))
                pred <- predict.lm(lml, newdata = tempx, se.fit = TRUE)
                upperci <- pred$fit + confid * pred$se.fit
                lowerci <- pred$fit - confid * pred$se.fit
                polygon(c(tempx$x, rev(tempx$x)), c(lowerci,
                                                    rev(upperci)), col = adjustcolor("light grey",
                                                                                     alpha.f = 0.8), border = NA)
            }
            if (ellipses) {
                xm <- mean(x, na.rm = TRUE)
                ym <- mean(y, na.rm = TRUE)
                xs <- sd(x, na.rm = TRUE)
                ys <- sd(y, na.rm = TRUE)
                r = cor(x, y, use = "pairwise", method = method)
                draw.ellipse(xm, ym, xs, ys, r, #col.smooth = col.lm,
                             ...)
            }
            abline(lml, col = col.lm, ...)
        }
    }
    "draw.ellipse" <- function(x = 0, y = 0, xs = 1, ys = 1,
                               r = 0, #col.smooth, 
                               add = TRUE, segments = 51, ...) {
        angles <- (0:segments) * 2 * pi/segments
        unit.circle <- cbind(cos(angles), sin(angles))
        if (!is.na(r)) {
            if (abs(r) > 0)
                theta <- sign(r)/sqrt(2)
            else theta = 1/sqrt(2)
            shape <- diag(c(sqrt(1 + r), sqrt(1 - r))) %*% matrix(c(theta,
                                                                    theta, -theta, theta), ncol = 2, byrow = TRUE)
            ellipse <- unit.circle %*% shape
            ellipse[, 1] <- ellipse[, 1] * xs + x
            ellipse[, 2] <- ellipse[, 2] * ys + y
            if (show.points)
                points(x, y, pch = 19, col = col.smooth, cex = 1.5, ...)
            lines(ellipse, ...)
        }
    }
    "panel.ellipse" <- function(x, y, pch = par("pch"),# col.smooth = col.smooth,
                                ...) {
        segments = 51
        usr <- par("usr")
        on.exit(par(usr))
        par(usr = c(usr[1] - abs(0.05 * usr[1]), usr[2] + abs(0.05 *
                                                                  usr[2]), 0, 1.5))
        xm <- mean(x, na.rm = TRUE)
        ym <- mean(y, na.rm = TRUE)
        xs <- sd(x, na.rm = TRUE)
        ys <- sd(y, na.rm = TRUE)
        r = cor(x, y, use = "pairwise", method = method)
        if (jiggle) {
            x <- jitter(x, factor = factor)
            y <- jitter(y, factor = factor)
        }
        if (smoother) {
            smoothScatter(x, y, add = TRUE, nrpoints = 0, colramp = smoother.colramp)
        }
        else {
            if (show.points) {
                points(x, y, pch = pch, col = col.points, bg = bg.points,  ...)
            }
        }
        angles <- (0:segments) * 2 * pi/segments
        unit.circle <- cbind(cos(angles), sin(angles))
        if (!is.na(r)) {
            if (abs(r) > 0)
                theta <- sign(r)/sqrt(2)
            else theta = 1/sqrt(2)
            shape <- diag(c(sqrt(1 + r), sqrt(1 - r))) %*% matrix(c(theta,
                                                                    theta, -theta, theta), ncol = 2, byrow = TRUE)
            ellipse <- unit.circle %*% shape
            ellipse[, 1] <- ellipse[, 1] * xs + xm
            ellipse[, 2] <- ellipse[, 2] * ys + ym
            points(xm, ym, pch = 19, col = col.smooth, cex = 1.5)
            if (ellipses)
                lines(ellipse, ...)
        }
    }
    old.par <- par(no.readonly = TRUE)
    on.exit(par(old.par))
    if (missing(cex.cor))
        cex.cor <- 1
    for (i in 1:ncol(x)) {
        if (is.character(x[[i]])) {
            x[[i]] <- as.numeric(as.factor(x[[i]]))
            colnames(x)[i] <- paste(colnames(x)[i], "*", sep = "")
        }
    }
    n.obs <- nrow(x)
    confid <- qt(1 - alpha/2, n.obs - 2)
    if (!lm) {
        if (cor) {
            pairs(x, diag.panel = panel.hist.density, upper.panel = panel.cor,
                  lower.panel = panel.smoother, pch = pch, ...)
        }
        else {
            pairs(x, diag.panel = panel.hist.density, upper.panel = panel.smoother,
                  lower.panel = panel.smoother, pch = pch, ...)
        }
    }
    else {
        if (!cor) {
            pairs(x, diag.panel = panel.hist.density, upper.panel = panel.lm,
                  lower.panel = panel.lm, pch = pch, ...)
        }
        else {
            pairs(x, diag.panel = panel.hist.density, upper.panel = panel.cor,
                  lower.panel = panel.lm, pch = pch, ...)
        }
    }
}
