#' ## **`Rcite_r()`**
#'
#' Modified version of `papaja::cite_r()`.
#'
Rcite_r <-
    function(file = NULL, checksrc = FALSE, srcfile = NULL,
    		pkgs = (.packages()),
             prefix = "R-",
             tex = FALSE,
             footnote = TRUE,
             Rnote = "This document was created using",
             pkgnote = "and the following _**R**-packages_:",
             ...) {
        if (tex && !require(tufte)) {
            stop("The 'tufte' package (https://cran.rstudio.com/web/packages/tufte/index.html) is required for LaTeX output")
        }
        r_version <- as.character(packageVersion("base"))
        cite_just_r <-
            paste0("**R** [**v** ", r_version, ", @", prefix, "base]")
        if (is.null(file) || !file_test("-f", file)) {
            if (!is.null(file) || pkgs != "all")
                warning(
                    "File ",
                    file,
                    " not found. Cannot cite additional R-packages. If knitting again does not solve the problem, please check file path."
                )
            return(cite_just_r)
        }
	 if (checksrc && is.null(srcfile)) {
		warning("Cannot check source file: no source file path provided ('srcfile = NULL')")
	 }
	 else if (checksrc && !is.null(srcfile)) {
	 	src <- readLines(srcfile)
		rgx <- "^.*?(\\w+)\\:\\:.*?$"
	 	addpkgs <- grep(rgx, src, perl = TRUE, value = TRUE)
		addpkgs <- gsub(rgx, "\\1", addpkgs, perl = TRUE)
		pkgs <- unique(c(addpkgs, pkgs))
	 }
	 r_bib <- readLines(file)
        cite_keys <-
            r_bib[grepl(paste0("\\@\\w+\\{", prefix), r_bib)]
        cite_keys <- gsub("\\@\\w+\\{", "", cite_keys)
        cite_keys <- gsub("\\,", "", cite_keys)
        bib <- sapply(cite_keys, function(x) {
            y <- list(x)
            names(y) <- gsub(prefix, "", x)
            y
        }, USE.NAMES = FALSE)
        if (length(pkgs) > 1 && pkgs != "all") {
            pkg_citations <- bib[names(bib) %in% pkgs]
        }
        else {
            pkg_citations <- bib[!names(bib) == "base"]
        }
        if (length(pkg_citations) == 0) {
            return(cite_just_r)
        }
        vers1 <-
            function(x)
                as.data.frame(strsplit(as.character(packageVersion(x)), split = "\\."))[1,]
        vers2 <-
            function(x)
                as.data.frame(strsplit(as.character(packageVersion(x)), split = "\\."))[2,]
        pkg_texts <- paste0(
            "_",
            names(pkg_citations),
            "-v",
            sapply(names(pkg_citations), vers1),
            ".",
            sapply(names(pkg_citations), vers2),
            "._ ",
            "[@",
            unlist(pkg_citations),
            "]"
        )
        if (length(pkg_texts) > 1) {
            pkg_info <- paste(pkg_texts[1:(length(pkg_texts) - 1)],
                              collapse = ", ")
            pkg_info <- paste0(pkg_info, ", and ", tail(pkg_texts,
                                                        1))
        }
        else {
            pkg_info <- pkg_texts
        }
        if (footnote) {
            res <-
                paste0(
                    "^[**Note:** ", Rnote, " _**R**-v",
                    r_version,
                    "_ [@",
                    bib$base,
                    "], ", pkgnote,
                    " ",
                    pkg_info,
                    "]"
                )
        }
        else {
            if (tex) {
                res <-
                    paste0(
                        "\n",
                        tufte::newthought(Rnote),
                        " _**R**-v",
                        r_version,
                        "_ [@",
                        bib$base,
                        "], ", pkgnote,
                        "\n\\noindent",
                        pkg_info
                    )
            } else {
                res <-
                    paste0(
                        "\n",
                        tufte::newthought(Rnote),
                        " _**R**-v",
                        r_version,
                        "_ [@",
                        bib$base,
                        "], ", pkgnote,
                        "\n",
                        pkg_info
                    )
            }
        }
        return(res)
    }
#'
