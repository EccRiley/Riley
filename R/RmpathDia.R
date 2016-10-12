#' ## **`RmpathDia()`**
#'
#' Extension of the above-defined **`R.pathDia()`** specifically for creating mediation model diagrams. `r tufte::margin_note("\\texttt{'ivars'} and \\texttt{'dvars'} = lists of $lengths 1:n$ containing objects of class 'manifest' or 'latent', respectively. 'dir' is used for the plot's arrows. The remaining argugments in the function definition set various graphical parameters to be passed to \\texttt{par()}.")`
#'
RmpathDia <-
    function(ivars,
             mvars,
             dvars,
             direct = c("east", "west"),
             xlim = c(-0.5, 1.25),
             ylim = c(-0.5, 1.25),
             bg = NA,
             arrcol = mypal[20],
             ptitle = NULL,
             lwd = 1,
             ...) {
        ## save number of independent, mediator, and dependent vars, respectively ##
        ndep <- length(dvars)
        nind <- length(ivars)
        nmed <- length(mvars)
        ## create a 'wall' (i.e., the plotting region in the `{pathdiagram}` framework ##
        wall(
            xlim = xlim,
            ylim = ylim,
            bg = bg,
            xpd = TRUE
        )
        ## draw independent (predictor) var(s) using user-specs in list of manifest() args ##
        for (d in 1:nind) {
            draw(ivars[[d]])
        }
        ## draw mediator var(s) using user-specs in list of manifest() args ##
        for (i in 1:nmed) {
            draw(mvars[[i]])
        }
        ## draw dependent var(s) using specs in list of latent() args ##
        for (d in 1:ndep) {
            draw(dvars[[d]])
            ## arrows from mediator to dep. vars ##
            for (m in 1:nmed) {
                pathdiagram::arrow(
                    from = mvars[[m]],
                    to = dvars[[d]],
                    start = direct[1],
                    end = direct[2],
                    col = arrcol,
                    lwd = lwd,
                    lty = 1
                )
                ## (dashed) arrows from predictor to dep. vars ##
                for (i in 1:nind)
                    pathdiagram::arrow(
                        from = ivars[[i]],
                        to = dvars[[d]],
                        start = direct[1],
                        end = direct[2],
                        col = arrcol,
                        lwd = lwd,
                        lty = 2
                    )
                pathdiagram::arrow(
                    from = ivars[[i]],
                    to = mvars[[m]],
                    start = direct[1],
                    end = direct[2],
                    col = arrcol,
                    lwd = lwd,
                    lty = 1
                )
            }
        }
        ## add title if user specified a title ##
        if (!is.null(ptitle)) {
            title(paste0(ptitle))
        }
    }
#'
