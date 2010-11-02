#!/usr/bin/env python
import os

def walk_tree(dir):
	for item in os.listdir(dir):
		file = os.path.join(dir, item)
		if os.path.isdir(file):
			print 'DIR \t' + file
			walk_tree(file)
		else:
			print 'FILE\t' + file

if __name__ == '__main__':
        import sys
	try:
		walk_tree(sys.argv[1])
	except:
		walk_tree(".")
