# Common Image Magick operations

## Convert file from pdf to transparent png

	convert better_DEM_standardised_colours_no_numeric_axis_labels.pdf -background none -flatten better_DEM_standardised_colours_no_numeric_axis_labels_TRANSPARENT.png

## Reduce size of image (pdf to png conversion)

	convert -density 300 a.pdf -resize 25% a.png

## Create movie

See [here](https://www.tjhsst.edu/~dhyatt/supercomp/n401a.html)

Simple example:

	convert -delay 30 -loop 0 *.gif your_animation.gif