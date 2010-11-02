#!/usr/bin/env python
# iter_through_objs.py: illustrates iterating through a list, changing the
# referenced object's

import pdb
import sys

def post_mortem(*dummy):
	pdb.print_last()
	pdb.pm()

sys.exc_hook = post_mortem

class Klasse:
	def __init__(self, m):
		self.m = m
	def set_member(self, m):
		self.m = m
	def get_member(self):
		return self.m

def main():
	objs = [Klasse(0), Klasse(2)]
	print objs
	# this won't kill the object
	for obj in objs:
		print "obj is on index:", objs.index(obj)
		if obj.get_member() == 0: del obj
	print objs
	# but this will change the object
	for obj in objs:
		obj.set_member(1)
	print objs
	for obj in objs:
		print obj.get_member()
	
	# remove all obj's, greater than threshold 5
	objs = [Klasse(i) for i in range(7) + range(10) + range(8)]
	print len(objs)
	for obj in objs:
		print obj.get_member(),
	
	for obj in objs[:]:
		if obj.get_member() > 5:
			objs.pop(objs.index(obj))
	print len(objs)
	for obj in objs:
		print obj.get_member(),

if __name__ == '__main__':
	main()
