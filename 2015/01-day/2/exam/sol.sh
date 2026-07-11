#!/bin/bash

max=$(wc -m --total=only input.txt);

position=0;
for i in $(seq $max); do
	character=$(cut -c$i input.txt);

	case $character in
		"(") position=$((position+1));;
		")") position=$((position-1));;
	esac

	echo "$position";
	final=$i;

	if [ "$position" -eq -1 ]; then
		break;
	fi
done

echo $final;
