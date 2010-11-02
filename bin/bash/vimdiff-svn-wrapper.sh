#!/bin/bash
# vimdiff-svn-wrapper.sh: wraps the call of "svn diff" to vimdiff, since svn
# fucks it up

#TODO: the following parameter substitution won't work, I tried to get the last
	# two parameters, however, this was harder than expected

#echo ${*[5]}

#this does work, however, you only get the last param
#echo ${!#}

shift 5; vimdiff -f "$@"
