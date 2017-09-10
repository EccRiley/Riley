Radd_footnote <- function (input, label = NULL, notation = "alphabet", threeparttable = FALSE)
{
    require(stringr) ## RMSH ADDED [2017-09-10] ##
    if (is.null(label))
        return(input)
    if (notation == "alphabet") {
        notation <- getOption("kable_footnote_notation", "alphabet")
    }
    if (!threeparttable) {
        threeparttable <- getOption("kable_footnote_threeparttable",
            FALSE)
    }
    notation <- match.arg(notation, c("alphabet", "number", "symbol"))
    if (notation == "symbol") {
        notation <- paste0(notation, ".", attr(input, "format"))
    }
    table_info <- NULL
    ids.ops <- read.csv(system.file("symbol_index.csv", package = "kableExtra"))
    ids <- ids.ops[, notation]
    ids.intable <- gsub("\\*", "\\\\*", ids)
    count.label <- length(label)
    count.intablenote <- sum(str_count(input, "\\[note\\]"))
    if (count.intablenote != 0 & count.label != count.intablenote) {
        warning(paste("You entered", count.label, "labels but you put",
            count.intablenote, "[note] in your table."))
    }
    export <- input
    extra.notation <- unique(as.numeric(str_extract(str_extract_all(paste0(export,
        collapse = ""), "\\[note[0-9]{1,2}\\]")[[1]], "[0-9]{1,2}")))
    if (!attr(input, "format") %in% c("html", "latex")) {
        if (count.intablenote != 0) {
            for (i in 1:count.intablenote) {
                replace_note <- paste0("^", ids.intable[i], "^",
                  paste0(rep(" ", 4 - ceiling(i/5)), collapse = ""))
                export[which(str_detect(export, "\\[note\\]"))[1]] <- sub("\\[note\\]",
                  replace_note, export[which(str_detect(export,
                    "\\[note\\]"))[1]])
            }
        }
        for (i in extra.notation) {
            export <- gsub(paste0("\\[note", i, "\\]"), paste0("^",
                ids.intable[i], "^", paste0(rep(" ", 4 - ceiling(i/5)),
                  collapse = "")), export)
        }
        export[length(export) + 1] <- ""
        # export[length(export) + 1] <- "_Note:_"## RMSH COMMENTED-OUT [2017-09-10] ##
        export[length(export) + 1] <- paste0(paste0("^", ids[1:length(label)],
            "^ ", label), collapse = " ")
    }
    if (attr(input, "format") == "latex") {
        label <- escape_latex(label)
        label <- gsub("\\\\", "\\\\\\\\", label)
        table_info <- magic_mirror(input)
        if (table_info$tabular == "longtable") {
            if (notation != "number") {
                warning("Notation is set to 'number' and other formats are not supported.")
                notation <- "number"
            }
            if (threeparttable == T) {
                warning("Threeparttable does not support longtable.")
                threeparttable = F
            }
            count.in.caption.note <- 0
            if (!is.na(table_info$caption)) {
                count.in.caption.note <- str_count(table_info$caption,
                  "\\[note\\]")
            }
            if (count.in.caption.note != 0) {
                caption.footnote <- paste0("\\\\addtocounter{footnote}{-",
                  count.in.caption.note, "}")
                for (i in 1:count.in.caption.note) {
                  export <- sub("\\[note\\]", "\\\\protect\\\\footnotemark ",
                    export)
                  caption.footnote <- paste0(caption.footnote,
                    "\n\\\\stepcounter{footnote}\\\\footnotetext{",
                    label[i], "}")
                }
                if (str_detect(export, "\\\\toprule")) {
                  export <- sub("\\\\toprule", paste0("\\\\toprule\n",
                    caption.footnote), export)
                }
                else {
                  export <- sub("\\\\hline", paste0("\\\\hline\n",
                    caption.footnote), export)
                }
            }
            for (i in (count.in.caption.note + 1):count.intablenote) {
                export <- sub("\\[note\\]", paste0("\\\\footnote[",
                  i, "]{", label[i], "}"), export)
            }
            for (i in extra.notation) {
                export <- gsub(paste0("\\[note", i, "\\]"), paste0("\\\\footnotemark[",
                  i, "]"), export)
            }
        }
        else {
            for (i in 1:count.intablenote) {
                export <- sub("\\[note\\]", paste0("\\\\textsuperscript{",
                  ids.intable[i], "}"), export)
            }
            for (i in extra.notation) {
                export <- gsub(paste0("\\[note", i, "\\]"), paste0("\\\\textsuperscript{",
                  ids.intable[i], "}"), export)
            }
            if (threeparttable == T) {
                usepackage_latex("threeparttable")
                footer <- ""
                for (i in 1:count.label) {
                  footer <- paste0(footer, "\\\\item [", ids[i],
                    "] ", label[i], "\n")
                }
                if (grepl("\\\\caption\\{.*?\\}", export)) {
                  export <- sub("\\\\caption\\{", "\\\\begin{threeparttable}\n\\\\caption{",
                    export)
                }
                else {
                  export <- sub("\\\\begin\\{tabular\\}", "\\\\begin{threeparttable}\n\\\\begin{tabular}",
                    export)
                }
                export <- gsub("\\\\end\\{tabular\\}", paste0("\\\\end{tabular}\n\\\\begin{tablenotes}\n\\\\small\n",
                  footer, "\\\\end{tablenotes}\n\\\\end{threeparttable}"),
                  export)
            }
            else {
                table.width <- max(nchar(str_replace_all(str_replace_all(table_info$contents,
                  "\\[note\\]", ""), "\\[note[0-9]{1,2}\\]",
                  ""))) + 2 * (table_info$ncol - 1)
                footer <- ""
                for (i in 1:count.label) {
                  label.wrap <- strwrap(label[i], table.width)
                  footer <- paste0(footer, "\\\\multicolumn{",
                    table_info$ncol, "}{l}{\\\\textsuperscript{",
                    ids[i], "} ", label.wrap[1], "}\\\\\\\\\n")
                  if (length(label.wrap) > 1) {
                    for (j in 2:length(label.wrap)) {
                      footer <- paste0(footer, "\\\\multicolumn{",
                        table_info$ncol, "}{l}{", label.wrap[j],
                        "}\\\\\\\\\n")
                    }
                  }
                }
                export <- gsub("\\\\end\\{tabular\\}", paste0(footer,
                  "\\\\end{tabular}"), export)
            }
        }
    }
    if (attr(input, "format") == "html") {
        table_info <- magic_mirror(input)
        label <- escape_html(label)
        for (i in 1:count.intablenote) {
            export <- sub("\\[note\\]", paste0("<sup>", ids.intable[i],
                "</sup>"), export)
        }
        for (i in extra.notation) {
            export <- gsub(paste0("\\[note", i, "\\]"), paste0("<sup>",
                ids.intable[i], "</sup>"), export)
        }
        footer <- "<tfoot>\n"
        for (i in 1:count.label) {
            footer <- paste0(footer, "<tr>\n<td style = 'padding: 0; border:0;' ",
                "colspan='100%'><sup>", ids[i], "</sup> ", label[i],
                "</td>\n</tr>\n")
        }
        footer <- paste0(footer, "</tfoot>\n")
        export[1] <- gsub("</tbody>\n", paste0("</tbody>\n",
            footer), export[1])
    }
    attr(export, "original_kable_meta") <- table_info
    return(export)
}
