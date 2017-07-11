Rpkgs_website <-
    function(Rnote = "This site was created using",
             pkgnote = "and the following _**R**-packages_:",
             footnote = FALSE,
             ...) {
        if (!require(tufte)) {
            stop("The 'tufte' package (https://cran.rstudio.com/web/packages/tufte/index.html) is needed but not installed.")
        }
        getInfo <- function(x) {
            y <- as.character(packageDescription(x, fields = c("Package", "Version", "URL")))
            # names(y) <- c("Package", "Version", "URL")
            return(y)
        }
        vers1 <-
            function(x)
                as.data.frame(strsplit(x, split = "\\."))[1,]
        vers2 <-
            function(x)
                as.data.frame(strsplit(x, split = "\\."))[2,]
        info_r <- getInfo("base")
        r_text <- paste0("[_**R**_ (v ", info_r[2], ")](https://www.r-project.org)")
        pkgs <- (.packages())
        pkg_info <- data.frame(t(sapply(pkgs, getInfo, USE.NAMES = FALSE)), stringsAsFactors = FALSE)
        t1 <-
        t2 <-
        pkg_info <- within(pkg_info, {
            res <- ifelse(X3 == "NA", paste0("**", X1, "**-v", sapply(X2, vers1), ".", sapply(X2, vers2), "."),
                    paste0("[**", X1, "**-v", sapply(X2, vers1), ".", sapply(X2, vers2), ".]", "(", X3, ")"))
            })
        res <- pkg_info[sort(as.character(pkg_info$Package)), "res"]
        if (length(res) > 1) {
            out <- paste(res[1:(length(res) - 1)], collapse = ", ")
            out <- paste0(out, ", & ", tail(res, 1))
        }
        if (footnote) {
            paste0("^[**Note:** ", Rnote, " ", r_text, ", ", pkgnote, " ", out, ".]")
        }
        else {
            paste0("\n\n", tufte::newthought(Rnote), " ", r_text, ", ", pkgnote, "\n\n", out, ".")
            }
        }
#'
