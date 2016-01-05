# Python snippets

## Get python version and path info

	import sys
	sys.path 		
	sys.version

## Print std output to file

	f=open("out.txt", "w")
	print >> f, sys.path 