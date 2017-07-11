libPathsSub <- function(x, v1 = "3\\.4", v2 = "3.3") {
    gsub(v1, v2, x)
}

lp = .libPaths()
lpNew <- sapply(lp, libPathsSub, USE.NAMES = FALSE)


libPathsAdd <- function(lp = .libPaths(), usenames = FALSE, ...) {
    lpNew <- sapply(lp, libPathsSub, USE.NAMES = usenames, ...)
    lpFull <- c(lp, lpNew)
    return(lpFull)
}