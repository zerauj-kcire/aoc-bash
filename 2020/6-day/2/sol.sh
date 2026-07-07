#!/bin/bash

[ -d out ] && rm -r out;
mkdir -p out/grps/;

# input="try";
input="input.txt";
csplit -s $input --suppress-matched '/^$/' {*} -f out/grps/g -n 3;

sum=0;
for file in out/grps/*; do
	num=$(wc -l $file --total=only);
	line=$(head -1 $file);
	for letter in $(echo $line | sed "s/./& /g"); do
		match=$(grep -c "$letter" $file);
		[ $match -eq $num ] && sum=$((sum+1));
	done
	echo "done $file";
done

echo $sum;

