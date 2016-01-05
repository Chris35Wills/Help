# Python snippets

## Get python version and path info

	import sys
	sys.path 		
	sys.version

## Print std output to file

	# Pre Python 3.x
	f=open("out.txt", "w")
	print >> f, sys.path  
	f.close()

	# Pre and Post Python 3.x
	f=open("out.txt", "w")
	path_list=sys.path
	f.write(str(path_list))
	f.close()