import numpy as np
import glob
import matplotlib.pyplot as plt

"""A couple oif cuntions developed as part of teh Software Carpentry Jan 2016 course for simple data processing and plotting"""

def check_data(data):
	"""	Tells if the input data looks reasonable - based on a very loose check considering if all values are 0 or not (not that robust!!)"""
	
	if (data.max(axis=0)[0]==0.0) and (data.max(axis=0)[20]==20.0):
		print("Odd max")
	elif( sum(data.min(axis=0)) == 0.0):
		print("Odd min")
	else:
		print("OK")

def plot_data(data):
	"""For an input 2d array, plots mean, min and max charts of input data as well as a raster image of the input array."""
	fig = plt.figure(figsize=(10.0, 3.0))
	
	ax1 = fig.add_subplot(1,4,1)	
	ax2 = fig.add_subplot(1,4,2)	
	ax3 = fig.add_subplot(1,4,3)	
	ax4 = fig.add_subplot(1,4,4)	

	ax1.set_ylabel("Mean")
	ax1.plot(data.mean(axis=0))

	ax2.set_ylabel("Max")
	ax2.plot(data.max(axis=0))
	
	ax3.set_ylabel("Min")
	ax3.plot(data.min(axis=0))

	ax4.set_ylabel("array")
	ax4.imshow(data)
	
	fig.tight_layout()
	plt.show(fig)