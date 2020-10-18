plotImage <- function(rasterObject) {
  par(pty="s")
  plot(NA, xlim=c(0,nrow(rasterObject)),ylim=c(0,ncol(rasterObject)), xlab="", ylab="")
  rasterImage(rasterObject, 0, 0, nrow(rasterObject), ncol(rasterObject))
}
