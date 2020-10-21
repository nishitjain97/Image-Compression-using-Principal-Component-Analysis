plotImage <- function(rasterObjects) {
  if(length(rasterObjects) == 1) {
    par(pty="s")
  }
  
  xlimits <- 0
  ylimits <- ncol(rasterObjects[[1]])
  
  for(i in 1:length(rasterObjects)) {
    xlimits <- xlimits + nrow(rasterObjects[[i]])
    xlimits <- xlimits + 0.5
    
    if(ylimits < ncol(rasterObjects[[i]])) {
      ylimits <- ncol(rasterObjects[[i]])
    }
  }
  
  plot(NA, xlim = c(0, xlimits), ylim = c(0, ylimits), xlab="", ylab="")
  
  xleft <- 0
  ybottom <- 0
  xright <- 0
  ytop <- 0
  
  
  for(i in 1:length(rasterObjects)) {
    if(i == 1) {
      xleft <- 0
      xright <- nrow(rasterObjects[[i]])
    } else {
      xleft <- xleft + nrow(rasterObjects[[i-1]]) + 0.5
      xright <- xright + nrow(rasterObjects[[i]]) + 0.5
    }
    
    ybottom <- 0
    ytop <- ncol(rasterObjects[[i]])
    
    rasterImage(rasterObjects[[i]], xleft, ybottom, xright, ytop)
  }
}
