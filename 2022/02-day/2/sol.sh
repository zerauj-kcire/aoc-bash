#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

input="input.txt";
# input="try";

# one should do all the 9 cases:

sed "s/A X/3/;s/A Y/4/;s/A Z/8/;s/B X/1/;s/B Y/5/;s/B Z/9/;s/C X/2/;s/C Y/6/;s/C Z/7/;"\
	$input > out/scores;

gawk '{s+=$1} END {print s}' out/scores | numfmt --grouping;

# rm -r out;
