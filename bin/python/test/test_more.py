#!/usr/bin/env python
# pydoc copy

if __name__ == '__main__':
	import sys
	import imp
	import more

	# get the module name
	obj = sys.argv[1]
	import_obj = obj.split('.')[0]

	# load the module
	fp, pathname, desc = imp.find_module(import_obj)
	imp.load_module(import_obj, fp, pathname, desc)

	# get the doc-string and more it
	exec('import %s; text = %s.__doc__' % (import_obj, obj))
	more.more(text)
