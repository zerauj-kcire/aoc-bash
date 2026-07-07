#!/bin/bash

rm -r out;
mkdir out;

for line in $(cat input.txt); do
	sline=$(echo -e "$line" | sed "s/./&\n/g" | sort | tr -d "\n");
	echo $sline >> out/sc;
	rline=$(echo -e "$line" | sed "s/./&\n/g" | sort -r | tr -d "\n");
	echo $rline >> out/rc;
done

nl out/sc -d" " | sort -k 2 > out/gnsort;
nl out/rc -d" " | sort -k 2 -r > out/grsort;
comm out/gnsort out/grsort | less;
