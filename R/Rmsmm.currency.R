Rmsmm.currency <-
    function(x, currency_symbol = "$", vars_lab, kable = TRUE, caption = NULL,
             outnames = c(vars_lab, "M", "SD", "Min", "Max", "$N_{Unique Values}$", "$N_{Missing}$"), ...) {
        ## '...' = ADD'L ARGS PASSED TO KABLE() (IF KABLE == TRUE) ##
        require(data.table); require(magrittr)
        res <- Rmsmm(x) %>%
            as.data.table() %>%
            transform("x" = paste0("`", names(which(sapply(x, is.numeric))), "`"),
                      M = ifelse(M < 0, paste0("-", currency_symbol, scales::comma(abs(M))),
                                 paste0(currency_symbol, scales::comma(M))),
                      SD = ifelse(SD < 0, paste0("-", currency_symbol, scales::comma(abs(SD))),
                                  paste0(currency_symbol, scales::comma(SD))),
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
            print(kable(res, caption = caption, align = c("l", rep("r", 6)), row.names = FALSE))
        } else return(res)
    }
