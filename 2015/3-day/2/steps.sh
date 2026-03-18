#!/bin/bash

# USAGE: steps NAME 
# where NAME is 'santa' or 'robot'

# initialize at (0,0)
xpos=0
ypos=0

# create history file for positions
touch out/hist.$1.file;
echo "($xpos,$ypos)" >> out/hist.$1.file;

for direct in $(cat out/$1.txt); do
	case $direct in 
		">") xpos=$(( xpos+1 ));;
		"<") xpos=$(( xpos-1 ));;
		"^") ypos=$(( ypos+1 ));;
		"v") ypos=$(( ypos-1 ));;
	esac
	echo "($xpos,$ypos)" >> out/hist.$1.file;
done

# sort -u out/$1/hist.file > out/$1/uniq.file;
# uniq -u out/$1/uniq.file | wc -l;
