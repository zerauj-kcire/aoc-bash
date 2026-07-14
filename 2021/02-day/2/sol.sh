#!/bin/bash

# [ -d out ] && rm -r out;
# mkdir out;

input="input.txt";
# input="try";

# variables
hpos=0;
depth=0;
aim=0;

# the for statement wheeling every line of the file
max=$(wc -l $input --total=only);
for i in $(seq $max); do
	line=$(head -$i $input | tail -1);
	action=$(echo $line | cut -d" " -f1);
	num=$(echo $line | cut -d" " -f2);
	[ $action == "forward" ] && hpos=$((hpos + num)) && depth=$((depth+aim*num));
	[ $action == "up" ] && aim=$((aim-num));
	[ $action == "down" ] && aim=$((aim+num));
	echo "HPOS: " $hpos " DEPTH: " $depth;
done

echo "RESULT: ";
echo $((hpos*depth)) | numfmt --grouping;
