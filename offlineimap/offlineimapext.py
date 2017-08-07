"""
Things for offlineimap
"""

import os
import subprocess
import sys

def readgpg(acct):
    acct = os.path.basename(acct)
    path = "/home/lepisma/.mailaccounts/{}.gpg".format(acct)
    args = ["gpg", "--use-agent", "--quiet", "--batch", "-d", path]
    try:
        return subprocess.check_output(args).strip().splitlines()
    except subprocess.CalledProcessError:
        return ["", ""]

def mailuser(acct):
    return readgpg(acct)[0]

def mailpass(acct):
    return readgpg(acct)[1]

def prime_gpg_agent():
  ret = False
  i = 1
  while not ret:
    ret = (mailpass("prime") == "prime")
    if i > 2:
      from offlineimap.ui import getglobalui
      sys.stderr.write("Error reading in passwords. Terminating.\n")
      getglobalui().terminate()
    i += 1
  return ret

prime_gpg_agent()
