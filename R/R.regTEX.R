R.regTEX <- function(txt, op = 1) { ## '`op`' = The output format for which
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

#' `r tufte::newthought("Notes on \`R's\` \`RegEx\` functions \`{pkg:base}\`")`
#' `r margin_note("(see \`?regex\`)")`
#'
#' > "The **backreference** `\N`^[where `N = 1 ... 9`] matches the substring previously matched by the $N^{th}$ parenthesized subexpression of the regular expression.^[This is an extension for extended regular expressions: `POSIX` defines them only for basic ones.]"
#'
#' `R.regTEX()` Legacy Code
# TEXs <- c("\\\\textbf\\{(.*?)\\}", "\\\\textit\\{(.*?)\\}", "\\\\texttt\\{(.*?)\\}")
# HTs <- c("\\*\\*(.*?)\\*\\*", "_(.*?)_", "\`(.*?)\`")
# TXsizes <- c("tiny", "scriptsize", "footnotesize", "small",
#              "normalsize", "large", "Large", "LARGE", "huge", "Huge")
# HTsizes <- c("68\\%", "80\\%", "85\\%", "92\\%",
#              "100\\%", "117\\%", "141\\%", "158\\%", "190\\%", "228\\%")
# TX <- gsub(sprintf("%s", TEXs), sprintf("%s", HTs), txt)
# HT <- gsub(sprintf("[%s | %s | %s]", HTs), sprintf("%s", TEXs), txt)
# HT <- gsub(sprintf("\\\\%s\\{(.*?)\\}", TXsizes), sprintf("<span style=\"fontsize:%s\">\\1</span>", HTsizes), txt, perl = TRUE)

#'
#'
tx <- c("**Bold**", "Plain", "_Italic_", "\`Code\`")
tx
txm <- data.frame(b = runif(4, 0, 1), p = runif(4, 0, 1), i = runif(4, 0, 1), c = runif(4, 0, 1))
kable(txm, col.names = tx)

kable(txm, col.names = tx)

TX <- R.regTEX(tx)
TX
sapply(tx, R.regTEX)
ht <- c("\\textbf{Bold}", "Plain", "\\textit{Italic}", "\\texttt{Code}")
sapply(ht, R.regTEX, op = 2)
