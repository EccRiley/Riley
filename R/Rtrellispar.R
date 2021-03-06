Rtrellispar <- function(...) {
    trellis.lines <- lattice::trellis.par.get("superpose.line")
    trellis.lines$col <- lancet(7)
    trellis.lines$lwd <- rep(2, 7)
    lattice::trellis.par.set("superpose.line", trellis.lines)
    trellis.pts <- lattice::trellis.par.get("superpose.symbol")
    trellis.pts$col <- trellis.lines$col
    trellis.pts$fill <- adjustcolor(trellis.pts$col, alpha.f = 0.25)
    trellis.pts$cex <- 1
    lattice::trellis.par.set("superpose.symbol", trellis.pts)
    trellis.strip <- lattice::trellis.par.get("strip.background")
    trellis.strip$col <- adjustcolor(grays(7), alpha.f = 0.35)
    trellis.mtext <- lattice::trellis.par.get("par.main.text")
    trellis.mtext$cex <- 0.85
    lattice::trellis.par.set("par.main.text", trellis.mtext)
    lattice::trellis.par.set("strip.background", trellis.strip)
    trellis.shingle <- lattice::trellis.par.get("strip.shingle")
    trellis.shingle$col <- adjustcolor("black", alpha.f = 0.65)
    lattice::trellis.par.set("strip.shingle", trellis.shingle)
    trl.plot.polygon <- trellis.par.get("plot.polygon")
    trl.plot.polygon$col <- pp[20]
    trellis.par.set("plot.polygon", trl.plot.polygon)
    trl.box.rect <- trellis.par.get("box.rectangle")
    trl.box.rect$col <- "#000000"
    trellis.par.set("box.rectangle", trl.box.rect)
    trl.umbrella <- trellis.par.get("box.umbrella")
    trl.umbrella$col <- adjustcolor("#000000", alpha.f = 0.95)
    trellis.par.set("box.umbrella", trl.umbrella)
}
