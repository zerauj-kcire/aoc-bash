#!/bin/bash

max=$(wc -l input.txt --total=only);

for i in $(seq $max); do
	char=$(cut -c$i input.txt);
	[ $((i % 2)) -eq 1 ] && echo $char >> santa;
	[ $((i % 2)) -eq 0 ] && echo $char >> robot;
	echo "line $i done";
done
