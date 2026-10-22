#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

input="input.txt";
# input="try";

cut -d" " -f1 $input > out/c1;
cut -d" " -f4 $input > out/c2;

sort out/c2 | uniq -c | cut -c1-5 --complement | sed "s/^ //g" > out/c2-counted;

for num in $(cat out/c1); do
	score=$(grep " $num$" out/c2-counted | cut -d" " -f1);
	echo $((num * score )) >> out/record;
done

gawk '{s+=$1} END {print s}' out/record | numfmt --grouping;

# rm -r out;
# SOLVED
