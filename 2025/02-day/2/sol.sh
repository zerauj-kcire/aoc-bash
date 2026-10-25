#!/bin/bash

[ -d out ] && rm -r out;
mkdir -p out/ranges;
echo "*" > out/.gitignore;

input="input.txt";
# input="try";

cat $input | tr ",-" "\n " > out/newin;

num=$(wc -l out/newin --total=only);

echo "TOTAL LINES: $num";
for i in $(seq $num); do
	seq $(head -$i out/newin | tail -1) > out/ranges/$i;
	grep "^\(\w\+\)\1\+$" out/ranges/$i >> out/result;
	echo $i;
done

gawk '{s+=$1} END {print s}' out/result | numfmt --grouping;
# SOLVED
