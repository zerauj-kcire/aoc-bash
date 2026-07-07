#!/bin/bash

sum=0;
for i in $(seq 7000); do
	character=$(cut -c$i input.txt);
	[ $character == "(" ] && sum=$((sum+1));
	[ $character == ")" ] && sum=$((sum-1));
	echo "$sum";
	[ $sum -eq -1 ] && echo "POSICION: " $i && break;
done

