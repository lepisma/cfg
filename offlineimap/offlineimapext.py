"""
Things for offlineimap
"""

import subprocess

def plist_get(key, plist):
    for i in range(len(plist) // 2):
        if plist[i * 2] == key:
            return plist[1 + (i * 2)]
    return None

def get_authinfo_value(name, key):
    machines = [
        line.decode("utf-8").split(" ")
        for line in subprocess.check_output(["gpg", "--use-agent", "--quiet", "--batch", "-d", "/home/lepisma/.authinfo.gpg"]).strip().splitlines()
    ]
    item = list(filter(lambda x: plist_get("name", x) == name, machines))[0]
    return plist_get(key, item)
