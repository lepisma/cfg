#!/usr/bin/bash

# Check for unread count in mu
MU_OUT=$(emacsclient --eval '(s-trim (shell-command-to-string (concat "mu find " (rogue-mu4e-unread-bm-query) " | wc -l")))')

if [[ $MU_OUT == \"mu* ]]; then
    echo "0"
else
    echo $MU_OUT
fi
