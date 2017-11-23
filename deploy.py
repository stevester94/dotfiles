#! /usr/bin/python

# list of tuples in form (<path to actual config file>, <name in git repo>)
targets = [
	("~/.vim", "vim"),
	("~/.vimrc", "vimrc"),
	("~/.bashrc", "bashrc"),
	("~/.config/sublime-text-3", "sublime-text-3"),
	("~/.config/terminator", "terminator")    
]


import os

# Make backup dir
os.mkdir("backup")

for target in targets:
	prompt = raw_input("link " + target[1] + "? (y/n)").rstrip()

	if prompt == "y":
		os.rename(target[0], "backup/"+target[1])
	elif prompt == "n":
		print "Skipping " + target[1]
		continue
	else
		print "Invalid input, skipping " + target[1]
		continue
