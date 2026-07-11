#!/bin/bash

max=$(wc -m input.txt --total=only)

sum=0;
for i in $(seq $max); do
	char=$(cut -c$i input.txt);
	[ $char == "(" ] && sum=$((sum+1));
	[ $char == ")" ] && sum=$((sum-1));
	echo $sum;
	[ $sum -eq -1 ] && index=$i && break;

done
echo "el indice es: $index";
