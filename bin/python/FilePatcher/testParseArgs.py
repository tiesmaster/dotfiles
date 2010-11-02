'''
Created on 29 jun 2009

@author: thijs.brobbel
'''
import unittest
from main import ParseArgs
import sys

class ParseArgsTestCase(unittest.TestCase):


    def setUp(self):
        pass


    def tearDown(self):
        pass

    def testNormalCmdLine(self):
        sys.args = [sys.argv[0]] + "-pacc,new-version orca.seproject test.seproject".split()
        (files, patches) = ParseArgs()
        self.assert_(len(files) > 0)
        self.assert_(len(patches) > 0)
        
if __name__ == "__main__":
    #import sys;sys.argv = ['', 'Test.testParseArgs']
    unittest.main()