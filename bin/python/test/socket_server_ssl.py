#!/usr/bin/python

import sys
from socket import *

# settings
serverHost = 'localhost'            # servername is localhost
serverPort = 2001                   # use arbitrary port > 1024

# make the connection
s = socket(AF_INET, SOCK_STREAM)    # create a TCP socket
s = ssl(s)
s.connect((serverHost, serverPort)) # connect to server on the port
s.send('Hello world')               # send the data
