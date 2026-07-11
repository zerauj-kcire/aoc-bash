#!/bin/bash

mkdir -p out;

max=$(wc -l --total=only input.txt);

count=$max;
for i in $(seq $max); do
	line=$(head -$i input.txt | tail -1);
	touch out/words.txt;
	for word in $line; do
		echo "$word" | sed "s/./&\n/g" | sort | tr -d "\n" >> out/words.txt;
		echo "" >> out/words.txt;
	done
	test=$(sort out/words.txt | uniq -c | tr -d " " | sort -r | head -c1);
	[ $test -ge 2 ] && count=$((count - 1));
	cat out/words.txt;
	echo "COUNT: $count";
	rm out/words.txt;
done
