Rmsmm <- function(x, d = 2, na.rm = TRUE) {
    require(dplyr); require(e1071)
    if (is.null(ncol(x))) {
        if (!is.numeric(x)) stop("x must be numeric.");
        xM <- mean(x, na.rm = na.rm)
        xSD <- sd(x, na.rm = na.rm)
        xMED <- median(x, na.rm = na.rm)
        xSKEW <- skewness(x, na.rm = na.rm)
        xKURT <- kurtosis(x, na.rm = na.rm)
        xMIN <- min(x, na.rm = na.rm)
        xMAX <- max(x, na.rm = na.rm)
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
        xM <- dplyr::summarise_if(x, is.numeric, ~ mean(., na.rm = na.rm))
        xSD <- dplyr::summarise_if(x, is.numeric, ~sd(., na.rm = na.rm))
        xMED <- dplyr::summarise_if(x, is.numeric, ~median(., na.rm = na.rm))
        xSKEW <- dplyr::summarise_if(x, is.numeric, ~skewness(., na.rm = na.rm))
        xKURT <- dplyr::summarise_if(x, is.numeric, ~kurtosis(., na.rm = na.rm))
        xMAX <- dplyr::summarise_if(x, is.numeric, ~max(., na.rm = na.rm))
        xMIN <- dplyr::summarise_if(x, is.numeric, ~min(., na.rm = na.rm))
        xMAX <- dplyr::summarise_if(x, is.numeric, ~max(., na.rm = na.rm))
        xunique <- summarise_if(x, is.numeric, ~length(unique(.)))
        xNA <- dplyr::summarise_if(x, is.numeric, ~Risna(.))
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
    function(x, na.rm = TRUE, currency_symbol = "$", varlabs = paste0("`", names(which(sapply(x, is.numeric))), "`"), 
             varlabs_name = "", kable = TRUE, caption = NULL,
             outnames = c(varlabs_name, "M", "SD", "Median", "Skewness", "Kurtosis",
                          "Min", "Max", "$N_{Unique Values}$", "$N_{Missing}$"), ...) {
        ## '...' = ADD'L ARGS PASSED TO KABLE() (IF KABLE == TRUE) ##
        require(data.table); require(magrittr)
        res <- Rmsmm(x, na.rm = na.rm) %>%
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

Rmsmm2 <- function (x, d = 2, na.rm = TRUE) 
{
    require(dplyr)
    require(e1071)
    if (is.null(ncol(x))) {
        if (!is.numeric(x)) 
            stop("x must be numeric.")
        xM <- mean(x, na.rm = na.rm)
        xSD <- sd(x, na.rm = na.rm)
        xMED <- median(x, na.rm = na.rm)
        xSKEW <- skewness(x, na.rm = na.rm)
        xKURT <- kurtosis(x, na.rm = na.rm)
        xMIN <- min(x, na.rm = na.rm)
        xMAX <- max(x, na.rm = na.rm)
        xunique <- length(unique(x))
        xNA <- sum(is.na(x))
        summ <- data.frame(xM, xSD, xMED, xSKEW, xKURT, xMIN, 
            xMAX, xunique, xNA)
        names(summ) <- c("M", "SD", "Median", "Skewness", "Kurtosis", 
            "Min", "Max", "N_Unique", "NAs")
        summ <- apply(summ, 2, round, digits = d)
        res <- as.data.frame(t(summ))
        return(res)
    }
    else {
        if (all(sapply(x, is.numeric) == FALSE)) 
            stop("No numeric columns in the data.")
        if (is.matrix(x)) {
            x <- as.data.frame(x)
        }
        Risna <- function(x) {
            sum(is.na(x))
        }
        xNrows <- nrow(x)
        xM <- dplyr::summarise_if(x, is.numeric, ~ mean(., na.rm = na.rm))
        xSD <- dplyr::summarise_if(x, is.numeric, ~sd(., na.rm = na.rm))
        xMED <- dplyr::summarise_if(x, is.numeric, ~median(., na.rm = na.rm))
        xSKEW <- dplyr::summarise_if(x, is.numeric, ~skewness(., na.rm = na.rm))
        xKURT <- dplyr::summarise_if(x, is.numeric, ~kurtosis(., na.rm = na.rm))
        xMAX <- dplyr::summarise_if(x, is.numeric, ~max(., na.rm = na.rm))
        xMIN <- dplyr::summarise_if(x, is.numeric, ~min(., na.rm = na.rm))
        xMAX <- dplyr::summarise_if(x, is.numeric, ~max(., na.rm = na.rm))
        xunique <- summarise_if(x, is.numeric, ~length(unique(.)))
        xNA <- dplyr::summarise_if(x, is.numeric, ~Risna(.))
        xNA_pct <- xNA/xNrows
        xunique_pct <- xunique/xNrows
        summ <- rbind(xM, xSD, xMED, xSKEW, xKURT, xMIN, xMAX, 
            xunique, xunique_pct, xNA, xNA_pct, xNrows)
        row.names(summ) <- c("M", "SD", "Median", "Skew", "Kurtosis", 
            "Min", "Max", "N_Unique", "Pct_Unique", "NAs", "Pct_NA", "N_Rows")
        summ <- as.data.frame(t(summ))
        summ <- apply(summ, 2, round, digits = d)
        res <- as.data.frame(summ)
        return(res)
    }
}

Rkable.Rmsmm2 <- function(x, 
    caption = deparse(substitute(x)), na.rm = TRUE, ...) {
    Rkable(
        transform(Rmsmm2(x, na.rm = na.rm), 
            Pct_Unique = Ras.percent(round(100*Pct_Unique, 1), 
            smbl = "%"), 
            Pct_NA = Ras.percent(round(100*Pct_NA, 1), smbl = "%")),
        align = "r", caption = caption, ...)
}


