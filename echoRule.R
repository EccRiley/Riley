knitr::opts_hooks$set(echoRule = function(options) {
    if (options$echo == FALSE) {
        options$Rrule = NULL
    } else {
        options$Rrule = TRUE
    }
    options
})
