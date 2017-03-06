knitr::knit_hooks$set(Rrule = function(before, options, envir) {
    if (is_latex_output()) {
        if (before) {
            "\\Rrule\n\n"
        } else {
            "\n\n\\Rerule"
        }
    }
})
