Rpretty_plot <- function(x, y = NULL, xaxt = 'n', yaxt = 'n',
                         comma.axis = c("x", "y"), currency.axis = NULL,
                         date.axis = NULL,
                         currency.symbol = "$",
                         date.format.in = NULL,
                         date.format.out = NULL,
                         axis.values.x = if (is.null(y)) pretty(1:length(x)) else pretty(x),
                         axis.values.y = if (is.null(y)) pretty(x) else NULL,
                         ...) {
    plot(x, xaxt = xaxt, yaxt = yaxt, ...)
    # formattable <- c(comma.axis, currency.axis, date.axis)
    # toformat <- which(!is.null(formattable))
    ## FORMAT NUMERIC AXES ##
    axis.pretty.x <- if ("x" %in% comma.axis) scales::comma(axis.values.x) else axis.values.x
    axis.pretty.y <- if ("y" %in% comma.axis) scales::comma(axis.values.y) else axis.values.y
    ## FORMAT CURRENCY AXES ##
    axis.pretty.x <- if ("x" %in% currency.axis) paste0(currency.symbol, axis.pretty.x) else axis.pretty.x
    axis.pretty.y <- if ("y" %in% currency.axis) paste0(currency.symbol, axis.pretty.y) else axis.pretty.y
    ## FORMAT DATE AXES ##
    axis.pretty.x <- if ("x" %in% date.axis) format(as.Date(axis.pretty.x, format = date.format.in), date.format.out) else axis.pretty.x
    axis.pretty.y <- if ("y" %in% date.axis) format(as.Date(axis.pretty.y, format = date.format.in), date.format.out) else axis.pretty.y

    ## ADD AXES ##
    if (xaxt == 'n' & !is.null(axis.values.x)) {
        axis(1, at = axis.values.x, labels = axis.pretty.x)
    }
    if (yaxt == 'n' & !is.null(axis.values.y)) {
        axis(2, at = axis.values.y, labels = axis.pretty.y)
    }
}
