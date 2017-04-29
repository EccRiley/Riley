# A function for determining relative LaTeX fontsizes (based on this SO answer: https://tex.stackexchange.com/a/48212)

Rtexfonts <- function(ns = 11){
    lg <- 1.2*ns
    Lg <- 1.2*lg
    LG <- 1.2*Lg
    hg <- 1.2*LG
    Hg <- 1.2*hg
    HG <- 1.2*Hg
    data.frame(nromalsize = ns,
        large = lg,
        Large = Lg,
        LARGE = LG,
        huge = hg,
        Huge = Hg,
        HUGE = HG
    )
}