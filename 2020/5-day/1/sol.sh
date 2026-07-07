#!/bin/bash

input="input.txt";
# input="try";
[ -d out ] && rm -r out;
mkdir -p out/{cols,rows};

cut -c1-7 $input | sed "s/^/ibase=2;1000*/g;s/F/0/g;s/B/1/g" > out/cols/cols;
cut -c8-10 $input | sed "s/^/+/g;s/R/1/g;s/L/0/g;s/$/;obase=10/g" > out/rows/rows;

paste -d" " out/cols/cols out/rows/rows | tr -d " " > out/op;

for line in $(cat out/op); do
	echo "$line" | bc >> out/results;
done
sort -rn out/results | head -1;
