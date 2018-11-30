Rmsmm <- function(x, d = 2) {
    require(dplyr)#, quietly = TRUE, warn.conflicts = FALSE) ## tempted to make totally quiet, but worried this could cause users issues if not aware of dplyr package loading & corresponding potential conflicts ## 
    if (is.null(ncol(x))) {
        if (!is.numeric(x)) stop("x must be numeric.");
        xM <- mean(x, na.rm = TRUE)
        xSD <- sd(x, na.rm = TRUE)
        xMIN <- min(x, na.rm = TRUE)
        xMAX <- max(x, na.rm = TRUE)
        xunique <- length(unique(x))
        xNA <- sum(is.na(x))
        summ <- data.frame(xM, xSD, xMIN, xMAX, xunique, xNA)
        names(summ) <- c("M", "SD", "Min", "Max", "N_Unique", "NAs")
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
        xMIN <- dplyr::summarise_if(x, is.numeric, funs(min(., na.rm = TRUE)))
        xMAX <- dplyr::summarise_if(x, is.numeric, funs(max(., na.rm = TRUE)))
        xunique <- summarise_if(x, is.numeric, funs(length(unique(.))))
        xNA <- dplyr::summarise_if(x, is.numeric, funs(Risna(.)))
        #xNA <- sapply(x, Riley::Risna)
        summ <- rbind(xM, xSD, xMIN, xMAX, xunique, xNA)
        row.names(summ) <- c("M", "SD", "Min", "Max", "N_Unique", "NAs")
        summ <- as.data.frame(t(summ))
        summ <- apply(summ, 2, round, digits = d)
        res <- as.data.frame(summ)
        return(res)
    }
}

#Rmsmm(mtcars)
