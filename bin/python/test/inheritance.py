#!/usr/bin/env python

class vehical(object):
	def go(self):
		print str(self), "is going."
		self.crash()
	def crash(self):
		print "vehical is crashing."

class car(vehical):
	def crash(self):
		print "car is crashing."

c = car()
c.go()
c.crash()
