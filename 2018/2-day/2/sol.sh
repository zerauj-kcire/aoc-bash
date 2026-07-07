#!/bin/bash

input="input.txt";
rm -r out;
mkdir out;

for i in $(seq $(wc -L --total=only $input)); do
	i=$((i-1));
	sed "s/\(\<[a-z]\{$i\}\).\([a-z]*\>\)/\1\.\2/g" $input >> out/$i;
done

sort out/* | uniq -c | tr -d "\t " | sort -n | tail -1 | tr -d "2.";
