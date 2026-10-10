#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

input="input.txt";
# input="ex";

for line in $(cat $input); do
	fp=$(echo $line | tr -d "-" | cut -d"[" -f1);
	sp=$(echo $line | cut -d"[" -f2 | tr -d "]");
	num=$(echo $fp | tail -c4);
	id=$(echo $fp | sed "s/./&\n/g" | head -n-4 | sort | uniq -c | sort -k 1nr,2 | tr -d " " | cut -c2 | tr -d "\n" | head -c5);
	[ $id == $sp ] && echo "$num" >> out/real-ids && echo $line >> out/real-rooms;
	echo done $num;
done

gawk '{s+=$1} END {print s}' out/real-ids | numfmt --grouping;

# rm -r out;
