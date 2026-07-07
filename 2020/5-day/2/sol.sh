#!/bin/bash

[ -d out ] && rm -r out;
mkdir -p out/{cols,rows};

sort input.txt > out/sorted;
input="out/sorted";

cut -c1-7 $input | sed "s/^/ibase=2;1000*/g;s/F/0/g;s/B/1/g" > out/cols/cols;
cut -c8-10 $input | sed "s/^/+/g;s/R/1/g;s/L/0/g;s/$/;obase=10/g" > out/rows/rows;

paste -d" " out/cols/cols out/rows/rows | tr -d " " > out/op;

for line in $(cat out/op); do
	echo "$line" | bc >> out/results;
	echo "done $line";
done
# sort -rn out/results | head -1;
sort -rn out/results > out/sr;

# filtration
max=$(wc -l $input --total=only);
head -$((max - 8)) out/sr | tail -$((max - 8*2)) > out/filtered;
seq 54 983 | sort -nr > out/seq;
diff out/seq out/filtered;
