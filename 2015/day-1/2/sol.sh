#!/bin/sh

# find the first time that santa were in the basement.

steps=$(wc -m input.txt | cut -d' ' -f1)

let santa=0;
for i in $(seq $steps); do
	sign=$(cut -c$i input.txt);
	santa=$((santa-1));
	[ "$sign" == "(" ] && santa=$((santa+2));
	echo "Santa is in: " $santa;
	[ "$santa" == -1 ] && echo "Position is: " $i && exit 0;
done;
echo $santa;
# 1783
