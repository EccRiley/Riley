Rmsmm <- function(x, d = 2) {
    require(dplyr); require(e1071)
    if (is.null(ncol(x))) {
        if (!is.numeric(x)) stop("x must be numeric.");
        xM <- mean(x, na.rm = TRUE)
        xSD <- sd(x, na.rm = TRUE)
        xMED <- median(x, na.rm = TRUE)
        xSKEW <- skewness(x, na.rm = TRUE)
        xKURT <- kurtosis(x, na.rm = TRUE)
        xMIN <- min(x, na.rm = TRUE)
        xMAX <- max(x, na.rm = TRUE)
        xunique <- length(unique(x))
        xNA <- sum(is.na(x))
        summ <- data.frame(xM, xSD, xMED, xSKEW, xKURT, xMIN, xMAX, xunique, xNA)
        names(summ) <- c("M", "SD", "Median", "Skewness", "Kurtosis", "Min", "Max", "N_Unique", "NAs")
        summ <- apply(summ, 2, round, digits = d)
        res <- as.data.frame(t(summ))
        return(res)
    } else {
        if (all(sapply(x, is.numeric) == FALSE)) stop("No numeric columns in the data.");
        if (is.matrix(x)) {
            x <- as.data.frame(x)
        }
        Risna <- function (x){
            sum(is.na(x))
        }
        xM <- dplyr::summarise_if(x, is.numeric, funs(mean(., na.rm = TRUE)))
        xSD <- dplyr::summarise_if(x, is.numeric, funs(sd(., na.rm = TRUE)))
        xMED <- dplyr::summarise_if(x, is.numeric, funs(median(., na.rm = TRUE)))
        xSKEW <- dplyr::summarise_if(x, is.numeric, funs(skewness(., na.rm = TRUE)))
        xKURT <- dplyr::summarise_if(x, is.numeric, funs(kurtosis(., na.rm = TRUE)))
        xMAX <- dplyr::summarise_if(x, is.numeric, funs(max(., na.rm = TRUE)))
        xMIN <- dplyr::summarise_if(x, is.numeric, funs(min(., na.rm = TRUE)))
        xMAX <- dplyr::summarise_if(x, is.numeric, funs(max(., na.rm = TRUE)))
        xunique <- summarise_if(x, is.numeric, funs(length(unique(.))))
        xNA <- dplyr::summarise_if(x, is.numeric, funs(Risna(.)))
        #xNA <- sapply(x, Risna)
        summ <- rbind(xM, xSD, xMED, xSKEW, xKURT, xMIN, xMAX, xunique, xNA)
        row.names(summ) <- c("M", "SD", "Median", "Skew", "Kurtosis", "Min", "Max", "N_Unique", "NAs")
        summ <- as.data.frame(t(summ))
        summ <- apply(summ, 2, round, digits = d)
        res <- as.data.frame(summ)
        return(res)
    }
}

#Rmsmm(mtcars)

Rmsmm.currency <-
    function(x, currency_symbol = "$", varlabs = paste0("`", names(which(sapply(x, is.numeric))), "`"), 
             varlabs_name = "", kable = TRUE, caption = NULL,
             outnames = c(varlabs_name, "M", "SD", "Median", "Skewness", "Kurtosis",
                          "Min", "Max", "$N_{Unique Values}$", "$N_{Missing}$"), ...) {
        ## '...' = ADD'L ARGS PASSED TO KABLE() (IF KABLE == TRUE) ##
        require(data.table); require(magrittr)
        res <- Rmsmm(x) %>%
            as.data.table() %>%
            transform("x" = varlabs,
                      M = ifelse(M < 0, paste0("-", currency_symbol, scales::comma(abs(M))),
                                 paste0(currency_symbol, scales::comma(M))),
                      SD = ifelse(SD < 0, paste0("-", currency_symbol, scales::comma(abs(SD))),
                                  paste0(currency_symbol, scales::comma(SD))),
                      Median = ifelse(Median < 0, paste0("-", currency_symbol, scales::comma(abs(Median))),
                                  paste0(currency_symbol, scales::comma(Median))),
                      Min = ifelse(Min < 0, paste0("-", currency_symbol, scales::comma(abs(Min))),
                                   paste0(currency_symbol, scales::comma(Min))),
                      Max = ifelse(Max < 0, paste0("-", currency_symbol, scales::comma(abs(Max))),
                                   paste0(currency_symbol, scales::comma(Max))),
                      N_Unique = scales::comma(N_Unique),
                      NAs = scales::comma(NAs)) %>%
            setcolorder("x")
        colnames(res) <- outnames
        if (kable) {
            require(knitr)
            print(kable(res, caption = caption, align = c("l", rep("r", 6)), row.names = FALSE, ...))
        } else return(res)
    }
