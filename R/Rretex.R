Rretex <- function(txt, op = 1) { ## '`op`' = The output format for which
                                        ## the text should be re-decorated
                                        ## before being sent to `pandoc`.
                                        ## Input for `op` can be one of:
                                            ## `1 [DEFAULT] (LaTeX)` or
                                            ## `2 (HTML)` ##
    if (op == 1) {
        TX <- gsub("\\*\\*(.*?)\\*\\*", "\\\\textbf\\{\\1\\}", txt, perl = TRUE)
        TX <- gsub("_(.*?)_", "\\\\textit\\{\\1\\}", TX, perl = TRUE)
        TX <- gsub("\`(.*?)\`", "\\\\texttt\\{\\1\\}", TX, perl = TRUE)
    }
        else {
            TX <- gsub("\\\\textbf\\{(.*?)\\}", "\\*\\*\\1\\*\\*", txt, perl = TRUE)
            TX <- gsub("\\\\textit\\{(.*?)\\}", "_\\1_", TX, perl = TRUE)
            TX <- gsub("\\\\texttt\\{(.*?)\\}", "\`\\1\`", TX, perl = TRUE)
        }
    return(TX)
}
#'
#'
#' ## Examples

txt <- c("**Bold**", "Plain", "_Italic_", "\`Code\`")

TX <- R.regTEX(txt)
TX
sapply(txt, R.regTEX)
sapply(TX, R.regTEX, op = 2)

ht <- c("\\textbf{Bold}", "Plain", "\\textit{Italic}", "\\texttt{Code}")
sapply(ht, R.regTEX, op = 2)

b <- c("**bold**, Donec id elit non mi porta gravida at eget metus. _italic_.", 
		"Morbi leo risus, porta ac consectetur ac, vestibulum at eros.")

a <- c("`Code`", "_**Bold-Italic**_")

df <- data.frame(a = a, b = b)
df.names <- c("_**Bold-Italic Heading**_", "_**`Bold-Italic-Code Heading`**_")

df <- sapply(df, Rretex) %>% data.frame()

knitr::kable(df, format = 'latex', booktabs = TRUE, escape = FALSE, col.names = sapply(df.names, Rretex))

colnames(df) <- df.names
df <- sapply(df, Rretex, op = 2) %>% data.frame()
pander::pandoc.table(df)
