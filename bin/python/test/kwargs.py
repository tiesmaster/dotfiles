#!/usr/bin/env python
# kwargs.py: look at behavoir of keywords, args, and the like

import pdb
import sys

def post_mortem(*dummy):
	pdb.print_last()
	pdb.pm()

sys.exc_hook = post_mortem

integer = 10

def f(a, b, c=None, *args, **keywords):
	print 'a:', a
	print 'b:', b
	print 'c:', c
	for arg in args: print arg
	for key in keywords: print key, ':', keywords[key]

def main():
	f(0, 1)
	f(0, 1, 2)
	f(0, 1, 2, 3)
	f(0, 1, 2, 3, 4)
	f(0, 1, 2, 3, 4, 5)
	# this is not allowed
	#f(0, 1, c=3, 2, 3, 4, 5)
	#f(0, 1, 2, 3, 4, 5, c=6, d=7)
	f(0, 1, 2, 3, 4, 5, d=6, e=7)

if __name__ == '__main__':
	main()
