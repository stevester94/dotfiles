#! /usr/bin/python

import os
import sys

HOME = os.environ["HOME"]
PWD  = os.environ["PWD"] + "/"

# The extension to add on files that already exist when overwriting
BACKUP_EXTENSION = ".bak"

# The file that contains path to targets
FILELIST_PATH = "filelist.txt"

targets = []

# Will automatically expand '~'
def readFilelist():
    global targets
    filelist = open(FILELIST_PATH, "r")

    for line in filelist:
        if line[0] == '#': continue
        targets.append(os.path.expanduser(line.rstrip()))

def link():
    for target in targets:
        filename = target.split("/")[-1]
        print "Linking: " + target

        try:
            os.rename(target, target+BACKUP_EXTENSION)
        except Exception as e:
            print "An error " + str(e) + " ocurred when backing up " + target
            if raw_input("Continue? (y/n): ").rstrip() == "y": pass
            else: exit(1)

        # Attempt to link
        try:
            os.symlink(PWD+filename, target)
        except Exception as e:
            print "An error " + str(e) + " ocurred when attempting to symlink"


def unlink():
    for target in targets:
        filename = target.split("/")[-1]
        print "Unlinking: " + target

        if not os.path.exists(target+BACKUP_EXTENSION):
            print "Target backup does not exist, skipping unlinking"
            continue

        if not os.path.islink(target):
            print "Target is not a symlink, skipping unlinking"
            continue

        os.rename(target+BACKUP_EXTENSION, target)


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print "Need to specify link or unlink"
        exit(0)

    readFilelist()

    if sys.argv[1] ==  "link": link()
    elif sys.argv[1] == "unlink": unlink()
