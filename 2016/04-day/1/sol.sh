#!/bin/bash

[ -d out ] && rm -r out;
mkdir out;

# input="input.txt";
input="ex";

for line in $(cat $input); do
	fp=$(echo $line | tr -d "-" | cut -d"[" -f1);
	sp=$(echo $line | cut -d"[" -f2 | tr -d "]");
	num=$(echo $fp | tail -c4);
	echo $fp | sed "s/./&\n/g" | head -n-4 | sort | uniq -c | sort -k 1nr,2 | tr -d " " | cut -c2 | tr -d "\n" | head -c5;
	# the remaining work is to check when the [....] is or not the given by the command.
done

# rm -r out;
