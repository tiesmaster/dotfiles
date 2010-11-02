#!/usr/bin/env python
# testreadline.py: inspect behavior of readline module

import readline

def read():
	readline.parse_and_bind('tab: complete')
	raw_input()

if __name__ == '__main__':
	read()
