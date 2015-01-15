import numpy as np
import matplotlib.mlab as ml
from osgeo import gdal
from osgeo import osr
import fiona

'''
How to deal with xyz data in python in 2d and 3d
Covers everything from the basics of reading in 
shapefiles, plotting z over a grid of xy to creating 
shaded relief images with gdal

See here for the original source: 
http://gis.stackexchange.com/questions/116319/plotting-elevation-maps-and-shaded-relief-images-from-latitude-longitude-and-e
'''

# read a shapefile with Fiona
shape = fiona.open('/Users/Shared/Dropbox/rs3D/rs3D.shp')
x,y = zip(*[pt['geometry']['coordinates']  for pt in shape])
z = [pr['properties'][u'elev'] for i in shape]
# transform to numpy arrays
x = np.array(x)
y = np.array(y)
z = np.array(z)

#Generate a regular grid to interpolate the data.

xi = np.linspace(min(x), max(x))
yi = np.linspace(min(y), max(y))
X, Y = np.meshgrid(xi, yi)

#Interpolate the values of z for all points in the rectangular grid with matplotlib griddata

Z = ml.griddata(x, y, z, xi, yi)

#Plot in 3D with matplotlib

from mpl_toolkits.mplot3d.axes3d import *
import matplotlib.pyplot as plt
from matplotlib import cm
fig = plt.figure()
ax = Axes3D(fig)
ax.plot_surface(X, Y, Z, rstride=1, cstride=1, cmap=cm.jet,linewidth=1, antialiased=True)
plt.show()

#Plot in 3D with visvis

import visvis
f = visvis.gca()
m = visvis.grid(xi,yi,Z) 
f.daspect = 1,1,10 # z x 10
# draped colors
m = visvis.surf(xi,yi,Z)
m.colormap = visvis.CM_JET

#Save to GeoTiff file

nrows,ncols = np.shape(Z) 
xres = (xmax-xmin)/ncols
yres = (ymax-ymin)/nrows
geotransform=(xmin,xres,0,ymin,0, yres) 
driver = gdal.GetDriverByName("GTiff")
ds = driver.Create('output.tif', nrows,ncols, 1, gdal.GDT_Float32)
ds.SetGeoTransform(geotransform)
#Establish its coordinate
srs = osr.SpatialReference()    
srs.ImportFromEPSG(your EPSG code) 
ds.SetProjection( srs.ExportToWkt() )
ds.GetRasterBand(1).WriteArray(Z)
ds = None


