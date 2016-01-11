import sys
import numpy as np

def main():
	script = sys.argv[0] # script is always the first argument on cmd
	action = sys.argv[1]
	
	#Loop over multiple arguments (no need to specify a number of arguments)
	for filename in sys.argv[2:]:
		print("          ")
		print("File: ", filename)
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
