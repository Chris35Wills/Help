## Quiver plotting in QGIS
===========================

Unlike in Python directly, quiver plots can be made directly in QGIS. Requires an import of the original binary image (DEM) and then the output orientation and spacing binary images (output from Github/Python_scripts/newstart/FT_stepsize_loop_*.py)

The script described below is located:
	~\GitHub\Python_scripts\newstart\GIS_orientation_spacing_plotting\orientation_uv_from_z.py
Outputs are located:
	O:/Documents/CHRIS_Bristol/OTHER_PAPERS/FT_METHOD/

# Process
----------

1. Import binary files to QGIS
2. Orientation raster to point conversion
	>Raster
		>Conversion
			>Translate
				> Export file as ASCII Gridded XYZ
				> Open ASCII in text editor and change first line of file to hold "x y z"
3. Calculate u and v vector components based on the z value in the ASCII - use the script "orientation_uv_from_z.py" (see below for code snippet) - outputs 2 new ascii files (one has inverse u and v values)
4. Open the resultant ASCII files in QGIS using the "Add Delimited Text Layer" option
5. Download the QGIS "Vector Field Renderer" plugin
6. With either of the ASCII files selected, click "Apply vector renderer to current layer"
7. Modify the options in the resultant window to suit - this creates a vector extending from the xy point of each orientation point attribute
8. Repeat with the second ascii file - this allows for the lines to extend from the opposite side of the xy point 


#Tips
-----
- You can get rid of the point when using the vector renderer tool by going to the "Error elipse" tab and changing the base size value to "0.0"

==============================================================
# Code for calculating and writing vector uv value ascii files
==============================================================

{% highlight python %}
from __future__ import division

import pandas as pd
import numpy as np
import math
import sys
import os.path

magnitude=10. # ordinarily, this defines the length of the vector - i.e. its magnitude)
correction = -90.
post=250. # half the stepsize...
corr= str(correction)

path="O:/Documents/CHRIS_Bristol/OTHER_PAPERS/FT_METHOD/DATA/Helheim_hyperspec_222_win_201_step/vectors"
file="orientation_vector_vals.xyz"
f="%s/%s" %(path, file)

print "read in file"

df=pd.read_csv(f, delim_whitespace=True)
x=df['x'].values
y=df['y'].values
z=df['z'].values
z_cor=z+correction

#### write output file
f_out = "%s/orientation_vector_vals_UV.xyz" %(path)
f_out_inverse = "%s/orientation_vector_vals_UV_inverse.xyz" %(path)

out = open(f_out, 'w')
out2 = open(f_out_inverse, 'w')

out.write("x y u v z\n")
out2.write("x y u2 v2 z\n")

## calculate u and v components from corrected z
for i in range(len(x)):
	u = 10*math.sin(np.radians(z_cor[i]))
	v = 10*math.cos(np.radians(z_cor[i]))
	z_uv = (180/math.pi) * np.arctan2(u,v)
	out.write("%f %f %f %f %f\n" %(x[i], y[i], u, v, z[i]))
	out2.write("%f %f %f %f %f\n" %(x[i], y[i], u*-1, v*-1, z[i]))

out.close()
out2.close()

print "U and v components of orientation calculated with a %s correction applied" %(corr)
print "Output: %s" %(f_out)
print "Output (inverse): %s" %(f_out_inverse)
{% endhighlight %}