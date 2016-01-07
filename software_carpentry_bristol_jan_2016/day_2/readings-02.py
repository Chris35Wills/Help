import sys
import numpy as np

def main():
	script = sys.argv[0] # script is always the first argument on cmd
	
	#Loop over multiple arguments (no need to specify a number of arguments)
	for filename in sys.argv[1:]:
		print("          ")
		print("File: ", filename)
		data = np.loadtxt(fname=filename, delimiter=',')
		for m in data.mean(axis=1):
			print(m)

main()
