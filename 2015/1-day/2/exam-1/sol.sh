#!/bin/bash

sum=0;

max=$(wc -m input.txt --total=only);
final=0;
for i in $(seq $max); do
	char=$(cut -c$i input.txt);
	[ $char == "(" ] && sum=$((sum+1));
	[ $char == ")" ] && sum=$((sum-1));
	echo $sum;
	[ $sum -eq -1 ] && final=$i && break 1;
done
echo $final;
