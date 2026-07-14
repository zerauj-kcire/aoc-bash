#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

input="input.txt";
# input="try";
max=$(wc -l $input --total=only);

for i in $(seq 0 $((max-3)) ); do
	echo "$(tail -$((max-i))  $input | head -3 | tr "\n" "+")0" | bc >> out/newin;
done

input="out/newin";
max=$(wc -l $input --total=only);
for i in $(seq 2 $max); do
	diff <(head -$i $input | tail -2) <(head -$i $input | tail -2 | sort -rn) -q >> out/results;
done

wc -l out/results;
