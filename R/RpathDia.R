#' ## **`RpathDia()`**
#'
#' Function to generate simple path diagrams^[i.e., `IV -> DV` or `IV1 + IV2 + ... IVn -> DV`, but not necessarily `IV -> M -> DV`.] by combining functions from the `{pathdiagram}` package.`r tufte::margin_note("\\texttt{'manifest'} and \\texttt{'latent'} = lists of $lengths 1:n$ containing objects of class 'manifest' or 'latent', respectively, \\texttt{'direct'} is used for the plot's arrows.")`
#'
RpathDia <-
    function(manifest,
             latent,
             direct = c("east", "west"),
             xlim = c(-0.5, 1.25),
             ylim = c(-0.5, 1.25),
             bg = NA,
             arrcol = mypal[20],
             ptitle = NULL,
             lwd = 1.5,
             lty = 2,
             ...) {
        ## save number of latent and manifest vars defined in user's latent var list ##
        nlat <- length(latent)
        nmani <- length(manifest)
        ## create a wall ##
        wall(
            xlim = xlim,
            ylim = ylim,
            bg = bg,
            xpd = TRUE
        )
        ## draw latentvar(s) using user-specs in list of manifest() args ##
        for (l in 1:nlat) {
            draw(latent[[l]])
            for (i in 1:nmani) {
                draw(manifest[[i]])
                ## arrows from manifest to latent vars ##
                pathdiagram::arrow(
                    from = manifest[[i]],
                    to = latent[[l]],
                    start = direct[1],
                    end = direct[2],
                    col = arrcol,
                    lwd = lwd,
                    lty = lty
                )
            }
        }
        ## add title if user specified a title ##
        if (!is.null(ptitle)) {
            title(paste0(ptitle))
        }
    }
#'
