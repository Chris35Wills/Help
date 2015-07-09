# Plotting in IDL
=================

## 3d array

		> isurface, array 

## 2D array

		> a=image(array)

## Histogram

		>hist=histogram(array, LOCATIONS=xbin)

		>plot_histo=plot(xbin, hist, TITLE='Histogram', XTITLE='Pixel value', YTITLE='Frequency', $
   
 		MAX_VALUE=5e3, AXIS_STYLE=1, COLOR='red')

## Scatter

There is an IDL in-built function but I can;t get this to work so use the coyote approach (see [here](https://www.idlcoyote.com/cg_tips/scatter2d.php))

; Create your data

		> data_1 = cgDemoData(1)+ RandomU(seed, 101) * 10

		> data_2 = cgDemoData(1)+ RandomU(seed, 101) * 20 + 50

; Simple plot for quick view

		> cgScatter2D, data_1, data_2

; More advanced and better for saving...

		> cgWindow, WXSize=500, WYSize=350 ; open a window

		> cgScatter2D, data_1, data_2, XTitle='Study Time (minutes)', YTitle='Quiz Grade', /Window ; plot data

		> cgControl, Create_PNG='figure_1.png' ; save plot

## Display an array ( a bit like imshow in python or matlab)

		> a=IMAGE(array, RGB_TABLE=1) ; plot array

		> c=colorbar(TARGET=a, ORIENTATION=1, TITLE='Distance from land (m)', ) ; add a colorbar (see http://www.exelisvis.com/docs/COLORBAR.html)

		> c.BORDER_ON=1 ; add a border to the colorbar

		> a.save, path+'Intermediate_output\landdist_matrix.pdf', RESOLUTION=300, /TRANSPARENT ; save the image as a transparent pdf at 300 dpi ([see here](http://www.exelisvis.com/docs/Save_Method.html))

## Create an eps image, creating axis, adding xyz points and adding a colorbar

		> openps, path+'Intermediate_output\quasi_regular_grid_25km_edited_colorbar', 15., 25. ; opens up an eps object (Ruud's function)

		> plot, indgen(1501)*1e3-800e3, $

		indgen(2801)*1e3-3400e3, /nodata, $

		position=[.05,.05,.85,.85], $

		color=0, xrange=[-800e3,700e3],yrange=[-3400e3,-600e3] ; creates the plot dimensions and location        

		> setct, 33 ;sets out the colortable (Ruud's function)    

		> coloplot, ndata(0,*), $

		ndata(1,*), $

		ndata(2,*), $

		psym=3, $

		symsize=0.2, $

		top=255, $

		zrange=[-1000,1500] $; creates a plot of the data in question (ndata is a 3 column array of xyz)

		> cgLoadCT, 33 ; load a colortable (coyote library)

		cgColorBar, Divisions=10, Format='(F6.0)', Range=[min(data(2,*)), max(data(2,*))], /Vertical, Tlocation='Right', Title='Bed elevation (m)', Position=[0.97, 0.1, 0.99, 0.8] ; create a colar bar (coyote library*)
		
		closeps ; closes the eps object (Ruud's function)

### More info on the coyote colorbar:

[https://www.idlcoyote.com/idldoc/cg/cgcolorbar.html#cgColorbar:k:FIT](https://www.idlcoyote.com/idldoc/cg/cgcolorbar.html#cgColorbar:k:FIT])

[http://www.idlcoyote.com/color_tips/colorbar.html](http://www.idlcoyote.com/color_tips/colorbar.html)

[http://www.idlcoyote.com/gallery/polar_wind_plot.pro](http://www.idlcoyote.com/gallery/polar_wind_plot.pro) (as used for http://www.idlcoyote.com/gallery/polar_wind_plot.png)

### More info on positioning using the POSITION keyword

[http://www.idlcoyote.com/tips/position_plots.html](http://www.idlcoyote.com/tips/position_plots.html)