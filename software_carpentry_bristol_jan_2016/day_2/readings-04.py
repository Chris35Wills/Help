import sys
import numpy as np

def main():
	script = sys.argv[0] # script is always the first argument on cmd
	action = sys.argv[1]
	
	#Loop over multiple arguments (no need to specify a number of arguments)
	filenames = sys.argv[2:]

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
