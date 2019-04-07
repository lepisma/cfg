#!/usr/bin/bash

# Check for unread count in mu
QUERY=$(emacsclient --eval '(r-mu4e/unread-bm-query)')
MU_OUT=$(eval mu find $QUERY | wc -l 2> /dev/null)

if [[ $MU_OUT == \"mu* ]]; then
    echo "0"
elif [[ $MU_OUT == "" ]]; then
    echo "NA"
else
    echo $MU_OUT
fi
