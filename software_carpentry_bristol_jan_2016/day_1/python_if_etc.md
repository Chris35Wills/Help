################################
## Python
## If statements + functions
## Andrew Walker

All data: C:\\Users\\ggwillc\\Desktop\\2016-01-06-bristol-python'
All data: https://github.com/andreww/2016-01-06-bristol-python
See also: github/help/software_carpentry_bristol/mymodule.py

~~~~~~~~~~~~~~
#If

print(data.max(axis=0)) # prints max of all cells per x location (i.e. max per column)
print(data.max(axis=1)) # prints max of all cells per y location (i.e. max per row)

# Flag problem if min of all columns is 0
if sum(data.min(axis=0))==0.0: 
       print("Possibly a problem")

~~~~~~~~~~~~~~
#Function

def func(a,b):
	"""
	Returns result of a*b
	"""
	c=a*b
	return c

def c_to_k(temp):
	"""
	Converts an input temp in celcius to kelvin
	"""
	temp = temp + 273.15
	return temp

def f_to_c(temp):
	"""
	Converts an input temp in celcius to fahrenheit
	"""

	temp = (temp - 32 )*(5/9)
	return temp

temp_f= -40
print("Temp: %.2f F" %(temp_f))
print("Temp in fahrenheit: %.2f" %(f_to_c(temp_f)))

## function in function
def f_to_k(temp):
	temp = c_to_k(f_to_c(temp))
	return temp

~~~~~~~~~~~~~~

"""
Full program to plot stats on a number of files whilst assessing a few stats per file
Software Carpentry workshop- second python session 
06/01/15
"""
%matplotlib inline 

import numpy as np
import glob
import matplotlib.pyplot as plt
#import mymodule # if available!

files=glob.glob("data/temperature*.csv")

## Functions - remember these could be put into an additional module and imported accordingly

def check_data(data):
	if (data.max(axis=0)[0]==0.0) and (data.max(axis=0)[20]==20.0):
		print("Odd max")
	elif( sum(data.min(axis=0)) == 0.0):
		print("Odd min")
	else:
		print("OK")

def plot_data(data):
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

for file in files:
	print("Working on ", file)

	data = np.loadtxt(fname=file, delimiter=',')

	check_data(data)
	plot_data(data)

	'''If calling from an imported module called mymodule"
	#mymodule.check_data(data)
	#mymodule.plot_data(data)

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## Modules

Add functions to module - rather than per each script (can then import like any other library)
See: github/help/software_carpentry_bristol/mymodule.py
This can then be imported - you may need to specify the path so python knows where to search for it
Put all functions at a location that you can specify on your python path!!

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## Full program using functions and then importing a custom built module

"""
Full program to plot stats on a number of files whilst assessing a few stats per file
Software Carpentry workshop- second python session 
06/01/15
"""
%matplotlib inline 

import numpy as np
import glob
import matplotlib.pyplot as plt
import mymodule # if available (may need to add to path)

files=glob.glob("data/temperature*.csv")

for file in files:
	print("Working on ", file)

	data = np.loadtxt(fname=file, delimiter=',')

	mymodule.check_data(data)
	mymodule.plot_data(data)

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Python objects 
# Create your own object

1. Create a template - the "class"
2. You then create an instance of the class as required
3. Can be commented as anything else
4. Can be stored in modules just like functions

class Student (object):
	
	# called when a new instance of student is created
	# 'self' is a special variable
	def __init__(self, name, mark):
		self.name = name 
		self.mark = mark

	def classification(self):
		if self.mark >= 70.0:
			result = "First"
		elif self.mark >= 60.0:
			result = "2.1"
		elif self.mark >= 50.0:
			result = "2.2"
		else:
			result = "Third"

		return result

-----------------
student_1 = Student("Andrew", 65.0)
student_2 = Student("Alice", 100)

student_1.name
	# prints out "Andrew"
student_1.mark
	# prints out "65.0"
print(student_3.classification())
	# prints out "2.1"