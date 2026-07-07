#!/bin/bash

max=$(wc -m input.txt --total=only);

x=0;
y=0;
echo "($x,$y)" >> output;
rm output;
for i in $(seq $max); do
	char=$(cut -c$i input.txt);
	[ $char == "^" ] && y=$((y+1));
	[ $char == "<" ] && x=$((x-1));
	[ $char == ">" ] && x=$((x+1));
	[ $char == "v" ] && y=$((y-1));
	echo "($x,$y)" >> output;
	echo "done $i";
done

sort -u output | uniq | wc -l;
