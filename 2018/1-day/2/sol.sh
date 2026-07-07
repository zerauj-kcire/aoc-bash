#!/bin/bash

rm -r out;
mkdir -p out;
touch out/hist;

input=$1;
sum=0;
rep="";
max=$(wc -l --total=only $input);
i=0;

while true; do

	echo $sum >> out/hist;
	line=$(( (i % max) + 1)); # first process.
	num=$(sed -n "$line p" $input);
	sum=$((sum+num));
	rep=$(grep "^$sum$" out/hist);
	i=$((i+1)); # final process.

	echo "line: " $line;
	echo "num: " $num;
	echo "SUM: " $sum;
	echo "REP:" $rep;
	echo "i: " $i;
	[ "$rep" != "" ] && break;
	# [ $line -eq $max ] && break;

done
echo "FINAL SUM: $sum"
