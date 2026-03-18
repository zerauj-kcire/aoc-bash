#!/bin/bash

mkdir -p out/;

grep -oe "\\-\?[[:digit:]]\+" input.txt > out/digits.txt;
# cat out/digits.txt | tr "\n" "+" | sed 's/+$//g;s/+/ "+" /g' > out/mexpr.txt;

sum=0
for line in $(cat out/digits.txt); do
	sum=$((sum + line));
	echo $sum;
done
echo "TOTAL: " $sum; 
echo "TOTAL: " $sum > ans.txt;

# info expr length
# info sed =
