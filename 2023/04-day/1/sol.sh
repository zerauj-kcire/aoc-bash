#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

input="input.txt";
# input="try";

max=$(wc -l $input --total=only);

cut -d":" $input -f2 > out/newin;

for num in $(seq -w $max); do
	head -$num out/newin | tail -1 | grep -o "\<[[:digit:]]\+\>" > out/card-$num;
done

for file in out/card-*; do
	sort $file | uniq -d | wc -l >> out/pow;
done

grep -v "^0$" out/pow | gawk '{s+=2^($1-1)} END {print s}' | numfmt --grouping;

# rm -r out;
