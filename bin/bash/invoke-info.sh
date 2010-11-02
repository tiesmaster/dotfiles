#!/bin/bash
#invoke-info: gathers all info about the invocation of a program, by 'hooking' it, info can go to
#stdout (controlled by $INVOKE_INFO_ON_STD or $INVOKE_INFO_LOG_FILE, standard set to invoke-info.log

if [[ -z $INVOKE_INFO_ON_STD ]]
then exec >${INVOKE_INFO_LOG_FILE:-invoke-info.log}
fi

echo invoke: $0 $@
#FIXME: only log stdin, *if* there is any
echo ------------------------------------------
echo 'data from stdin:'
cat -

# -----------------
# vim:textwidth=100
