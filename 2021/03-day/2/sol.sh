#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

# instead of give the position in the file with $mid, 
# we should count the most common digits with uniq -c.

# input="input.txt";
input="try";
cols=$(wc -L $input --total=only);

for i in $(seq $cols); do
	cut -c$i $input | sort -n > out/$i;
done

for i in $(seq $cols); do
	uniq -c out/$i | tr -d " \t" | sort -rn > out/count-$i;
done
head out/count-*;
# we should see the join command also, i should use it.
