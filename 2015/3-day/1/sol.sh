#!/bin/bash

# create output dir
mkdir -p out/;

# separate input file in lines
sed 's/./&\n/g' input.txt >> out/nlines.txt;

# initialize at (0,0)
xpos=0
ypos=0

# create history file for positions
touch out/hist.file;
echo "($xpos,$ypos)" >> out/hist.file;

for direct in $(cat out/nlines.txt); do
	case $direct in 
		">") xpos=$(( xpos+1 ));;
		"<") xpos=$(( xpos-1 ));;
		"^") ypos=$(( ypos+1 ));;
		"v") ypos=$(( ypos-1 ));;
	esac
	echo "($xpos,$ypos)" >> out/hist.file;
done

sort -u out/hist.file > out/uniq.file;
uniq -u out/uniq.file | wc -l;

