#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

# input="input.txt";
input="try";

csplit -s $input '/^$/' {*} -f out/x -n 3;
for file in out/*; do
	msum=$(gawk '{s+=$1} END {print s}' $file);
	echo $file $msum >> out/totals;
done

cut -d" " -f2 out/totals | sort -nr | head -3 | gawk '{s+=$1} END {print s}' - | numfmt --grouping;

# rm -r out;
