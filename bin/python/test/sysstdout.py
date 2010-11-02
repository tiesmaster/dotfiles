#!/usr/bin/env python
# sysstdout.py: test redirecting sys.stdout

import pdb
import sys

def post_mortem(*dummy):
	pdb.print_last()
	pdb.pm()

sys.exc_hook = post_mortem

def main():
	sys.stdout = open('sysstdout.log', 'w')
	print 'hoi'
	# same as:
	# print >>open('sysstdout.log', 'w'), 'hoi'

if __name__ == '__main__':
	main()
