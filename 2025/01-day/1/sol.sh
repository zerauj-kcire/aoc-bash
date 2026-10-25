#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;
echo "*" >> out/.gitignore; # adding this line github doesnt register the dir.

input="input.txt";
# input="try";

sed "s/R/+/;s/L/-/" $input >> out/rotations;

point=50;

for line in $(cat out/rotations); do
	abs=$(echo $line | cut -c1 --complement);
	sign=$(echo $line | cut -c1);
	if [ $sign == "+" ]; then
		point=$(( (point + abs) % 100));
	else
		point=$(( (point - abs) % 100));
	fi;
	echo $point >> out/results;
	echo "done $point";
done

grep "^0$" out/results | wc -l | numfmt --grouping;
# SOLVED
