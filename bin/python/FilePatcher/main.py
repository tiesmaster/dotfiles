'''
Created on 29 jun 2009

@author: thijs.brobbel
'''

from optparse import OptionParser

def ParseArgs():
    parser = OptionParser()
    parser.add_option("-p", dest="patches", help="patch(es) to apply to files", nargs=1, action="store")
    
    (options, args) = parser.parse_args()
    
    if len(args) == 0:
        parser.error("to few files given to patch")
    
    if options.patches == None:
        parser.error("-p option: to few patches given")
        
    patches = options.patches.split(',')
    if len(patches) == 0:
        parser.error("-p option: to few patches given")
    
    return args, patches


if __name__ == '__main__':
    
    (files, patches) = ParseArgs()
    print "About to patch files %(files)s with patches %(patches)s" % locals()