import sys
import numpy as np

def main():
	script = sys.argv[0] # script is always the first argument on cmd
	action = sys.argv[1]
	#Loop over multiple arguments (no need to specify a number of arguments)
	filenames = sys.argv[2:]
	
	# This is required if you do a redirect to call this program (in that case 
	# there will be no second argument) - i.e. where no filenames are entered 
	# at positions argv[2] onwards (see below for how to call - this is the key 
	# section if you want to pipe stuff in)
	if len(filenames) == 0:
		process(sys.stdin, action)

	#This is reached if user specifies as a file for the second variable
	else:
		for f in filenames:
			print("          ")
			print(f)
			values = process(f, action)
			# Could have returned values from process and printed them here 
			# but that would create overhead and take time

def process(filename, action):
	data = np.loadtxt(fname=filename, delimiter=',')

	if action == '--min':
		values = data.min(axis=1)
	elif action == '--mean':
		values = data.mean(axis=1)
	elif action == '--max':
		values = data.max(axis=1)
	else:
		print("Argument not recognised - calculating mean")
		values = data.mean(axis=1)
	
	for m in values:
		print(m)
	

main()

####################################
# With the addition of the if statement to test for the length of filenames, by using 
# std output where there are no files specified allows you to take things that are piped 
# in - unlike for readings-04.py
# This can now be called as such:
#
# head -5 inflammation-01.csv | python readings-05.py --max
# cat inflammation-*.csv | python readings-05.py
#
# or
#
# python readings-05.py --max inflammation-01.csv inflammation-02.csv
####################################