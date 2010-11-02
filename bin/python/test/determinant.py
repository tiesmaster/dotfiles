#!/usr/bin/env python

import sys, copy

def minor(a, i, j):
	print 'minor: a = %s, i = %s, j = %s,\t' % (a, i, j),
	#make a deep copy
	#tmp = copy.deepcopy(a)
	x = 0
	tmp = []
	while x != len(a):
		tmp.append(a[x][:])
		x += 1

	#first kill column j
	x = 0
	while x != len(tmp):
			del tmp[x][j]
			x += 1
	#then kill row i
	del tmp[i]
	
	print tmp
	return tmp

def det(a):
	print 'det: a = %s,\t' % (a)
	if len(a) == 2:
		return a[0][0] * a[1][1] - a[1][0] *a[0][1]
	x=0
	D=0
	while x != len(a):
		y = 0
		while y != len(a):
			D += a[x][y] * (-1) ** (x+y) * det(minor(a, x, y))
			y += 1
		x += 1
	return D

if __name__ == '__main__':
	#matrix = [[2,1],[1,3]]
	matrix = [range(1, 4), range(4, 7), range(7, 10)]
	print matrix
	x=0
	while x != 3:
		y = 0
		while y != 3:
			minor(matrix, x, y)
			y += 1
		x += 1
	print det(matrix)
