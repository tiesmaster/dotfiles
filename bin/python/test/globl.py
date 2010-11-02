#!/usr/bin/env python
# global.py: look at behavoir of global setting and getting variables

import sys

import pdb
def post_mortem(*dummy):
	pdb.print_last()
	pdb.pm()
sys.exc_hook = post_mortem

# --------------------------------------------------------------

integer = 10

def print_integer():
	print integer
	print __name__

def main():
	#print dir(integer)
	globl.integer = 1
	print_integer()

if __name__ == '__main__':
	main()
