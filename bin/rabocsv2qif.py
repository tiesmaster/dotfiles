#!/usr/bin/python

# A script to convert the comma separated data as supplied by the Rabobank (the Netherlands) to QIF file format.
# Based on csv2qif by Baruch Even, which can be downloaded from http://baruch.ev-en.org/proj/gnucash.html.
# Amounts are positive when added to the account, negative when subtracted.
# (C)2004 Jeroen van der Vegt, ajvdvegt (@) 123mail (.) org.

import csv, string

def cleanrow(row):
	newrow = []
	for cell in row:
		cell = string.strip(cell, '\xa0')
		newrow.append(cell)
	return newrow

class CSV2QIF_Base:
	def __init__(self):
		return

	def run(self, filename):
		reader = csv.reader(file(filename))
		writer = file(self.basename() + '.qif', 'w')
		writer.write(self.qif_header())
		writer.write('\n')
		for row in reader:
			qifdata = self.row2qif(cleanrow(row))
			if not qifdata: continue
			writer.write(self.qifdata2str(qifdata))
			writer.write('^\n')
		writer.close()

class Rabobank(CSV2QIF_Base):
	def basename(self):
		return 'Rabobank'
	
	def qif_header(self):
		return '!Type:Bank'

	def row2qif(self, row):
		if len(row) < 11: return None
		return {'D': row[2], 'T': self.creditdebit(row[4], row[3]), 'P': row[6] + ", " + row[10], 'N': row[5]}
		
	def qifdata2str(self, data):
		s = ''
		for key in data.keys():
			if key == 'D':
				date = data[key]
				s = s + key + date[0:4] + '/' + date[4:6] + '/' + date[6:8]
			else:
				s = s + key + data[key]
		
			s = s + '\n'
		return s

# creditdebit returns a single number: a positive value indicate money added, 
# a negative value indicated money spend. A 'D' in the transfertype field indicates 
# that is is debit, 'C' (or actually anything but 'D') indicates credit.
	def creditdebit(self, credit, transfertype):
		if transfertype == 'D':
			return '-' + credit;
		return credit;


if __name__ == '__main__':
	inputfilename = 'mut.txt'
	import sys
	instance = Rabobank()
	instance.run(inputfilename)
	print 'Done'

