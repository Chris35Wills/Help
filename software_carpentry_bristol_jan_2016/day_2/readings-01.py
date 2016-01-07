import sys
import numpy as np

def main():
	script = sys.argv[0] # script is always the first argument on cmd
	filename = sys.argv[1]
	data = np.loadtxt(fname=filename, delimiter=',')
	for m in data.mean(axis=1):
		print(m)

main()
