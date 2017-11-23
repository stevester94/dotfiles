#! /usr/bin/python

import os
HOME = os.environ["HOME"]
PWD  = os.environ["PWD"] + "/"

# list of tuples in form (<path to actual config file>, <name in git repo>)
targets = [
    (HOME+"/.vim", "vim"),
    (HOME+"/.vimrc", "vimrc"),
    (HOME+"/.bashrc", "bashrc"),
    (HOME+"/.config/sublime-text-3", "sublime-text-3"),
    (HOME+"/.config/terminator", "terminator")    
]



# Make backup dir
try:
    os.mkdir("backups")
except:
    pass

for target in targets:
    prompt = raw_input("link " + target[1] + "? (y/n)").rstrip()

    if prompt == "y":

        # Attempt to backup file
        try: 
            os.rename(target[0], "backups/"+target[1])
        except Exception as e:
            print "An error " + str(e) + " ocurred when backing up " + target[1]
            if raw_input("Continue? (y/n)").rstrip() == "y": pass
            else: exit(1)

        # Attempt to link
        try: 
            os.symlink(PWD+target[1], target[0])
        except Exception as e:
            print "An error " + str(e) + " ocurred when attempting to symlink"

        print "Done linking " + target[1]
        
    elif prompt == "n":
        print "Skipping " + target[1]
        continue
    else:
        print "Invalid input, skipping " + target[1]
        continue
