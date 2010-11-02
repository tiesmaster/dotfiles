#!/usr/bin/python

import sys
from socket import *

# the settings
myHost = '10.0.0.1'
myPort = 2001

# make the connection
s = socket(AF_INET, SOCK_STREAM)    # create a TCP socket
s.bind((myHost, myPort))            # bind it to the server port
s.listen(1)                         # allow 5 simultaneous

# accept the data and print it
connection, address = s.accept()
while 1:
	data = connection.recv(50)
	if data:
		print 'client %s:%s send: %s' % (address[0], address[1], data)
	else:
		break
