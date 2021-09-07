Rcite_r2 <-
    function(pkgs = devtools::session_info()$packages$package,
        prefix = "R-",
        tex = FALSE,
        footnote = TRUE,
        Rnote = "This document was created using",
        pkgnote = "and the following _**R**-packages_:",
        ...) {

        r_version <- as.character(packageVersion("base"))
        cite_just_r <-
            paste0("**R** [**v** ", r_version, ", @", prefix, "base]")

        y <- sapply(pkgs,
            function(x) {
                res0 <- toBibtex(citation(x))
                res0[[1]] <- gsub("^(@[A-Za-z]+)\\{,$", paste0("\\1{R-", x, ","), res0[[1]])
                return(res0)
            })

        ycat <- paste0(unlist(y), sep = "\n")

        r_bib <- paste0(ycat, collapse = "")
        r_bib <- gsub("\\}\n@", "\\}\n\n@", r_bib)

        cite_keys <-
            ycat[grepl(paste0("\\@\\w+\\{", prefix), ycat)]
        cite_keys <- gsub("\\@\\w+\\{", "", cite_keys)
        cite_keys <- gsub("\\,", "", cite_keys)
        cite_keys <- gsub("[\r\n]", "", cite_keys)
        bib <- sapply(cite_keys, function(x) {
            y <- list(x)
            names(y) <- gsub(prefix, "", x)
            y
        }, USE.NAMES = FALSE)
        pkg_citations <- bib[names(bib) %in% pkgs]

        vers1 <-
            function(x) {
                as.data.frame(strsplit(as.character(packageVersion(x)), split = "\\."))[1,]
            }
        vers2 <-
            function(x) {
                as.data.frame(strsplit(as.character(packageVersion(x)), split = "\\."))[2,]
            }
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
        } else {
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
        } else {
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
