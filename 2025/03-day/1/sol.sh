#!/bin/bash

[ -d out ] && rm -r out;
mkdir -p out/cols;

# input="input.txt";
input="try";

length=$(wc -L $input --total=only);

for line in $(cat $input);  do
	paste -d" " <(echo $line | sed "s/./&\n/g" | uniq) <(seq -w $length) \
		| sort -n | tail -2 | sort -k 2n,2 | cut -d" " -f1 | tr -d "\n" >> out/results;
	echo "" >> out/results;
done

gawk '{s+=$1} END {print s}' out/results | numfmt --grouping;

# rm -r out;
