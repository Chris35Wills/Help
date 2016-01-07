################################
## Python
## Simple loops and plotting
## Andrew Walker

All data: C:\\Users\\ggwillc\\Desktop\\2016-01-06-bristol-python'
All data: https://github.com/andreww/2016-01-06-bristol-python

##################
If people have python 2 installed:

If you already have anaconda and python 2.7 installed you can add python3 as a new environment with the command conda create -n python3 python=3.4 anaconda. This installs python 3.4 alongside whatever you already have installed. 

In order to switch from python 2.7 to python 3.4 you can then run 'source activate python3'. Anything installed after this point is part of the "python3" environment. 

To drop out of this environemnt and return to your default setup run source deactive. The current environment is local to the particular shell and the command under Windows drops source.
##################

Working with the python notebook:

> ipython notebook
select new and python3
shift and enter to run command
shell commands work (e.g. ls etc.)

#load text using numpy
numpy.loadtxt(fname='data/temperature-01.csv', delimiter=',')

# plot figures inline on notepad
%matplotlib inline
import matplotlib.pyplot as plt
plt.imshow(data)
plt.show()

data[:,0] << first column
data[:,0] << first row

periodic_mean=data.mean(axis=0) # calc mean of array across axis (left to right)
periodic_max=data.max(axis=0) # calc max of array across axis (left to right)
periodic_min=data.min(axis=0) # calc min of array across axis (left to right)
plt.plot(periodic_mean)
plt.plot(periodic_max)
plt.plot(periodic_min)
plt.show()

word='lead'
for letter in word:
	print(letter)

for letter in 'oxygen':
	print(letter)

for letter in range(0,10):
	print(letter)

############
# Loop files

print(5**3)
for i in range(3):
	i*5 
	print(i)

## Reverse a string
## Avoid the list - add onto string - see below for how

rev=''
#rev=[]
string="text"
for i in range(len(string)):
	#rev.append(string[-i-1])
	rev = rev+string[-i-1]
print(rev)
#print(rev[::-1])

##########
# Globbing

import glob
import numpy as np

print(glob.glob('data/temp*.csv'))
files=glob.glob('data/temp*.csv')
print(sorted(files))

%matplotlib inline
import matplotlib.pyplot as plt
import numpy as np

for file in files:
	print("Working on ", file)

	data = np.loadtxt(fname=file, delimiter=',')

	fig=plt.figure(figsize=(10.0, 3.0))

	axis1 = fig.add_subplot(1,4,1)
	axis2 = fig.add_subplot(1,4,2)
	axis3 = fig.add_subplot(1,4,3)
	axis4 = fig.add_subplot(1,4,4)

	axis1.set_ylabel('Mean')
	axis1.plot(data.mean(axis=0))

	axis2.set_ylabel('Max')
	axis2.plot(data.max(axis=0))

	axis3.set_ylabel('Min')
	axis3.plot(data.min(axis=0))

	axis4.set_ylabel('Data')
	axis4.imshow(data)
	
	fig.tight_layout()
	plt.show(fig)
	#plt.clf()

