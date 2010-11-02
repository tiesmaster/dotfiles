#!/usr/bin/env python

import time
import thread
import threading

def perform_lenghty_process(callback):
	callback.give_final_remarks("Done already", hoi='hoi')
	callback.print_msg("Very first start of lengty process")
	time.sleep(1)
	callback.print_msg("Just starting")
	time.sleep(1)
	callback.print_msg("Not done yet by far")
	time.sleep(1)
	callback.print_msg("Well, getting close")
	time.sleep(1)

def print_msg(msg):
	print msg

class Callback:
	def __init__(self):
		self.handlers = {}
	
	def register_handler(self, handler):
		self.handlers[handler.__name__] = handler
	
	def __getattr__(self, other):
		try:
			return self.handlers[other]
		except KeyError:
			return lambda *x, **y: x # handler are not mandatory

class CallbackThreaded(Callback):
	def __init__(self, callback):
		Callback.__init__(self,callback)
		self.sem = threading.Semaphore(0)
		self.calls = []

	def call(self, *args, **kw):
		self.sem.release()
		self.calls.append((args,kw))

	def process_calls(self):
		while True:
			self.sem.acquire()
			params = self.calls.pop(0)
			Callback.call(self, *params[0], **params[1])

def main():
	#cb = CallbackThreaded(print_msg)
	cb = Callback()
	cb.register_handler(print_msg)
	thread.start_new_thread(perform_lenghty_process, (cb,))
	time.sleep(10)
	#cb.process_calls()

if __name__ == '__main__':
	main()

"""Om code schoon te houden, wil ik 'feedback' in code zo abstract mogelijk
houden, hiervoor moet er een 'algemene' feedback klasse zijn. De essentie
hiervan is dat deze voor allerlei soorten feedback gebruikt kan worden, functies
worden geregistreerd bij een instantie van deze klasse en de /lengthy
processing/ code gaat hier functies van aanroepen voor feedback terug naar de
gebruiker. De meeste functies zullen nauwelijks iets voor stellen en kunnen dus
zo in de oorspronkelijke thread van de code uitgevoerd worden.
	Soms echter wil je dat code in een aparte thread uitgevoerd gaat worden.
Hiermee kom je al gauw in de buurt van een scheduler...

import sheduler
import settings

shedule = sheduler()

#set some settings
settings.cb = Callback() # Callback might be a sheduler aware class
settings.cb = Callback(shedule)
settings.cb.register_handler(put_msg)
# make /lengthy processing/ obj
pi = Processes_image(settings)

shedule.run(pi.process)

shedule.process_events

class PI:
	...
	self.settings.cb.put_msg("Started segmenting")
	...
	self.settings.cb.write_spot_to_disk(self.spots)

class Callback:
	def call(self, *args, **kw):
		self.shedule.shedule(call, *args, **kw)
"""
