#!/bin/bash

mkdir -p out/;

# cat input.txt | factor
# cut --complement -c8 input.txt | factor;

max=$(cut --complement -c8 input2.txt);

i=0
sum=0
while [ $sum -lt $max ]; do
	i=$((i+1));
	sum=$((sum+i));
	echo $i " : " $sum;
done
echo $i > ans.txt;
