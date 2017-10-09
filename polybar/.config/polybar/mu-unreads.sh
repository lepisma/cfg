#!/usr/bin/bash

# Check for unread count in mu
MU_OUT=$(emacsclient --eval '(s-trim (shell-command-to-string (concat "mu find " (mu4e-unread-bm-query) " | wc -l")))')

if (( ${#MU_OUT} > 0 )); then
    echo $MU_OUT
else
    echo "NA"
fi
