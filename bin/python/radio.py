#!/usr/bin/env python

"""radio.py: start's the radio stream given by argv[1], otherwise print the
    list"""

import sys
import os

radio_list = { '3fm': 'mms://livemedia.omroep.nl/radio3-breed',
        'arrow': 'mms://arrowstream.atinet.nl/arrowrock'}

def usage():
    """print usage of this script"""
    print "Usage: radio RADIO_STATION"
    print "RADIO_STATION:"
    for r in radio_list:
        print '\t%s:\t%s' % (r, radio_list[r])

def main():
    if len(sys.argv) == 1:
        usage()
        sys.exit(0)

    station = sys.argv[1]
    if radio_list.has_key(station):
        os.system('mplayer ' + radio_list[station])
    else:
        usage()

if __name__ == '__main__':
    main()

# vim:textwidth=80:tabstop=4:shiftwidth=4:expandtab
