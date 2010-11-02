#!/usr/bin/env python
# global.py: look at behavoir of global setting and getting variables


def main():
	a = range(10)
	for i, j in enumerate(a):
		print i
		if i == 0:
			del a[i]
	print a

if __name__ == '__main__':
	main()
