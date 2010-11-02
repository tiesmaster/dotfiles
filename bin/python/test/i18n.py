#!/usr/bin/env python
# iter_through_objs.py: illustrates iterating through a list, changing the
# referenced object's

import pdb
import sys

def post_mortem(*dummy):
	pdb.print_last()
	pdb.pm()

sys.exc_hook = post_mortem

import gettext

def main():
	filename = 'mylog.txt'
	message = _('writing a log message')
	fp = open(filename, 'w')
	fp.write(message)
	fp.close()

if __name__ == '__main__':
	main()
