#!/bin/bash

[ -d out ] && rm -r out;
mkdir -p out;

for num in $(cat input.txt); do
	sum=0;
	while [ $num -ge 0 ]; do
		echo -n "NUM:" $num;
		echo -e "\tSUM:" $sum;
		num=$(expr $num / 3 - 2);
		[ $num -ge 0 ] && sum=$((sum+num));
	done
	echo $sum >> out/reg;
	echo $sum;
done

echo "--- FINALS ---";
final=0;
for item in $(cat out/reg); do
	final=$((final+item));
	echo $final;
done
echo "FINAL FINAL:" $(numfmt --grouping $final);
