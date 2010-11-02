#!/usr/bin/python
# Very simple converter from PostBank mijn.postbank.nl .csv files to 
# QIF files for use by (among others) gnucash.
#
# Written by Jelmer Vernooij <jelmer@samba.org>, 2007

import csv, sys

rows = csv.reader(sys.stdin)

header = rows.next()

assert header == ['Datum', 'Naam / Omschrijving', 'Rekening', 'Tegenrekening', 'Code', 'Af Bij', 'Bedrag (EUR)', 'MutatieSoort', 'Mededelingen']

print '!Type:Bank\n'

for l in rows:
    if "-" in l[0]:
        p = l[0].split("-")
        print "D%s/%s/%s" % (p[1], p[0], p[2])
    else:
        print 'D%s/%s/%s' % (l[0][4:6], l[0][6:8], l[0][0:4]) # date
    if l[5] == 'Bij':
        print 'T%s' % l[6] # amount
    elif l[5] == 'Af':
        print 'T-%s' % l[6] # amount
    else:
        raise Error("Unknown field value '%s'" % l[5])
    print 'P%s / %s' % (l[1], l[8]) # payee / description
    print 'M%s' % l[8] # comment
    print 'L%s' % l[7]
    print '^\n' # end transaction
