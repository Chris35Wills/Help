# Plotting in IDL
=================

## 3d array
isurface, array 

## 2D array
a=image(array)

## Histogram
hist=histogram(array, LOCATIONS=xbin)
plot_histo=plot(xbin, hist, TITLE='Histogram', XTITLE='Pixel value', YTITLE='Frequency', $
   MAX_VALUE=5e3, AXIS_STYLE=1, COLOR='red')

 ## Scatter
 There is an IDL in-built function but I can;t get this to work so use the coyote approach (see [here](https://www.idlcoyote.com/cg_tips/scatter2d.php))

 ; Create your data
 data_1 = cgDemoData(1)+ RandomU(seed, 101) * 10
 data_2 = cgDemoData(1)+ RandomU(seed, 101) * 20 + 50
 
 ; Simple plot for quick view
 cgScatter2D, data_1, data_2
 
 ; More advanced and better for saving...
 cgWindow, WXSize=500, WYSize=350 ; open a window
 cgScatter2D, data_1, data_2, XTitle='Study Time (minutes)', YTitle='Quiz Grade', /Window ; plot data
 cgControl, Create_PNG='figure_1.png' ; save plot

 ## Display an array ( a bit like imshow in python or matlab)
 
 a=IMAGE(array, RGB_TABLE=1) ; plot array
 c=colorbar(TARGET=a, ORIENTATION=1, TITLE='Distance from land (m)', ) ; add a colorbar (see http://www.exelisvis.com/docs/COLORBAR.html)
 c.BORDER_ON=1 ; add a border to the colorbar
 a.save, path+'Intermediate_output\landdist_matrix.pdf', RESOLUTION=300, /TRANSPARENT ; save the image as a transparent pdf at 300 dpi ([see here](http://www.exelisvis.com/docs/Save_Method.html))