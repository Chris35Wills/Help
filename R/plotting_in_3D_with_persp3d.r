##################
# 3D plotting of a raster dataset in R
#
# Useful links:
#  https://cran.r-project.org/web/packages/plot3D/vignettes/volcano.pdf
#  http://finzi.psych.upenn.edu/library/plot3D/html/persp3D.html
##################

library(ggplot2)
library(gstat)
library(sp)
library(maptools)
library(raster)
library(scales)
library(reshape2)
library(plot3D)
library(fields)

# Read in raster
ras_in<-"C:/GitHub/synthetic_channels/temp/clipped_bamber_dem/bamber_2013_AOI_6_SPLINE_250m.tif"
post=250
dem<-raster(ras_in)

## Subset to coordinate region
crs(dem)<-"+proj=stere +lat_0=90 +lat_ts=71 +lon_0=-39 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs"

##raster xyz dataframe
dem_xyz<-rasterToPoints(dem)
colnames(dem_xyz)<-c('x','y','z')

##Create xy mesh grid
x_seq<-seq(dem@extent@xmin, dem@extent@xmax-post, post) # extent is from bottom left to bottom right but you only want the coordinate of the bottom left!
y_seq<-seq(dem@extent@ymax, dem@extent@ymin+post, -post)  # extent is from bottom of the bottom cell to the top of the top cell, but you should only go to the bottom of the top cell!

x_mesh<-matrix(x_seq, nrow=dem@nrows, ncol=dem@ncols, byrow=TRUE)
y_mesh<-matrix(y_seq, nrow=dem@nrows, ncol=dem@ncols)

##raster z values as matrix (rather than raster)
zData <-round(as.matrix(dem),1)
xData <-as.matrix(x_mesh)
yData <-as.matrix(y_mesh)

#pdf("O:/Desktop/Github/Bristol_data/Bristol_data/AGU_2015/plots/old_dem_3d/N_coast.pdf")

#x11()
#persp3D(z=zData, x=xData, y=yData, xlab = "\n\n\nlongitude", bty = "g",
#        ylab = "\n\n\nlatitude", zlab = "Elevation", expand = 0.12, d = 2, phi = 25, theta = 15, resfac = 6, shade=0.3,
#        col = jet.col(101), ticktype="detailed", cex.axis=1.2,  cex.title=1.4, colkey = list(side = 2, length = 0.25), clim = c(-1500, 2000))

x11()
persp3D(z=zData, x=xData, y=yData, xlab = "\n\n\nlongitude", bty = "g",
        ylab = "\n\n\nlatitude", zlab = "Elevation", expand = 0.12, d = 2, phi = 25, theta = 15, resfac = 6, shade=0.3,
        col = jet.col(101), ticktype="simple", cex.axis=1.2,  cex.title=1.4, colkey=FALSE, clim = c(-1500, 2000))



      
